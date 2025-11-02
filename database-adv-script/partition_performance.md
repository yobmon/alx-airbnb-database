# 📘 Booking Table Partitioning and Performance Guide

## Overview
The `booking` table has grown significantly, causing slow query performance, especially for date-based queries (e.g., filtering by `start_date`).  
To improve performance and scalability, **RANGE partitioning** has been implemented based on the `start_date` column.

---

## 🎯 Objective
Optimize query performance, data maintenance, and indexing efficiency by dividing the large `booking` table into smaller, more manageable partitions.

---

## ⚙️ Partitioning Strategy

### Type
**RANGE Partitioning** — chosen because bookings are naturally time-based.

### Partition Key
`start_date`

### Partition Scheme
Data is split **by year**, so each partition stores bookings for one calendar year.

| Partition Name   | Range Start      | Range End        | Description             |
|------------------|------------------|------------------|-------------------------|
| `booking_2024`   | 2024-01-01       | 2025-01-01       | Bookings for year 2024  |
| `booking_2025`   | 2025-01-01       | 2026-01-01       | Bookings for year 2025  |
| `booking_future` | *DEFAULT*        | *Future dates*   | Catch-all for new years |

---

## 🧱 Implementation Steps

1. **Backup existing data**
   ```sql
   ALTER TABLE booking RENAME TO booking_old;
