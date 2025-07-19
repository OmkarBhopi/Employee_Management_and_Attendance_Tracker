# Employee Management and Attendance Tracker

This is a SQL-based project developed as part of internship. The goal of this system is to manage employee data and track their attendance efficiently using PostgreSQL and pgAdmin.

# Project Overview

The *Employee Management and Attendance Tracker* system allows HR departments to:
- Store employee and department information.
- Record and monitor daily login/logout times.
- Automatically mark late arrivals.
- Calculate total work hours.
- Generate attendance reports.

# Tools & Technologies Used

- *PostgreSQL* – Relational Database Management
- *pgAdmin* – Database GUI for PostgreSQL
- *Python (Faker)* – Used to generate dummy data (200 employees + 600 attendance records)
- *SQL Scripts* – For table creation, triggers, and reporting

# Database Schema

# Tables
- Department(dept_id, dept_name)
- Roles(role_id, role_name)
- Employees(emp_id, emp_name, dept_id, role_id, join_date, contact)
- Attendance(attendance_id, emp_id, login_time, logout_time)

# Features Implemented

-  Inserted 200 employee records and 600 attendance logs (3 days/employee)
-  Triggers to auto-mark late arrivals (after 9:00 AM)
-  Functions to calculate total working hours per employee
-  Monthly attendance reports using GROUP BY
-  Late arrival report
-  Normalized schema with foreign key constraints
