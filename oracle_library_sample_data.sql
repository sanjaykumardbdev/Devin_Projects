-- Sample data for the authors table
INSERT INTO authors (id, name, birth_year) VALUES
(1, 'Author One', 1970),
(2, 'Author Two', 1980),
(3, 'Author Three', 1990);

-- Sample data for the books table
INSERT INTO books (id, title, author_id, published_year) VALUES
(1, 'Book One', 1, 2000),
(2, 'Book Two', 2, 2005),
(3, 'Book Three', 3, 2010);

-- Sample data for the members table
INSERT INTO members (id, name, membership_date) VALUES
(1, 'Member One', '2022-01-01'),
(2, 'Member Two', '2022-02-01'),
(3, 'Member Three', '2022-03-01');

-- Sample data for the loans table
INSERT INTO loans (id, book_id, member_id, loan_date) VALUES
(1, 1, 1, '2022-04-01'),
(2, 2, 2, '2022-04-02'),
(3, 3, 3, '2022-04-03');