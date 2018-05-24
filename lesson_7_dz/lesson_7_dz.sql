-- Урок 7. Обзор движков MySQL, управление и обслуживание. Подготовка к собеседованию.

-- 1. Создать нового пользователя и задать ему права доступа на базу данных «Страны и города мира».

CREATE USER 'NewUser_for_countries_and_cities'@'localhost' IDENTIFIED BY 'newpassword';
GRANT ALL PRIVILEGES ON `countries and cities`.* TO 'NewUser_for_countries_and_cities'@'localhost';
FLUSH PRIVILEGES;

CREATE USER 'NewUser_2_for_countries_and_cities'@'%' IDENTIFIED BY 'newpassword';
GRANT SELECT, INSERT ON `countries and cities`.* TO 'NewUser_2_for_countries_and_cities'@'%';
FLUSH PRIVILEGES;

DROP USER 'NewUser_for_countries_and_cities'@'localhost';
DROP USER 'NewUser_2_for_countries_and_cities'@'%';
FLUSH PRIVILEGES;



-- 2. Сделать резервную копию базы, удалить базу и пересоздать из бекапа.

-- не сработало
-- mysqldump -u root -p employees | gzip > C:/xampp/backup_db/employees.sql.gz
-- mysqldump -u root -p employees | gzip > C:/xampp/backup_db/employees.sql.%Y%m%d.%H%M%S.gz;
-- mysqldump -u root -p employees | gzip > employees.sql.gz

-- "gzip" не является внутренней или внешней
-- командой, исполняемой программой или пакетным файлом.

-- Последовательность действий в консоли
mysqldump -u root -p employees > C:/xampp/backup_db/employees.sql
mysql -u root -p 
-- MariaDB[(none)]>
show databases;
drop database employees;
show databases;
create database employees;
-- Ctrl + C
mysql -u root -p employees < C:/xampp/backup_db/employees.sql



-- Решить первую задачку с собеседования (из методички) про лайки пользователей в социальной сети

-- ид пользователя
SELECT * FROM social_network.users
SELECT id FROM social_network.users 

-- имя
SELECT user_name FROM social_network.users 

-- лайков получено
SELECT
    COUNT(is_like) AS total_like,
    likes.whom,
    users.user_name
FROM
    likes
JOIN users ON likes.whom = users.id
WHERE likes.is_like = 1
GROUP BY
    whom

-- лайков поставлено
SELECT
	users.user_name,
    COUNT(is_like) AS is_like
FROM
    likes
JOIN users ON likes.who = users.id
WHERE likes.who = 4 AND likes.is_like = 1

-- взаимные лайки
-- =)
-- SELECT * FROM social_network.likes WHERE whom = who AND likes.is_like = 1 

SELECT
    *
FROM
    social_network.likes
WHERE
    who IN(
    SELECT
        whom
    FROM
        social_network.likes
    WHERE
        likes.is_like = 1
) AND likes.is_like = 1
-- P.S. получилось не совсем то, что требовалось