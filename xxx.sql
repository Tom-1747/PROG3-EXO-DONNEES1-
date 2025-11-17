CREATE TABLE Team (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
);

CREATE TABLE Employee (
    id SERIAL PRIMARY KEY,
    firtst_name VARCHAR(100) NOT NULL,
    last_name VARCHAR (100) NOT NULL,
    contract_type VARCHAR (50) NOT NULL,
    salary INT,
    team_id INTEGER REFERENCES Team(id)
);

CREATE TABLE Leave (
    id SERIAL PRIMARY KEY,
    start_date DATE NOT NULL,
    end_date Dte NOT NULL,
    employee_id INTEGER REFERENCES Employee(id)
);

SELECT id, first_name, last_name 
FROM Employee 
WHERE team_id IS NULL;


SELECT id, first_name, last_name
FROM Employee
LEFT JOIN Leave ON Employee.id = Leave.employee_id
WHERE Leave.id IS NULL;


SELECT id, start_date, end_date, Employee.first_name, Employee.last_name, Team.name
FROM Leave 
JOIN Employee ON Leave.employee_id = Employee.id
LEFT JOIN Team ON Employee.team_id = Team.id;

SELECT contract_type, COUNT(Employee.id) as nombre_employes
FROM Employee
GROUP BY Employee.contract_type;


SELECT COUNT (DISTINCT Employee.id) as nombre_en_conge
FROM Employee
JOIN Leave ON Employee.id = Leave.employee_id
WHERE CURRENT_DATE BETWEEN Leave.start_date AND Leave.end_date;


SELECT id, first_name, last_name, Team.name
FROM Employee
JOIN Leave ON Employee.id = Leave.employee_id
LEFT JOIN Team ON Employee.team_id = Team.id
WHERE CURRENT_DATE BETWEEN Leave.start_date AND Leave.end_date;