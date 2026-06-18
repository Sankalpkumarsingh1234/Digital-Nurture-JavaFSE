CREATE TABLE Customers (
    CustomerID NUMBER,
    Name VARCHAR2(50),
    Age NUMBER,
    Balance NUMBER,
    IsVIP VARCHAR2(10)
);

CREATE TABLE Loans (
    LoanID NUMBER,
    CustomerID NUMBER,
    InterestRate NUMBER,
    DueDate DATE
);
INSERT INTO Customers VALUES (101,'John',65,15000,'FALSE');
INSERT INTO Customers VALUES (102,'Smith',45,8000,'FALSE');
INSERT INTO Customers VALUES (103,'David',70,20000,'FALSE');

INSERT INTO Loans VALUES (201,101,10,DATE '2026-07-15');
INSERT INTO Loans VALUES (202,102,12,DATE '2026-08-10');
INSERT INTO Loans VALUES (203,103,11,DATE '2026-07-20');

COMMIT;
DECLARE
BEGIN
    FOR cust IN (
        SELECT CustomerID
        FROM Customers
        WHERE Age > 60
    )
    LOOP
        UPDATE Loans
        SET InterestRate = InterestRate - 1
        WHERE CustomerID = cust.CustomerID;

        DBMS_OUTPUT.PUT_LINE(
            'Discount applied for Customer ID: '
            || cust.CustomerID
        );
    END LOOP;

    COMMIT;
END;
/
DECLARE
BEGIN
    FOR cust IN (
        SELECT CustomerID
        FROM Customers
        WHERE Balance > 10000
    )
    LOOP
        UPDATE Customers
        SET IsVIP = 'TRUE'
        WHERE CustomerID = cust.CustomerID;

        DBMS_OUTPUT.PUT_LINE(
            'Customer promoted to VIP: '
            || cust.CustomerID
        );
    END LOOP;

    COMMIT;
END;
/
DECLARE
BEGIN
    FOR loan_rec IN (
        SELECT c.Name,
               l.LoanID,
               l.DueDate
        FROM Customers c
        JOIN Loans l
        ON c.CustomerID = l.CustomerID
        WHERE l.DueDate BETWEEN SYSDATE
                            AND SYSDATE + 30
    )
    LOOP
        DBMS_OUTPUT.PUT_LINE(
            'Reminder: Dear '
            || loan_rec.Name
            || ', Loan '
            || loan_rec.LoanID
            || ' is due on '
            || TO_CHAR(loan_rec.DueDate,'DD-MON-YYYY')
        );
    END LOOP;
END;
/
