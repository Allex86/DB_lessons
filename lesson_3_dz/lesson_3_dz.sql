-- База данных «Страны и города мира».
-- 1. Сделать запрос, в котором мы выберем все данные о городе – регион, страна.
SELECT
    *
FROM
    geodata._cities
LEFT JOIN(
        geodata._regions,
        geodata._countries
    )
ON
    (
        _cities.region_id = _regions.id AND _cities.country_id = _countries.id
    )
WHERE
    _cities.title = 'Владивосток'

-- 2. Выбрать все города из Московской области.
SELECT
    *
FROM
    geodata._cities
LEFT JOIN(
        geodata._regions,
        geodata._countries
    )
ON
    (
        _cities.region_id = _regions.id AND _cities.country_id = _countries.id
    )
WHERE
    _regions.title = 'Московская область'

-- База данных «Сотрудники».
-- 1. Выбрать среднюю зарплату по отделам.
SELECT department_id, AVG(salary) FROM geekbrains.employee GROUP BY department_id

-- 2. Выбрать максимальную зарплату у сотрудника.
SELECT MAX(salary) FROM geekbrains.employee
SELECT * FROM geekbrains.employee WHERE salary = (SELECT MAX(salary) FROM geekbrains.employee)

-- 3. Удалить одного сотрудника, у которого максимальная зарплата.
---
DELETE FROM geekbrains.employee WHERE EXISTS (SELECT MAX(salary) FROM geekbrains.employee)
---

-- 4. Посчитать количество сотрудников во всех отделах.
SELECT department_id, COUNT(id) FROM geekbrains.employee GROUP BY department_id

-- 5. Найти количество сотрудников в отделах и посмотреть, сколько всего денег получает отдел.
(SELECT COUNT(id) FROM geekbrains.employee GROUP BY department_id)
UNION
(SELECT SUM(salary) FROM geekbrains.employee GROUP BY department_id)
