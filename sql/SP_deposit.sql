DELIMITER //

CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_Deposit`(
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

		IF (transactionAmount > 0) THEN
			UPDATE customers c
            SET c.balance = credit + transactionAmount
            WHERE c.id = customerId;
            SET message = 'Deposit successful';
		ELSE
			SET message = 'Customer balance is not enough to make a deposit';
		END IF;
	ELSE 
		SET message = 'Invalid customer information';
    END IF;
END //

DELIMITER ;

DELIMITER //