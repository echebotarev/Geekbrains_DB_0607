/*
    Таблица users была нейдачно спроектирована.

    Записи created_att и updated_at были заданы типом VARCHAR и вних долгое время
    помещались занчения в формате '20.10.2017 8:10'.
    Неоходимо преобразовать поля к типу DATETIME, сохранив введенные ранее значения
*/

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at VARCHAR(50),
  updated_at VARCHAR(50)
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at, created_at, updated_at) VALUES
  ('Геннадий', '1990-10-05', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Наталья', '1984-11-12', '20.10.2017 12:10', '20.10.2017 8:10'),
  ('Александр', '1985-05-20', '20.10.2017 13:10', '20.10.2017 8:10'),
  ('Сергей', '1988-02-14', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Иван', '1998-01-12', '20.10.2017 8:10', '20.10.2017 8:10'),
  ('Мария', '1992-08-29', '20.10.2017 8:10', '20.10.2017 8:10');

UPDATE
    users
SET
    created_at = STR_TO_DATE(created_at, '%d.%m.%Y %H:%i'),
    updated_at = STR_TO_DATE(updated_at, '%d.%m.%Y %H:%i');

ALTER TABLE users MODIFY COLUMN created_at DATETIME DEFAULT now() not NULL;
ALTER TABLE users MODIFY COLUMN updated_at DATETIME DEFAULT now() on update now();
