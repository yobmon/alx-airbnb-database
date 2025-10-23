# Airbnb Clone – Database and System Requirements

## 📘 Overview
This project is a simplified clone of **Airbnb**, designed to demonstrate a property rental marketplace system.  
It connects **hosts**, who list their properties, with **guests**, who can search, book, and pay for stays.

The core system supports **user management, property listings, bookings, payments, reviews, and messaging**.

---

## 🎯 Objectives
- Design and implement a relational database for an Airbnb-like platform.
- Ensure the schema follows **Third Normal Form (3NF)** to minimize redundancy.
- Enable the core functionality of:
  - User registration (guests, hosts, admins)
  - Property listing and management
  - Booking and payment processing
  - Review and messaging between users

---

## 🧩 Core Entities and Attributes

### 1. **User**
| Field | Type | Constraints | Description |
|-------|------|--------------|--------------|
| user_id | UUID | PK, Indexed | Unique identifier for each user |
| first_name | VARCHAR | NOT NULL | User’s first name |
| last_name | VARCHAR | NOT NULL | User’s last name |
| email | VARCHAR | UNIQUE, NOT NULL | User’s email address |
| password_hash | VARCHAR | NOT NULL | Encrypted password |
| phone_number | VARCHAR | NULL | Optional phone number |
| role | ENUM('guest', 'host', 'admin') | NOT NULL | Defines user’s role |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | When the account was created |

---

### 2. **Property**
| Field | Type | Constraints | Description |
|-------|------|--------------|--------------|
| property_id | UUID | PK, Indexed | Unique property identifier |
| host_id | UUID | FK → User(user_id) | Host who owns the property |
| name | VARCHAR | NOT NULL | Property title |
| description | TEXT | NOT NULL | Full property description |
| location | VARCHAR | NOT NULL | City, region, or coordinates |
| pricepernight | DECIMAL | NOT NULL | Nightly rate |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Creation timestamp |
| updated_at | TIMESTAMP | ON UPDATE CURRENT_TIMESTAMP | Last update timestamp |

---

### 3. **Booking**
| Field | Type | Constraints | Description |
|-------|------|--------------|--------------|
| booking_id | UUID | PK, Indexed | Unique booking identifier |
| property_id | UUID | FK → Property(property_id) | Booked property |
| user_id | UUID | FK → User(user_id) | Guest making the booking |
| start_date | DATE | NOT NULL | Check-in date |
| end_date | DATE | NOT NULL | Check-out date |
| total_price | DECIMAL | NOT NULL | Total cost for stay |
| status | ENUM('pending', 'confirmed', 'canceled') | NOT NULL | Booking status |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Booking creation timestamp |

---

### 4. **Payment**
| Field | Type | Constraints | Description |
|-------|------|--------------|--------------|
| payment_id | UUID | PK, Indexed | Unique payment identifier |
| booking_id | UUID | FK → Booking(booking_id) | Booking associated with payment |
| amount | DECIMAL | NOT NULL | Amount paid |
| payment_date | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Payment date/time |
| payment_method | ENUM('credit_card', 'paypal', 'stripe') | NOT NULL | Payment channel used |

---

### 5. **Review**
| Field | Type | Constraints | Description |
|-------|------|--------------|--------------|
| review_id | UUID | PK, Indexed | Unique review identifier |
| property_id | UUID | FK → Property(property_id) | Reviewed property |
| user_id | UUID | FK → User(user_id) | Reviewer (guest) |
| rating | INTEGER | CHECK (rating BETWEEN 1 AND 5), NOT NULL | Rating score |
| comment | TEXT | NOT NULL | Guest review comment |
| created_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | When review was written |

---

### 6. **Message**
| Field | Type | Constraints | Description |
|-------|------|--------------|--------------|
| message_id | UUID | PK, Indexed | Unique message identifier |
| sender_id | UUID | FK → User(user_id) | Sender user |
| recipient_id | UUID | FK → User(user_id) | Recipient user |
| message_body | TEXT | NOT NULL | Message content |
| sent_at | TIMESTAMP | DEFAULT CURRENT_TIMESTAMP | Timestamp of message sent |

---

## 🔗 Relationships

| Relationship | Type | Description |
|---------------|------|--------------|
| User ↔ Property | One-to-Many | A host can own multiple properties |
| User ↔ Booking | One-to-Many | A guest can make multiple bookings |
| Property ↔ Booking | One-to-Many | A property can have many bookings |
| Booking ↔ Payment | One-to-One | Each booking has one payment record |
| User ↔ Review | One-to-Many | A user (guest) can post many reviews |
| Property ↔ Review | One-to-Many | A property can receive many reviews |
| User ↔ Message | Many-to-Many | Users can send and receive messages between each other |

---

## ⚙️ Functional Requirements

### 👤 User Management
- Users can register and log in.
- Roles determine access (guest, host, admin).
- Users can update personal information.

### 🏠 Property Management
- Hosts can create, update, and delete property listings.
- Guests can browse and search for properties.
- Each property displays price, description, location, and reviews.

### 📅 Booking System
- Guests can book available properties for specific date ranges.
- Prevent overlapping bookings for the same property.
- Booking statuses: `pending`, `confirmed`, `canceled`.

### 💳 Payment Handling
- Payments are linked to bookings.
- Supported methods: credit card, PayPal, Stripe.
- Payment details are stored securely (no raw card info).

### ✍️ Review System
- Guests can leave one review per completed booking.
- Ratings range from 1–5 stars.
- Reviews are displayed on property pages.

### 💬 Messaging
- Guests and hosts can exchange messages.
- Messages include sender, recipient, content, and timestamp.

---

## ⚡ Non-Functional Requirements
- **Security:** Passwords stored as hashes (bcrypt/argon2). Use parameterized queries to prevent SQL injection.
- **Performance:** Proper indexing on primary and foreign keys for fast lookups.
- **Scalability:** Designed in 3NF to minimize redundancy and optimize storage.
- **Data Integrity:** Enforced with foreign key constraints and cascading deletes.
- **Reliability:** Timestamps for auditing and record history.
- **Portability:** Compatible with PostgreSQL or MySQL.

---

## 🧠 Database Normalization
- All tables satisfy **Third Normal Form (3NF)**:
  - No repeating groups or multi-valued columns.
  - Every non-key attribute depends on the entire primary key.
  - No transitive dependencies between non-key attributes.

---

## 🚀 Future Enhancements
- Add **Property Images** table for multiple images per listing.
- Add **Calendar/Availability** table for blocked dates.
- Add **Host Payouts** and **Service Fees** logic.
- Add **Notifications** (email/SMS) for bookings and messages.
- Add **Admin Dashboard** for moderation and reports.

---

