/*
    Создайте таблицу logs типа Archive. Пусть при каждом создании записи в таблицах
    users, catalogs и products в таблицу logs помещается время и дата создания записи,
    название таблицы, идентификатор первичного ключа и содержимое поля name.
*/

use shop;
drop table if exists `logs`;

create table `logs` (
    `id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `create_at` datetime default now(),
    `table_name` char(20),
    `inserted_data_into_name` varchar(255)
) engine = ARCHIVE;

drop trigger if exists logs_users;
delimiter //
create trigger logs_users
    after insert on users for each row
    begin
        insert into logs (table_name, inserted_data_into_name) values ('users', new.name);
    end//

delimiter ;

drop trigger if exists logs_products;
delimiter //
create trigger logs_products
    after insert on products for each row
    begin
        insert into logs (table_name, inserted_data_into_name) values ('products', new.name);
    end//

delimiter ;

drop trigger if exists logs_catalogs;
delimiter //
create trigger logs_catalogs
    after insert on catalogs for each row
    begin
        insert into logs (table_name, inserted_data_into_name) values ('catalogs', new.name);
    end//

delimiter ;

insert into users set name = 'Гладей';
insert into products set name = 'Жесткий диск';
insert into catalogs set name = 'Комплектующие';
select * from logs;