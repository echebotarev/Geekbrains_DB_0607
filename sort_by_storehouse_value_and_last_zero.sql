/*
    В таблице складских запасов storehousese_products в поле value
    могут встречаться самык разные цифры: 0, если товар
    закончился и выше нуля, если на складе имеются запасы.
    Необходимо отсортировать записи таким образом, чтобы они
    выводились в порялке увеличения значения value. Однако,
    нулевые запасы должны выводится в конце, после всех записей.
*/
DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products (
  id SERIAL PRIMARY KEY,
  storehouse_id INT UNSIGNED,
  product_id INT UNSIGNED,
  value INT UNSIGNED COMMENT 'Запас товарной позиции на складе',
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) COMMENT = 'Запасы на складе';

INSERT INTO storehouses_products (value) VALUES
    (1 + RAND() * 999),
    (1 + RAND() * 999),
    (1 + RAND() * 999),
    (1 + RAND() * 999),
    (1 + RAND() * 999),
    (1 + RAND() * 999),
    (1 + RAND() * 999),
    (1 + RAND() * 999),
    (1 + RAND() * 999),
    (0),
    (1 + RAND() * 999),
    (1 + RAND() * 999),
    (0),
    (1 + RAND() * 999),
    (1 + RAND() * 999),
    (0),
    (1 + RAND() * 999),
    (1 + RAND() * 999),
    (0),
    (1 + RAND() * 999),
    (0),
    (1 + RAND() * 999),
    (0);

SELECT * FROM storehouses_products value ORDER BY IF(value = 0, 99999, value);