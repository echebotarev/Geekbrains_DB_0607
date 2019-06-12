DROP TABLE IF EXISTS catalogs;
CREATE TABLE catalogs (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) COMMENT 'Название раздела'
) COMMENT = 'Разделы интернет-магазина';

INSERT INTO catalogs VALUES
  (DEFAULT, 'Процессоры'),
  (DEFAULT, 'Мат.платы'),
  (DEFAULT, 'Видеокарты'),
  (DEFAULT, ''),
  (DEFAULT, ''),
  (DEFAULT, NULL);

UPDATE 
	catalogs
SET
	name='empty'
WHERE name is NULL OR name='';

SELECT * FROM catalogs;