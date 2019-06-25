/*
    Составьте список пользователей users, которые осуществили хотя бы
    один заказ orders в интеренет магазине
*/

/* Подготовка базы */
USE shop;

INSERT INTO orders VALUES
    (NULL, 2, DEFAULT, DEFAULT),
    (NULL, 2, DEFAULT, DEFAULT),
    (NULL, 2, DEFAULT, DEFAULT),
    (NULL, 3, DEFAULT, DEFAULT);

INSERT INTO orders_products VALUES
    (NULL, 2, 1, 10, default, default),
    (null, 3, 2, 3, default, default),
    (null, 4, 2, 3, default, default),
    (null, 5, 6, 3, default, default),
    (null, 6, 4, 8, default, default);

/* Задание */
SELECT
    user_id
FROM
    orders
;

SELECT
    id,
    name
FROM
    users
WHERE
    id IN (
        SELECT
            user_id
        FROM
            orders
        )
;