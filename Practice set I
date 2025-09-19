-- Part A
CREATE TABLE IF NOT EXISTS FeePayments (
    payment_id INT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    amount DECIMAL(10,2) CHECK (amount > 0),
    payment_date DATE NOT NULL
);

START TRANSACTION;

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date) VALUES
(1, 'Ashish', 5000.00, '2024-06-01'),
(2, 'Smaran', 4500.00, '2024-06-02'),
(3, 'Vaibhav', 5500.00, '2024-06-03');

COMMIT;

SELECT * FROM FeePayments;

--Part B
START TRANSACTION;

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date) VALUES
(4, 'Kiran', 6000.00, '2024-06-04');
(1, 'Ashish', -2000.00, '2024-06-05');

ROLLBACK;

SELECT * FROM FeePayments;

--Part C
START TRANSACTION;

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date) VALUES
(5, 'Ravi', 4000.00, '2024-06-06');
(6, NULL, 3500.00, '2024-06-07');

ROLLBACK;

SELECT * FROM FeePayments;

--Part D

START TRANSACTION;

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date) VALUES
(7, 'Neha', 7000.00, '2024-06-08');
(1, 'Duplicate', 1000.00, '2024-06-09');

ROLLBACK;

START TRANSACTION;

INSERT INTO FeePayments (payment_id, student_name, amount, payment_date) VALUES
(8, 'Manoj', 6200.00, '2024-06-10');

COMMIT;

SELECT * FROM FeePayments;
