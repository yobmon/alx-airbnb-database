create table User(
    user_id serial primary key,
    first_name varchar(50) Not Null unique,
    last_name varchar(50) ,
    email varchar(100) not null unique,
    password_hash varchar(255) not null,
    phonenumber varchar(15) ,
    role ENUM('guest','host','admin') not null,
    created_at timestamp default current_timestamp
)
create table Property(
    property_id serial primary Key,
    host_id INT REFERENCE user(user_id) ON DELETE CASCADE,
    name varchar(50) not Null,
    description varchar not NULL,
    location varchar(50) not NULL,
    pricepernight DECIMAL not NULL,

    created_at timestamp default current_timestamp,

updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP

)

create table Booking(
booking_id serial primary key,
property_id INT REFERENCE Property(property_id) ON DELETE CASCADE,
user_id  INT REFERENCE user(user_id) ON DELETE CASCADE,
 start_date DATE NOT NULL,
end_date DATE NOT NULL,
total_price DECIMAL(10, 2) NOT NULL,    
status  ENUM("pending","confirmed ","canceled") NOT Null,

)
create table payment (
payment_id serial primary key,
booking_id INT REFERENCE Booking(booking_id) ON DELETE CASCADE,
amount DECIMAL not null,
payment_date timestamp default current_timestamp
payment_method ENUM("credit_card","paypal","stripe") NOT Null,



)
create table Review(
 review_id CHAR(36) PRIMARY KEY,              
 
    property_id INT NOT NULL,                      
    user_id INT NOT NULL,                         
    rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
    comment TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

)
CREATE TABLE Message (
    message_id CHAR(36) PRIMARY KEY,              
    sender_id INT NOT NULL,                       
    recipient_id INT NOT NULL,                     
    message_body TEXT NOT NULL,
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
     CONSTRAINT fk_message_sender FOREIGN KEY (sender_id) REFERENCES User(user_id)ON DELETE CASCADE,

    CONSTRAINT fk_message_recipient  FOREIGN KEY (recipient_id) REFERENCES User(user_id) ON DELETE CASCADE
        )