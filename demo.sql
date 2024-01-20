-- Sample Code for Relational Database Row Population

SELECT * FROM Customers;
DELETE FROM Customers;

SELECT * FROM DVD_Movies;
DELETE FROM DVD_Movies;

INSERT INTO Customers (cus_ID, username, password, plan_id, created, active)
VALUES ('1', 'Tom', '12345678', '1', '2024-01-25 23:59:59', '1');

INSERT INTO DVD_Movies (DVD_Movies_ID, Title, runtime, created, body)
VALUES (1, 'The Greatest Showman', 105, '2017-12-20 18:59:59', '1');
