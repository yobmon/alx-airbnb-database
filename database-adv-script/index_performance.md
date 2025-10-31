# 🧠 PostgreSQL Indexing & Query Performance Example

This guide demonstrates how to create and test indexes in PostgreSQL for better query performance.

---

## 📘 What Is an Index?

An **index** is like a *shortcut* or *lookup table* that helps PostgreSQL find data faster — similar to the index at the back of a textbook.

Without an index, PostgreSQL scans **every row** (a **sequential scan**) to find a match.  
With an index, it can jump straight to the right rows (an **index scan**), which is much faster for large tables.

---

## ⚙️ 1. Creating Indexes

### Create index on `User.first_name`

```sql
CREATE INDEX idx_firname ON "User"(first_name);
