# Fleet Management System

The Fleet Management System is a web application designed to streamline the management of bus routes, schedules, drivers, and helpers for bus companies. This application reduces manual effort by digitizing the information and making it accessible and updatable to authorized personnel.

## Project Overview

This system helps bus companies efficiently manage their operations by keeping track of bus schedules, routes, and personnel, including drivers and helpers. Key features include:

- **Route Management**: Assign and modify routes, track departure times, and optimize scheduling.
- **Bus Management**: Add, update, and delete bus details, and view bus information.
- **Driver and Helper Management**: Register drivers and helpers, track their schedules, leaves, and assignments.
- **Report Generation**: Generate and view detailed reports on routes, bus information, driver assignments, and payroll.

## Features

- **Admin Dashboard**: Provides a centralized view for administrators to manage the fleet, routes, and personnel.
- **User Authentication**: Secure login for both admin and drivers, with specific permissions.
- **Easy Data Retrieval and Update**: Authorized personnel can retrieve or modify bus, driver, and route information.
- **Driver Access**: Drivers can log in to view their schedule, routes, and other essential information.
- **Scalable Architecture**: Built with PHP and MySQL, enabling easy updates and expansion.

## Technology Stack

- **Frontend**: HTML, CSS, JavaScript
- **Backend**: PHP
- **Database**: MySQL (WAMP or XAMPP for local testing)
- **Server**: Apache (via WAMP or XAMPP)

## Project Structure

``plaintext
fleet-management-system/
├── README.md
├── LICENSE
├── requirements.txt
├── .gitignore
├── src/
│   ├── index.php
│   ├── config.php
│   ├── assets/
│   │   ├── css/
│   │   │   └── styles.css
│   │   ├── js/
│   │   │   └── script.js
│   │   └── images/
│   │       └── logo.png
│   └── includes/
│       ├── header.php
│       ├── footer.php
│       └── functions.php
├── templates/
│   ├── admin_dashboard.php
│   ├── driver_dashboard.php
│   ├── register.php
│   ├── login.php
│   └── view_bus.php
└── database/
    └── fleet_management.sql

## Setup Instructions

### Prerequisites

- **WAMP/XAMPP**: Download and install [WAMP](https://www.wampserver.com/en/) or [XAMPP](https://www.apachefriends.org/index.html) to set up a local server environment.
- **MySQL Database**: The project requires MySQL for database management.

### Installation

1. **Clone the Repository**
   ```bash
   git clone https://github.com/yourusername/fleet-management-system.git
   cd fleet-management-system

2. **Database Setup**
   - Import the `fleet_management.sql` file from the `database/` folder into your MySQL server to set up the necessary tables and relationships.
   - To import the database:
     - Open **phpMyAdmin** (usually available at [http://localhost/phpmyadmin](http://localhost/phpmyadmin)).
     - Create a new database named `fleet_management`.
     - Select the database, go to the **Import** tab, and upload the `fleet_management.sql` file.

3. **Configuration**
   - Open the `src/config.php` file and update the database connection settings:

     ```php
     <?php
     $host = 'localhost';
     $dbname = 'fleet_management';
     $username = 'your_username';
     $password = 'your_password';
     ?>
     ```
   - Replace `'your_username'` and `'your_password'` with your MySQL credentials.

4. **Run the Application**
   - Start the **Apache** and **MySQL** services in WAMP/XAMPP.
   - Open a web browser and go to [http://localhost/fleet-management-system/src/index.php](http://localhost/fleet-management-system/src/index.php).

### Usage

1. **Admin Login**: Access the admin dashboard to manage buses, drivers, helpers, and routes.
2. **Driver Login**: Drivers can log in to view their assigned routes and schedules.

### Screenshots

- **Figure 1**: Admin Dashboard
- **Figure 2**: Driver Leave Management

### Future Enhancements

- **Mobile Application**: Develop an Android app for on-the-go access.
- **Offline Access**: Make the application available offline for better accessibility.
- **SMS Notifications**: Automatically send SMS alerts to drivers for schedule updates.
- **Cloud Hosting**: Host the application to make it globally accessible. 

### Requirements

To run the **Fleet Management System** locally, you will need:

- **PHP**: Version 7.4 or later  
  - Ensure PHP is installed and configured in your environment.
- **MySQL**: Version 5.7 or later  
  - Used for storing and managing application data.
- **Apache Server**: Typically included with WAMP or XAMPP for local development.
- **WAMP/XAMPP (Recommended)**: Download and install [WAMP](https://www.wampserver.com/en/) or [XAMPP](https://www.apachefriends.org/index.html) for an all-in-one package containing Apache, MySQL, and PHP.
- **phpMyAdmin**: Included in WAMP/XAMPP; used for managing the MySQL database via a web interface.

## Contributors

- **Varsha V.** - [varshavenkatesh3798@gmail.com](mailto:varshavenkatesh3798@gmail.com)

### License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
