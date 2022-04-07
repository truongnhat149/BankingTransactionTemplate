DELIMITER //

CREATE PROCEDURE banking_transaction.`SP_Transfer_RollBack`(
    IN senderId INT,
    IN recipientId INT,
    IN transferAmount DECIMAL(12,0),
    OUT message VARCHAR(50)
)

BEGIN

    DECLARE senderCredit DECIMAL(12,0) DEFAULT 0;
    DECLARE fees INT DEFAULT 10;
    DECLARE feesAmount DECIMAL(12,0) DEFAULT 0;
    DECLARE transactionAmount DECIMAL(12,0) DEFAULT 0;
    
    DECLARE _rollback BOOL DEFAULT 0;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET _rollback = 1;
    
    START TRANSACTION;
    
    IF EXISTS (SELECT 1 FROM customers WHERE id = senderId)
	THEN
		IF EXISTS (SELECT 1 FROM customers WHERE id = recipientId)
		THEN
			SELECT balance 
			INTO senderCredit
			FROM customers
			WHERE id = senderId;
            
            SET feesAmount = transferAmount * fees / 100;
            SET transactionAmount = transferAmount + feesAmount;

			IF (senderCredit >= transactionAmount AND transferAmount >= 50) 
            THEN
				SET message = 'Invalid transaction information';
                
					UPDATE customers c
					SET c.balance = c.balance - transactionAmount
					WHERE c.id = senderId;
					
					UPDATE customers c
					SET c.balance = c.balance + transferAmount
					WHERE c.id = recipientId;
				IF _rollback THEN
					ROLLBACK;
				ELSE
					SET message = 'Transfer successful';
					COMMIT;
				END IF;	
			ELSE
				SET message = 'The Sender balance is not enough to make the transfer';
			END IF;
		ELSE 
			SET message = 'Invalid Recipient information';
		END IF;
	ELSE 
		SET message = 'Invalid Sender information';
    END IF;
END//

DELIMITER;

DELIMITER //