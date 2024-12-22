CREATE DATABASE LibraryDB;

USE LibraryDB;
drop table books;
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL CHECK (status IN ('Available', 'Checked Out')),
    issued_to VARCHAR(255), -- Optional, NULL if not issued
    issued_at TIMESTAMP NULL DEFAULT NULL -- NULL if not issued
);

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50),
    password VARCHAR(50)
);
-- Insert data into the 'Books' table
INSERT INTO Books (title, author, status) VALUES
('The Catcher in the Rye', 'J.D. Salinger', 'Available'),
('To Kill a Mockingbird', 'Harper Lee', 'Available'),
('1984', 'George Orwell', 'Available'),
('Pride and Prejudice', 'Jane Austen', 'Available'),
('The Great Gatsby', 'F. Scott Fitzgerald', 'Available'),
('Moby Dick', 'Herman Melville', 'Available');
CREATE TABLE contact_us (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    issued_to VARCHAR(255),
    returned_by VARCHAR(255),
    issued_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    return_date TIMESTAMP NULL,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

select * from transactions;
delete from books;
ALTER TABLE books ADD return_date TIMESTAMP NULL;

insert into users (username,password) values('niyati','7890');
alter table books modify column id int ;
select * from books;