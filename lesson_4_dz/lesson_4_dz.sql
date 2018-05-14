-- Объединение запросов, хранимые процедуры, триггеры, функции

-- 1. Создать VIEW на основе запросов, которые вы сделали в ДЗ к уроку 3.

-- Средняя зарплата отделов
CREATE OR REPLACE VIEW view_average_salary AS
SELECT
    ROUND(AVG(salary),
    2) AS avg_salary,
    departments.dept_name
FROM
    employees
JOIN salaries ON employees.emp_no = salaries.emp_no
JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE
    salaries.to_date > NOW()
GROUP BY
    departments.dept_no;

SELECT * FROM `view_average_salary`;

---	---	---	---	---	---	---	---	---

-- Сотрудник с максимальной зарплатой
CREATE OR REPLACE VIEW empl_with_max_sal AS
SELECT
    CONCAT(
        employees.first_name,
        ' ',
        employees.last_name
    ) AS full_name,
    salaries.salary
FROM
    employees
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE
    salaries.salary =(
    SELECT
        MAX(salary)
    FROM
        salaries
    WHERE
        to_date > NOW());

SELECT * FROM `empl_with_max_sal`;

---	---	---	---	---	---	---	---	---

-- Посчитать количество сотрудников во всех отделах
CREATE OR REPLACE VIEW empl_in_all_departments AS
SELECT
    COUNT(emp_no) AS employees_quantity,
    departments.dept_name
FROM
    dept_emp
LEFT JOIN departments ON departments.dept_no = dept_emp.dept_no
WHERE
    dept_emp.to_date > NOW()
GROUP BY
    dept_emp.dept_no;

SELECT * FROM `empl_in_all_departments`;



-- 2. Создать функцию, которая найдет менеджера по имени и фамилии.
/* 
CREATE OR REPLACE FUNCTION `search_f_l_name`(`fstnm` VARCHAR(14), `lstnm` VARCHAR(16)) 
RETURNS VARCHAR(255)
RETURN
    (
    SELECT
        CONCAT(
        		departments.dept_name,
        		' ',
        		salaries.salary,
        		' ',
            employees.emp_no,
            ' ',
            employees.birth_date,
            ' ',
            employees.first_name,
            ' ',
            employees.last_name,
            ' ',
            employees.gender,
            ' ',
            employees.hire_date
        )
    FROM
        `employees`
    JOIN salaries ON employees.emp_no = salaries.emp_no
    JOIN dept_emp ON dept_emp.emp_no = employees.emp_no
    JOIN departments ON departments.dept_no = dept_emp.dept_no
    WHERE
        departments.dept_name = 'Quality Management' AND salaries.to_date > NOW() AND first_name = fstnm AND last_name = lstnm);

SELECT `search_f_l_name`('Sumant', 'Peac');

SELECT `search_f_l_name`('Tzvetan', 'Zielinski');
*/

CREATE OR REPLACE FUNCTION `search_f_l_name`(`fstnm` VARCHAR(14), `lstnm` VARCHAR(16)) 
RETURNS VARCHAR(255)
RETURN
    (
    SELECT
        CONCAT(
            employees.emp_no,
            ' ',
            employees.birth_date,
            ' ',
            employees.first_name,
            ' ',
            employees.last_name,
            ' ',
            employees.gender,
            ' ',
            employees.hire_date
        )
    FROM `dept_manager`
    JOIN employees ON employees.emp_no = dept_manager.emp_no
    WHERE
        employees.first_name = fstnm AND employees.last_name = lstnm)

SELECT `search_f_l_name`('Margareta', 'Markovitch');

SELECT `search_f_l_name`('Vishwani', 'Minakawa');


-- 3. Создать триггер, который при добавлении нового сотрудника будет выплачивать ему вступительный бонус в таблицу salary.

CREATE OR REPLACE TRIGGER `add_bonus_5000` AFTER INSERT ON
    `employees` FOR EACH ROW
INSERT INTO `salaries`(emp_no, salary)
VALUES(NEW.emp_no, 5000);