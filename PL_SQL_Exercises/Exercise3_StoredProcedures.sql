SET SERVEROUTPUT ON;

--------------------------------------------------
-- DROP TABLES (Ignore errors if tables don't exist)
--------------------------------------------------

DROP TABLE Accounts;
DROP TABLE Employees;

--------------------------------------------------
-- CREATE TABLES
--------------------------------------------------

CREATE TABLE Accounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    AccountType VARCHAR2(20),
    Balance NUMBER(10,2)
);

CREATE TABLE Employees (
    EmployeeID NUMBER PRIMARY KEY,
    EmployeeName VARCHAR2(50),
    DepartmentID NUMBER,
    Salary NUMBER(10,2)
);

--------------------------------------------------
-- INSERT SAMPLE DATA
--------------------------------------------------

INSERT INTO Accounts VALUES (1001, 1, 'SAVINGS', 10000);
INSERT INTO Accounts VALUES (1002, 2, 'SAVINGS', 5000);
INSERT INTO Accounts VALUES (1003, 3, 'CURRENT', 15000);

INSERT INTO Employees VALUES (1, 'John', 101, 50000);
INSERT INTO Employees VALUES (2, 'Smith', 101, 60000);
INSERT INTO Employees VALUES (3, 'David', 102, 45000);

COMMIT;

--------------------------------------------------
-- SCENARIO 1
-- PROCESS MONTHLY INTEREST
--------------------------------------------------

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest
AS
BEGIN

    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'SAVINGS';

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        '1% Interest Applied Successfully'
    );

END;
/

--------------------------------------------------
-- EXECUTE PROCEDURE
--------------------------------------------------

BEGIN
    ProcessMonthlyInterest;
END;
/

--------------------------------------------------
-- CHECK RESULT
--------------------------------------------------

SELECT * FROM Accounts;

--------------------------------------------------
-- SCENARIO 2
-- UPDATE EMPLOYEE BONUS
--------------------------------------------------

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus(
    p_department_id IN NUMBER,
    p_bonus_percent IN NUMBER
)
AS
BEGIN

    UPDATE Employees
    SET Salary = Salary +
                 (Salary * p_bonus_percent / 100)
    WHERE DepartmentID = p_department_id;

    COMMIT;

    DBMS_OUTPUT.PUT_LINE(
        'Employee Bonus Updated Successfully'
    );

END;
/

--------------------------------------------------
-- EXECUTE PROCEDURE
--------------------------------------------------

BEGIN
    UpdateEmployeeBonus(101,10);
END;
/

--------------------------------------------------
-- CHECK RESULT
--------------------------------------------------

SELECT * FROM Employees;

--------------------------------------------------
-- SCENARIO 3
-- TRANSFER FUNDS
--------------------------------------------------

CREATE OR REPLACE PROCEDURE TransferFunds(
    p_from_account IN NUMBER,
    p_to_account IN NUMBER,
    p_amount IN NUMBER
)
AS

    v_balance NUMBER;

BEGIN

    SELECT Balance
    INTO v_balance
    FROM Accounts
    WHERE AccountID = p_from_account;

    IF v_balance >= p_amount THEN

        UPDATE Accounts
        SET Balance = Balance - p_amount
        WHERE AccountID = p_from_account;

        UPDATE Accounts
        SET Balance = Balance + p_amount
        WHERE AccountID = p_to_account;

        COMMIT;

        DBMS_OUTPUT.PUT_LINE(
            'Transfer Successful'
        );

    ELSE

        DBMS_OUTPUT.PUT_LINE(
            'Insufficient Balance'
        );

    END IF;

END;
/

--------------------------------------------------
-- EXECUTE PROCEDURE
--------------------------------------------------

BEGIN
    TransferFunds(1001,1002,500);
END;
/

--------------------------------------------------
-- CHECK RESULT
--------------------------------------------------

SELECT * FROM Accounts;
