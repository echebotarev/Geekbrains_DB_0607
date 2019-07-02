/*
    (по желанию) Создайте SQL-запрос, который помещает в таблицу users миллион записей.
 */

use shop;

delete from users where name like 'Anton%';

alter table users engine = MYISAM;

drop procedure if exists insert_records;

delimiter //
create procedure insert_records ()
    begin
        DECLARE a INT Default 0 ;
        simple_loop: LOOP
            SET a=a+1;
            IF a=1000000 THEN
                LEAVE simple_loop;
            END IF;

            insert into users (name, birthday_at) values (concat('Anton', a), current_date);

        END LOOP simple_loop;
    end //


delimiter ;

call insert_records();

alter table users engine = INNODB;