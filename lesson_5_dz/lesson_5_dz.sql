Урок 5. Транзакции и оптимизация запросов
-- 1. Реализовать практические задания на примере других таблиц и запросов.

-- 2. Подумать, какие операции являются транзакционными, и написать несколько примеров с транзакционными запросами.

START TRANSACTION; 
SAVEPOINT stage0; -- ROLLBACK TO stage0;
SELECT
    @emp_no_for_del := employees.emp_no
FROM
    employees
JOIN salaries ON employees.emp_no = salaries.emp_no
WHERE
    salaries.salary =(
    SELECT
        MAX(salaries.salary)
    FROM
        salaries
    WHERE
        salaries.to_date > NOW());
SAVEPOINT stage1; -- ROLLBACK TO stage1;
    DELETE
FROM
    employees
WHERE
    employees.emp_no = @emp_no_for_del;
COMMIT;

-- 3. Проанализировать несколько запросов с помощью EXPLAIN.

EXPLAIN
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

---	---	---	---	---	---	---	---	---

EXPLAIN
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

-- P.S. EXPLAIN + Ctrl-C / Ctrl-V dz_3