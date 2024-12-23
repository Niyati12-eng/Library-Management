**Library Management System**

The Library Management System is a web-based application built using JSP (Java Server Pages) and MySQL. It provides an intuitive interface for managing library books, transactions, and user interactions.

**Features**

**Core Features:**

**Add Books:** Admin can add new books to the library.
**Delete Books:** Admin can delete books by their unique book_id.
**Issue Books:** Admin can issue books to users, updating the issued status and timestamp.
**Return Books:** Admin can mark books as returned, recording the user and return timestamp.
**View Books:** Admin can view all books with transaction details, including issued and returned users.

**Additional Features:**

**About Us:** A dedicated page describing the purpose and mission of the system.
**Contact Us:** A form for users to reach out to the admin.
**Export to Excel:** Download all book and transaction details as an Excel file.
**Stylish Navigation Bar:** Includes links for Home, About Us, Contact Us, and View Books.

**Technologies Used**

**Frontend:** HTML, CSS, JSP
**Backend:** Java (JDBC), MySQL
**Database:** MySQL

**Database Structure**

**1. Books Table (books)**

Stores details of library books.

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    status VARCHAR(50) NOT NULL DEFAULT 'Available'
);

**2. Transactions Table (transactions)**

Tracks book issues and returns.

CREATE TABLE transactions (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    book_id INT NOT NULL,
    issued_to VARCHAR(255),
    issued_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    returned_by VARCHAR(255),
    return_date TIMESTAMP NULL,
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

**3. Contact Us Table (contact_us)**

Stores messages submitted through the Contact Us form.

CREATE TABLE contact_us (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

**Setup Instructions**

**1. Database Configuration**

Create a MySQL database named libraryDB.
Run the SQL scripts above to create the necessary tables.

**2. Application Configuration**

Install a servlet container like Apache Tomcat.
Place all JSP files in the webapps/<project_name> directory.
Update the database connection string in JSP files:

Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/libraryDB", "root", "your_password");

**3. Run the Application**

Start your servlet container (e.g., Tomcat).
Open index.jsp in your browser to begin.

**How to Use**

**Navigation**

**Home:**

Accessible via the navigation bar.
Allows login and management of books.

**About Us:**

Learn about the system's purpose and mission.

**Contact Us:**

Submit inquiries or feedback using a simple form.

**View Books:**

See all books and their transaction history.
Export the records to Excel.
