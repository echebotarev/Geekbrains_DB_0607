/*
    Создайте хранимую ф-ию hello, которая будет возвразать приветствие, в
    зависимости от текущего времени суток

    С 6:00 - 12:00 ф-ия должна возвращать фразу "Доброе утро",
    С 12:00 - 18:00 ф-ия должна возвращать фразу "Добрый день",
    С 18:00 - 00:00 ф-ия должна возвращать фразу "Добрый вечер",
    С 00:00 - 06:00 ф-ия должна возвращать фразу "Доброй ночи"
*/

use shop;
drop function if exists hello;

delimiter //

create function hello ( /*input_h int*/ )
    returns char(50) deterministic

    begin
        declare h int default hour(now());
        declare welcome_text char(20) default null;

        /*if input_h = '' then
            set h = input_h;
        end if;*/

        if h >= 6 and h <= 11 then
            set welcome_text = 'Доброе утро';

        elseif h >= 12 and h <= 17 then
            set welcome_text = 'Добрый день';

        elseif h >= 18 and h <= 23 then
            set welcome_text = 'Добрый вечер';

        elseif h >= 0 and h <= 5 then
            set welcome_text = 'Доброй ночи';

        end if;

        return welcome_text;
    end//

delimiter ;

select hello();