-- Create the database
CREATE DATABASE student;
GO

-- Use the student database
USE student;
GO

-- Create the users table
CREATE TABLE users (
    id INT PRIMARY KEY IDENTITY(1,1),
    full_name NVARCHAR(100) NOT NULL,
	date_of_birth DATE NOT NULL,
	gender VARCHAR(1) NOT NULL,
    phone VARCHAR(15) NOT NULL,
	email VARCHAR(255) NOT NULL,
	profile_image NVARCHAR(255)
);
