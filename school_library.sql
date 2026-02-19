-- SQL Code for School Library Management System

-- Table for Books
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    Genre VARCHAR(100),
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    PublishedDate DATE
);

-- Table for Members
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    MembershipDate DATE
);

-- Table for Transactions
CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    DateIssued DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Index for quick search
CREATE INDEX idx_author ON Books (Author);

-- Sample Insert Queries
INSERT INTO Books (BookID, Title, Author, Genre, ISBN, PublishedDate) VALUES 
(1, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Fiction', '9780743273565', '1925-04-10'),
(2, '1984', 'George Orwell', 'Dystopian', '9780451524935', '1949-06-08');

INSERT INTO Members (MemberID, Name, Email, Phone, MembershipDate) VALUES 
(1, 'John Doe', 'john@example.com', '1234567890', '2023-02-19'),
(2, 'Jane Smith', 'jane@example.com', '0987654321', '2023-02-19');

INSERT INTO Transactions (TransactionID, BookID, MemberID, DateIssued, DueDate) VALUES 
(1, 1, 1, '2023-02-19', '2023-03-05'),
(2, 2, 2, '2023-02-19', '2023-03-05');
