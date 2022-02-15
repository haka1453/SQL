--- DAWSQL SOLUTION OF ASSIGNMENT 1 (22.10.2021)



CREATE DATABASE TRAINING

USE TRAINING


CREATE TABLE ASSIGNMENT1
(
Sender_ID int,
Reciever_ID int,
Amount int,
Transaction_date date
);

-- 1.WAY
SELECT * FROM [dbo].[ASSIGNMENT1]

-- 2.WAY
SELECT * FROM ASSIGNMENT1

INSERT INTO ASSIGNMENT1 (Sender_ID, Reciever_ID, Amount, Transaction_date)
VALUES (10, 100, 1000, '2021-10-22')

--- YOU CAN INSERT DATA MORE THAN 1 VALUES TO SAME COLUMN
INSERT INTO ASSIGNMENT1 (Sender_ID)
VALUES (11),(22), (22), (23)

--- DROP TABLLE AND THEN CREATE AGAIN
DROP TABLE ASSIGNMENT1

---- INSERT DATA TO OUR TABLE
INSERT INTO ASSIGNMENT1 (Sender_ID, Reciever_ID, Amount, Transaction_date)
VALUES (55, 22, 500, '2021-05-18'),
(11, 33, 350, '2021-05-19'),
(22, 11, 650, '2021-05-19'),
(22, 33, 900, '2021-05-20'),
(33, 11, 500, '2021-05-21'),
(33, 22, 750, '2021-05-21'),
(11, 44, 300, '2021-05-22')
;

--- HOW MUCH MONEY OR AMOUNT SEND THE EACH CUSTOMER
SELECT Sender_ID, sum(Amount) as send_amount
FROM ASSIGNMENT1
GROUP BY Sender_ID

---- how much money the receiver take 
SELECT Reciever_ID, sum(Amount) as receive_amount
FROM ASSIGNMENT1
GROUP BY Reciever_ID


SELECT *
FROM 
	(SELECT Sender_ID, sum(Amount) as send_amount
	FROM ASSIGNMENT1
	GROUP BY Sender_ID) A
	FULL OUTER JOIN
	(SELECT Reciever_ID, sum(Amount) as receive_amount
	FROM ASSIGNMENT1
	GROUP BY Reciever_ID) B
ON A.Sender_ID = B.Reciever_ID





SELECT COALESCE (Sender_ID, Reciever_ID) Account_ID,
		COALESCE(receive_amount, 0) - COALESCE(send_amount, 0) as net_change
FROM 
	(SELECT Sender_ID, sum(Amount) as send_amount
	FROM ASSIGNMENT1
	GROUP BY Sender_ID) A
	FULL OUTER JOIN
	(SELECT Reciever_ID, sum(Amount) as receive_amount
	FROM ASSIGNMENT1
	GROUP BY Reciever_ID) B
ON A.Sender_ID = B.Reciever_ID
order by net_change DESC



