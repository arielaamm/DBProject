-- Create CUSTOMER_PROJECT table
CREATE TABLE CUSTOMER_PROJECT (
    customer_id NUMBER(38) NOT NULL,
    project_id NUMBER(38) NOT NULL,
    PRIMARY KEY (customer_id, project_id),
    FOREIGN KEY (customer_id) REFERENCES CUSTOMERS(customerid),
    FOREIGN KEY (project_id) REFERENCES PROJECTS(project_id)
);

-- Add foreign key to CUSTOMERS table
ALTER TABLE CUSTOMERS
ADD manager_id NUMBER(38);

-- Add foreign key to SUPPORT_TICKET table
ALTER TABLE SUPPORT_TICKET
ADD manager_id NUMBER(38);

-- Add foreign key to OFFICETECHNICIANS table
ALTER TABLE OFFICETECHNICIANS
ADD manager_id NUMBER(38);

-- Insert data into new tables (optional, replace with actual data)
INSERT INTO MANAGERS (manager_id, first_name, last_name, email, phone, department_id, project_id, hire_date)
VALUES (1, 'John', 'Doe', 'john.doe@example.com', '123-456-7890', 1, 1, TO_DATE('2020-01-01', 'YYYY-MM-DD'));

INSERT INTO DEPARTMENTS (department_id, department_name)
VALUES (1, 'Engineering');

INSERT INTO CUSTOMERS (customerid, name, contactnumber, email, address, industrytype, manager_id)
VALUES (1, 'ABC Corp', '555-1234', 'contact@abccorp.com', '123 Main St', 'Aerospace', 1);

INSERT INTO PROJECTS (project_id, project_name, start_date, end_date)
VALUES (1, 'Project Apollo', TO_DATE('2020-01-01', 'YYYY-MM-DD'), TO_DATE('2021-12-31', 'YYYY-MM-DD'));

INSERT INTO CUSTOMER_PROJECT (customer_id, project_id)
VALUES (1, 1);
