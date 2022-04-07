
DELIMITER //

CREATE PROCEDURE banking_transaction.`SP_Withdraw_2`(
    IN customerId INT,
    IN transactionAmount DECIMAL,
    OUT message VARCHAR(50)
)
BEGIN
    DECLARE credit DECIMAL(12,0) DEFAULT 0;
    
    IF EXISTS (SELECT 1 FROM customers WHERE id = customerId)
	THEN
		SELECT balance 
		INTO credit
		FROM customers
		WHERE id = customerId;

		IF (credit >= transactionAmount AND transactionAmount >= 50) THEN
			UPDATE customers c
            SET c.balance = credit - transactionAmount
            WHERE c.id = customerId;
            SET message = 'Withdrawal successful';
		ELSE
			SET message = 'Customer balance is not enough to make a withdrawal';
		END IF;
	ELSE 
		SET message = 'Invalid customer information';
    END IF;
END //

DELIMITER ;

DELIMITER //