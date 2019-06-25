/*
    Выведите список товаров products и разделов catalogs,
    который соответствует товару
*/

USE shop;

SELECT
    p.id, p.name, p.catalog_id, c.name
FROM
    products as p
LEFT JOIN
    catalogs as c ON p.catalog_id = c.id
;