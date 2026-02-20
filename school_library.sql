-- School Library Management System SQL

-- 1. Create Tables
CREATE TABLE authors (
    author_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL
);

CREATE TABLE books (
    book_id NUMBER PRIMARY KEY,
    title VARCHAR2(200) NOT NULL,
    author_id NUMBER REFERENCES authors(author_id),
    publication_year NUMBER,
    isbn VARCHAR2(20) UNIQUE
);

CREATE TABLE members (
    member_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    membership_date DATE DEFAULT SYSDATE
);

CREATE TABLE loans (
    loan_id NUMBER PRIMARY KEY,
    member_id NUMBER REFERENCES members(member_id),
    book_id NUMBER REFERENCES books(book_id),
    loan_date DATE DEFAULT SYSDATE,
    return_date DATE
);

-- 2. Create Sequences
CREATE SEQUENCE author_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE book_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE member_seq START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE loan_seq START WITH 1 INCREMENT BY 1;

-- 3. Create Indexes
CREATE INDEX idx_book_title ON books(title);

-- 4. Package Specification
CREATE OR REPLACE PACKAGE library_pkg AS
    PROCEDURE add_author(p_name VARCHAR2);
    PROCEDURE add_book(p_title VARCHAR2, p_author_id NUMBER, p_year NUMBER, p_isbn VARCHAR2);
    FUNCTION get_author_books(p_author_id NUMBER) RETURN SYS_REFCURSOR;
END library_pkg;

-- 5. Package Body
CREATE OR REPLACE PACKAGE BODY library_pkg AS
    PROCEDURE add_author(p_name VARCHAR2) IS
    BEGIN
        INSERT INTO authors(author_id, name) VALUES (author_seq.NEXTVAL, p_name);
    END add_author;

    PROCEDURE add_book(p_title VARCHAR2, p_author_id NUMBER, p_year NUMBER, p_isbn VARCHAR2) IS
    BEGIN
        INSERT INTO books(book_id, title, author_id, publication_year, isbn) VALUES (book_seq.NEXTVAL, p_title, p_author_id, p_year, p_isbn);
    END add_book;

    FUNCTION get_author_books(p_author_id NUMBER) RETURN SYS_REFCURSOR IS
        result_cursor SYS_REFCURSOR;
    BEGIN
        OPEN result_cursor FOR SELECT * FROM books WHERE author_id = p_author_id;
        RETURN result_cursor;
    END get_author_books;
END library_pkg;

-- 6. Create Triggers
CREATE OR REPLACE TRIGGER before_insert_loan
BEFORE INSERT ON loans
FOR EACH ROW
BEGIN
    :NEW.loan_id := loan_seq.NEXTVAL;
END;

-- 7. Create Views
CREATE VIEW v_member_loans AS
SELECT m.name AS member_name, b.title AS book_title, l.loan_date, l.return_date 
FROM members m 
JOIN loans l ON m.member_id = l.member_id 
JOIN books b ON l.book_id = b.book_id;

-- 8. Sample Data
INSERT INTO authors(author_id, name) VALUES (1, 'George Orwell');
INSERT INTO books(book_id, title, author_id, publication_year, isbn) VALUES (1, '1984', 1, 1949, '1234567890');
INSERT INTO members(member_id, name) VALUES (1, 'Alice Smith');
INSERT INTO loans(loan_id, member_id, book_id, loan_date) VALUES (1, 1, 1, SYSDATE);