CREATE OR REPLACE PACKAGE library_pkg AS
    PROCEDURE add_book(p_title IN VARCHAR2, p_author IN VARCHAR2);
    PROCEDURE remove_book(p_book_id IN NUMBER);
    FUNCTION get_book(p_book_id IN NUMBER) RETURN VARCHAR2;
END library_pkg;
/

CREATE OR REPLACE PACKAGE BODY library_pkg AS
    PROCEDURE add_book(p_title IN VARCHAR2, p_author IN VARCHAR2) IS
    BEGIN
        -- Implementation to add a book to the library.
    END add_book;

    PROCEDURE remove_book(p_book_id IN NUMBER) IS
    BEGIN
        -- Implementation to remove a book from the library using the book ID.
    END remove_book;

    FUNCTION get_book(p_book_id IN NUMBER) RETURN VARCHAR2 IS
    BEGIN
        -- Implementation to retrieve a book's title by its ID.
        RETURN 'Example Book Title';
    END get_book;
END library_pkg;
/