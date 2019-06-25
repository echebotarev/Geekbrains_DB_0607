USE shop;

DROP TABLE IF EXISTS cities;
CREATE TABLE cities (
    label varchar(50) PRIMARY KEY,
    name varchar(50)
);

INSERT INTO cities VALUES
    ('moscow', 'Москва'),
    ('irkutsk', 'Иркутск'),
    ('novgorod', 'Новгород'),
    ('kazan', 'Казань'),
    ('omsk', 'Омск');

DROP TABLE IF EXISTS flights;
CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    `from` varchar(50) NOT NULL,
    `to` varchar(50) NOT NULL,
    CONSTRAINT fk_from_label FOREIGN KEY (`from`) REFERENCES cities(label)
        ON DELETE CASCADE,
    CONSTRAINT fk_to_label FOREIGN KEY (`to`) REFERENCES cities(label)
        ON DELETE CASCADE
);

INSERT INTO flights VALUES
    (NULL, 'moscow', 'omsk'),
    (NULL, 'novgorod', 'kazan'),
    (NULL, 'irkutsk', 'moscow'),
    (NULL, 'omsk', 'irkutsk'),
    (NULL, 'moscow', 'kazan');

SELECT
    c1.name, c2.name
FROM flights f
    LEFT JOIN cities c1 on f.`from` = c1.label
    LEFT JOIN cities c2 on f.`to` = c2.label
