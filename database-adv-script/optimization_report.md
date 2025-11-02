# ⚙️ Booking System SQL Optimization Report

## 📄 Overview
This report documents the optimization process and performance improvements applied to the **Booking Management System** database, with a specific focus on:
- Slow query execution on the `booking` table.
- Excessive full-table scans and high I/O.
- Lack of selective indexing and query tuning.

---

## 🎯 Objective
Improve the performance, scalability, and maintainability of the system by:
- Reducing query execution time.
- Optimizing join operations between `booking`, `user`, and `property` tables.
- Introducing indexing and partitioning strategies.

---

## 🔍 1. Problem Description

### Symptoms
- Queries joining `booking`, `user`, and `property` tables were slow.
- Frequent full-table scans on the large `booking` table.
- High disk I/O and CPU usage under reporting workloads.
- Increasing data volume (millions of booking records).

### Example of Slow Query
```sql
SELECT b.*, u.first_name, u.last_name, u.email, u.phonenumber,
       p.name, p.description, p.location
FROM booking b
LEFT JOIN "User" u ON u.user_id = b.user_id
LEFT JOIN property p ON p.property_id = b.property_id;
