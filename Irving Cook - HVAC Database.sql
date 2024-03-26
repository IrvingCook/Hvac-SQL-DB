DROP Schema IF EXISTS 'hvac_db';

Create Schema 'hvac_db';

--Creating a Hvac technician table
CREATE TABLE technician (
    employee_id INT PRIMARY KEY,
    last_name VARCHAR(25),
    first_name VARCHAR(12),
    street_address VARCHAR(35),
    city VARCHAR(20),
    state_loc VARCHAR(20),
    zip_code VARCHAR(5),
    email_address VARCHAR(25),
    position_desc VARCHAR(255),
    hire_date DATE,
    pay_rate DECIMAL(10,2),
    bonus DECIMAL(10,2),
    raise_date DATE,
    manager_id INT,
    area_of_service VARCHAR(30),
    main_office_location VARCHAR(30)

);

--Creating customer Table
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(25),
    customer_address VARCHAR(30),
    customer_city VARCHAR(25),
    customer_state VARCHAR(30),
    customer_zip_code VARCHAR(5),
    customer_email_address VARCHAR(35)
);

--Creating service Table
CREATE TABLE Service (
    service_id INT PRIMARY KEY,
    service_description VARCHAR(255),
    service_cost DECIMAL(10,2)

);

--Creating part Table
CREATE TABLE part (
    item_id INT PRIMARY KEY,
    item_description VARCHAR(255),
    item_cost DECIMAL(10,2)
);

--Creating invoice Table
CREATE TABLE invoice (
    invoice_number INT PRIMARY KEY,
    invoice_description VARCHAR(255),
    invoice_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- Adding data to Hvac technician table
INSERT INTO technician
(employee_id, last_name, first_name, street_address, city, state_loc, zip_code, email_address, position_desc, hire_date, pay_rate, bonus, raise_date, manager_id, area_of_service, main_office_location)
VALUES
(112067,'Doe', 'jane', '672 Acme dr', 'Camden', 'Nj', '75604', 'JaneDoe@gmail.com', 'Senior Technician', '2022-01-02', 25.00, 100.00, '2022-10-12', NULL, 'HVAC Heating', 'Centre St Office'),
(112068,'Hattan', 'Ricky', '589 Winters ln', 'Camden', 'Nj', '75608', 'RickyHattan@gmail.com', 'Senior Technician', '2021-01-02', 25.90, 100.00, '2022-08-11', NULL, 'HVAC Cooling', 'Centre St Office'),
(112063,'Hook', 'Lemmy', '891 Forest  dr', 'Camden', 'Nj', '75607', 'LemmyHook@gmail.com', 'Senior Technician', '2021-02-02', 25.00, 100.00, '2022-05-06', NULL, 'HVAC Heating', 'Centre St Office'),
(112064,'Lazard', 'Allen', '7930 Sligo dr', 'Camden', 'Nj', '75610', 'AllenLazard@gmail.com', 'Junior Technician', '2023-01-02', 22.10, 25.00, '2024-01-01', NULL, 'HVAC Cooling', 'Water St Office');

--Adding To the Customer Info Table
INSERT INTO Customer
(customer_id, customer_name,customer_address, customer_city, customer_state, customer_zip_code, customer_email_address)
VALUES
(1, 'IDF Inc.', '200 Company Rd', 'Camden', 'NJ', '75604', 'reachme@IDFInc.com'),
(2, 'Alpha Corp', '600 Business dr', 'Camden', 'NJ', '75605', 'reachme@AplhaCorp.com'),
(3, 'Zane Inc', '400 Menlow Park dr', 'Camden', 'NJ', '75604', 'Reachme@ZaneInc.com'),
(4, 'Gamma Co', '554 Stone dr', 'Camden', 'NJ', '75601', 'Reachme@GammaCo.com');

--Adding to the Service table
INSERT INTO Service
(service_id, service_description, service_cost)
VALUES
(1, 'Hvac Installation', 350.00),
(2, 'System Check Up', 125.69),
(3, 'Hvac Replacement', 550.00),
(4, 'Emergency Repair', 250.00);

--Adding to the Part table
INSERT INTO part
(item_id, item_description, item_cost)
VALUES
(1, 'Thermostat', 80.00),
(2, 'Filter', 36.00),
(3, 'Compressor', 150.00),
(4, 'Intake Fan', 80.00);

--Adding to the invoice table (Assumption Is that parts and Services could be merged with some sort of function, for simple output this just services)
INSERT INTO invoice
(invoice_number, invoice_description, invoice_date)
VALUES
(1011, 'Hvac Installatiom For IDF Inc.', '2023-01-01'),
(1012, 'System Check Up For Alpha Corp.', '2023-02-02'),
(1013, 'Hvac Replacement For Zane Inc.', '2023-03-03'),
(1014, 'Emergency Repair For Gamma Co.', '2023-04-04');