
# 🚍 **Bus Reservation System**

## Overview
This Bus Reservation System is a comprehensive solution for managing bus tickets, schedules, routes, and user management. It includes a user-friendly interface, backend with **MySQL** database, and advanced SQL features such as **stored procedures**, **triggers**, and **views** for efficient data management.

### Features:
- **User Management:** Passenger and admin accounts, with registration and login functionality.
- **Bus Management:** Admins can add, remove, and manage bus details, availability, and schedules.
- **Booking System:** Passengers can book, cancel, and manage tickets for various bus routes.
- **Reviews & Ratings:** Passengers can rate and provide feedback on their travel experience.
- **Real-time Analytics:** Admins can view insights like total revenue, passenger counts, and active buses.

## Database Schema
The database consists of the following tables:
- **users:** Stores information about passengers and admins.
- **buses:** Tracks bus details and statuses.
- **routes:** Contains data about bus routes (from and to cities).
- **schedule:** Stores schedule information for each bus.
- **bookings:** Tracks ticket bookings and cancellations.
- **payments:** Handles payment transactions and statuses.
- **reviews:** Collects reviews and ratings from passengers.
- **alerts:** Stores notifications for bus status updates.

## Setup Instructions
1. **Create Database:**
   Use `database_schema.sql` to create the database and all necessary tables.
2. **Add Procedures and Triggers:**
   Execute `stored_procedures.sql` and `triggers.sql` for booking management.
3. **Generate Views and Reports:**
   Use `views_and_analytics.sql` to create views for data analysis.
4. **Test the System:**
   Run the sample queries in `sample_queries.sql` to test the system's functionality.

## Sample Queries
```sql
SELECT * FROM buses
JOIN schedule ON buses.bus_id = schedule.bus_id
WHERE schedule.from_city = 'Delhi' AND schedule.to_city = 'Jaipur';
```

## License
This project is licensed under the MIT License.
