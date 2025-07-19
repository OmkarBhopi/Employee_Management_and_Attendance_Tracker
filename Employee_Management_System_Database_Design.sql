--For creating Departments table
CREATE TABLE Departments (
    dept_id SERIAL PRIMARY KEY ,
    dept_name VARCHAR(100) NOT NULL
);

--For creating Roles table
CREATE TABLE Roles (
    role_id SERIAL PRIMARY KEY ,
    role_name VARCHAR(100) NOT NULL
);

--For creating Employees table
CREATE TABLE Employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(100) NOT NULL,
    dept_id INT REFERENCES Departments(dept_id),
    role_id INT REFERENCES Roles(role_id),
    join_date DATE,
    contact VARCHAR(100)
);

-- Creating Attendance table
CREATE TABLE Attendance (
    attendance_id SERIAL PRIMARY KEY,
    emp_id INT REFERENCES Employees(emp_id),
    login_time TIMESTAMP,
    logout_time TIMESTAMP,
    status VARCHAR(20)
);

-- creating function for automatically set status
CREATE OR REPLACE FUNCTION set_attendance_status()
RETURNS TRIGGER AS $$
BEGIN
    IF EXTRACT(HOUR FROM NEW.login_time) > 9 THEN
        NEW.status := 'Late';
    ELSE
        NEW.status := 'On Time';
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- creating trigger for executing function
CREATE TRIGGER attendance_status_trigger
BEFORE INSERT ON Attendance
FOR EACH ROW
EXECUTE FUNCTION set_attendance_status();

-- function for calculating total work hours
CREATE OR REPLACE FUNCTION total_work_hours(emp INT)
RETURNS INTERVAL AS $$
BEGIN
    RETURN (
        SELECT SUM(logout_time - login_time)
        FROM Attendance
        WHERE emp_id = emp
    );
END;
$$ LANGUAGE plpgsql;
