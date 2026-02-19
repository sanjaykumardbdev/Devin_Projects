-- Original school library tables

CREATE TABLE IF NOT EXISTS Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL,
    Author VARCHAR(255) NOT NULL,
    ISBN VARCHAR(50) NOT NULL,
    PublishedYear INT
);

CREATE TABLE IF NOT EXISTS Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Loans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    StudentID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

-- New tables for connecting with other libraries

CREATE TABLE IF NOT EXISTS PartnerLibraries (
    PartnerID INT PRIMARY KEY,
    LibraryName VARCHAR(255) NOT NULL,
    ContactPerson VARCHAR(255),
    Phone VARCHAR(50),
    Email VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS BookSharingAgreements (
    AgreementID INT PRIMARY KEY,
    PartnerID INT,
    StartDate DATE,
    EndDate DATE,
    FOREIGN KEY (PartnerID) REFERENCES PartnerLibraries(PartnerID)
);

CREATE TABLE IF NOT EXISTS InterLibraryLoans (
    LoanID INT PRIMARY KEY,
    BookID INT,
    PartnerID INT,
    LoanDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (PartnerID) REFERENCES PartnerLibraries(PartnerID)
);

CREATE TABLE IF NOT EXISTS SharedResources (
    ResourceID INT PRIMARY KEY,
    Description TEXT,
    PartnerID INT,
    FOREIGN KEY (PartnerID) REFERENCES PartnerLibraries(PartnerID)
);