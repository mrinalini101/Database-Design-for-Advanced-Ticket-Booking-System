
# 🚍 **Bus Reservation System**

## Overview
Welcome to the **Bus Reservation System**! This project aims to provide a comprehensive solution for managing bus bookings, schedules, and user interactions. Built with **Java** for the backend and **MySQL** for database management, this system supports key functionalities such as user authentication, bus schedule management, booking, and payment processing.

### Key Features:
- **User Management:**
  - Support for different user roles (admin, passenger).
  - Registration, login, and profile management.
- **Bus Management:**
  - Admins can add, update, or remove bus details and manage bus availability.
- **Booking System:**
  - Passengers can book, view, and cancel bus tickets.
  - Seat availability management to prevent double booking.
- **Real-time Analytics:**
  - Get insights into revenue, booking statistics, and active buses.
  - View passenger counts by route and time.
- **Payment Integration:**
  - Secure payment handling for booking confirmations.
  - Payment status updates and transaction history.
- **Review System:**
  - Passengers can rate buses and leave reviews after their journey.

## Database Schema
This system uses a well-organized relational database consisting of the following core tables:
1. **Users:** Stores user information for passengers and admins.
2. **Buses:** Holds data on bus details and current status.
3. **Routes:** Contains origin and destination cities for each bus.
4. **Schedule:** Manages bus schedules including departure and arrival times.
5. **Bookings:** Tracks all booking transactions and statuses.
6. **Payments:** Logs all payment transactions and statuses.
7. **Reviews:** Stores passenger feedback and ratings for buses.
8. **Alerts:** Sends notifications regarding bus status changes.

## Installation

### Prerequisites:
- **Java** (for backend implementation)
- **MySQL** (for database management)
- **JDBC** (for connecting Java with MySQL)

### Steps to Set Up:
1. **Clone the Repository:**
   ```bash
   git clone https://github.com/yourusername/Bus-Reservation-System.git
   cd Bus-Reservation-System
   ```

2. **Setup Database:**
   - Create a new database using the `database_schema.sql` file.
   - Run the schema to create all the required tables.
   ```sql
   source database_schema.sql;
   ```

3. **Add Stored Procedures and Triggers:**
   - Use `stored_procedures.sql` and `triggers.sql` to manage seat bookings and cancellations automatically.
   ```sql
   source stored_procedures.sql;
   source triggers.sql;
   ```

4. **Create Views and Analytics:**
   - Use `views_and_analytics.sql` to create views that allow admins to generate reports.
   ```sql
   source views_and_analytics.sql;
   ```

5. **Configure Java Application:**
   - Ensure the database connection details (username, password) are properly set in your Java application.
   - Use JDBC to connect to the MySQL database.

6. **Run the Application:**
   - Compile and run the Java project. The system will allow users to interact via a command-line or GUI interface, depending on your setup.

## Usage

### Sample Queries:
Use these queries to test the system and get valuable insights:
```sql
-- Fetch available buses from Delhi to Jaipur
SELECT * FROM buses
JOIN schedule ON buses.bus_id = schedule.bus_id
WHERE schedule.from_city = 'Delhi' AND schedule.to_city = 'Jaipur';

-- Get passenger booking history for a specific user
SELECT * FROM bookings b
JOIN schedule s ON b.schedule_id = s.schedule_id
WHERE b.user_id = 1 AND b.status = 'booked';

-- View daily revenue
SELECT * FROM revenue_by_date WHERE date = '2025-05-01';

-- Get active buses and booking details
SELECT * FROM active_buses_and_bookings;
```

### Example of a Bus Schedule Query:
```sql
SELECT * FROM schedule
JOIN buses ON buses.bus_id = schedule.bus_id
JOIN routes ON routes.route_id = schedule.route_id
WHERE routes.from_city = 'Bangalore' AND routes.to_city = 'Mysore';
```

## Contribution

We welcome contributions! If you'd like to contribute to this project, please follow these steps:

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-name`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin feature-name`).
5. Open a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.



For any questions or suggestions, feel free to reach out to us:


---

Thanks for checking out the **Bus Reservation System**! We hope it helps you efficiently manage bus reservations, payments, and analytics. Happy coding! ✨
