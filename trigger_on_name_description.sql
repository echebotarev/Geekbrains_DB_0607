/*
    В таблице products есть два текстовых поля: name с названием товара и description
    с его описанием. Допустимо присутствие обоих полей или одно из них.
    Ситуация, когда оба поля принимают неопределенное значение NULL неприемлема.
    Используя триггеры, добейтесь того, чтобы одно из этих полей или оба поля были заполнены.
    При попытке присвоить полям NULL-значение необходимо отменить операцию.
*/

use shop;
drop trigger if exists name_desc_is_not_null;

delimiter //
create trigger name_desc_is_not_null before insert on products for each row
    begin
        if new.name is null and new.description is null then
            signal sqlstate '45000' set message_text = 'Name and Description can\'t are both NULL';
        end if;
    end//

delimiter ;

insert into products (name, description) values
    ('Product 1', 'Desc 1'),
    ('Product 2', null),
    (null, 'Desc 3'),
    (null, null);
