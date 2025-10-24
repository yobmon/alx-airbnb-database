# Airbnb Clone — Normalization Summary (1NF → 3NF)

## 🎯 Purpose

Quick overview of why the Airbnb clone schema meets **Third Normal Form (3NF)**, ensuring minimal redundancy and data integrity.

---

## ✅ Normalization Levels

**1NF (First Normal Form)**
All attributes are atomic (no arrays or repeating groups).

**2NF (Second Normal Form)**
Each table has a single-column primary key (UUID), so no partial dependencies.

**3NF (Third Normal Form)**
No non-key attribute depends on another non-key attribute.

---

## 🧩 Table Summary

### `User`

* **PK:** `user_id`
* Attributes: basic info, `role`, timestamps.
* Satisfies 3NF. Move role-specific details (like host bio/payout info) to a `HostProfile` table if needed.

### `Property`

* **PK:** `property_id`, **FK:** `host_id → User(user_id)`
* All attributes depend on `property_id` only.
* Optional improvements: separate `Address` and `PropertyImage` tables for better structure.

### `Booking`

* **PK:** `booking_id`, **FKs:** `property_id`, `user_id`
* Derived data (`total_price`) acceptable if frozen at booking time.
* Add constraint: `CHECK (end_date > start_date)`.
* Prevent overlapping bookings (via app logic or DB exclusion constraint).

### `Payment`

* **PK:** `payment_id`, **FK:** `booking_id`
* Satisfies 3NF; `booking_id` should be `UNIQUE` to enforce one payment per booking.

### `Review`

* **PK:** `review_id`, **FKs:** `property_id`, `user_id`
* Add `booking_id` for better traceability.
* `CHECK (rating BETWEEN 1 AND 5)`.

### `Message`

* **PK:** `message_id`, **FKs:** `sender_id`, `recipient_id`
* Fully normalized; optional `conversation_id` for grouping threads.

---

## ⚙️ Recommendations

* Normalize `location` into structured fields if needed.
* Add `PropertyImage`, `Availability`, and `HostProfile` tables for scalability.
* Keep sensitive data (payments, passwords) hashed or tokenized.

---

## 🧠 Conclusion

All tables meet **3NF**. Schema is optimized for clarity, integrity, and future scalability. Optional extensions (addresses, images, host details) improve maintainability without breaking normalization.
