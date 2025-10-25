🗃️ Airbnb Clone – Database Schema
📘 Overview

This project defines the SQL database schema for a simplified Airbnb-like application.
It focuses on managing users, their roles, and their basic account information.
The schema can be extended later to include properties, bookings, reviews, and payments.

The file schema.sql contains the SQL commands needed to create the users table, which is the foundation for user management in the system.

🧩 Table: users
Purpose

Stores information about all registered users in the system — including guests, hosts, and administrators.

Structure
Column	Type	Constraints	Description
user_id	CHAR(36)	PRIMARY KEY	Unique user identifier (UUID format)
first_name	VARCHAR(100)	NOT NULL	User’s first name
last_name	VARCHAR(100)	NOT NULL	User’s last name
email	VARCHAR(150)	UNIQUE, NOT NULL	Unique email for login and contact
password_hash	VARCHAR(255)	NOT NULL	Encrypted user password
phone_number	VARCHAR(20)	NULL	Optional phone number
role	ENUM('guest', 'host', 'admin')	NOT NULL	Defines the user’s role type
created_at	TIMESTAMP	DEFAULT CURRENT_TIMESTAMP	Timestamp when the record was created