-- CREATE INDEX statements for library management

-- Index on the books table for faster searches by title
CREATE INDEX idx_books_title ON books(title);

-- Index on the authors table for quick lookup by last name
CREATE INDEX idx_authors_last_name ON authors(last_name);

-- Index on the borrowers table for faster access by email
CREATE INDEX idx_borrowers_email ON borrowers(email);

-- Index on the loans table for efficient retrieval of overdue books
CREATE INDEX idx_loans_due_date ON loans(due_date);

-- Index on the returns table for quick lookup by return date
CREATE INDEX idx_returns_return_date ON returns(return_date);