# 🗂️ SQL Join Examples (PostgreSQL)

This project demonstrates different types of **SQL JOINs** in PostgreSQL using simple, real-world-style tables like **User**, **Booking**, **Property**, and **Review**.

---

## 🧠 What Are JOINs?

In relational databases, data is often split across multiple tables.  
A **JOIN** allows you to combine data from those tables based on a shared column — usually an ID.

There are several types of joins, and this project shows three of the most common:

- **INNER JOIN** → Only rows that exist in *both* tables  
- **LEFT JOIN** → All rows from the *left* table, and matching rows (if any) from the right  
- **FULL OUTER JOIN** → All rows from *both* tables (everything, even if no match)

---

## 🧩 Example Tables

| Table Name | Description |
|-------------|--------------|
| **User** | Stores user information (`user_id`, `first_name`, etc.) |
| **Booking** | Contains booking details (`booking_id`, `user_id`, `status`, etc.) |
| **Property** | Contains property listings (`property_id`, `name`, etc.) |
| **Review** | Stores reviews left by users (`review_id`, `property_id`, `rating`, `comment`, etc.) |

---

## 🧱 1. INNER JOIN — Combine Matching Users and Bookings

```sql
SELECT s.first_name, y.booking_id
FROM "booking" y
INNER JOIN "User" s ON s.user_id = y.user_id;
