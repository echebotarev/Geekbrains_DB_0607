/*
    Подсчитайте количество дней рождения, которые приходятся на каждую из дней недели.
    Следует учесть, что необходимы дни недели текущего года, а не года рождения
*/

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Имя покупателя',
  birthday_at DATE COMMENT 'Дата рождения',
  created_at DATETIME DEFAULT NOW() NOT NULL,
  updated_at DATETIME DEFAULT NOW() ON UPDATE NOW()
) COMMENT = 'Покупатели';

INSERT INTO users (name, birthday_at) VALUES
  ('Геннадий', '1990-10-05'),
  ('Наталья', '1984-11-12'),
  ('Александр', '1985-05-20'),
  ('Сергей', '1988-02-14'),
  ('Иван', '1998-01-12'),
  ('Мария', '1992-08-29');

SELECT
    DAYNAME(
        DATE_FORMAT(birthday_at, concat( YEAR(CURDATE()), '-%m-%d' ))
    ) AS weekday,
    COUNT(*) as count
FROM
    users
GROUP BY weekday
ORDER BY weekday;
