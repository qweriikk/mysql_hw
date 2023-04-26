-- 1. Вывести суммарное количество единиц техники на складе.
select SUM(amount) from hardware;
-- 2. Вывести какие товары на складе закончились.
select title from hardware 
where amount = 0;
-- 3. Вывести среднюю цену монитора.
select avg(price) from hardware
where title like 'Монитор %';
-- 4. Вывести все клавиатуры, при этом результаты отсортировать от самой дешевой до самой дорогой.
select title from hardware
where title like 'Клавиатура %'
order by price asc;
-- 5. Вывести в рамках одного запроса количество товарных позиций по каждому тегу с использованием группировки, 
-- результаты отсортировать от максимального количества до минимального.
select tag, count(title) as 'amount' 
from hardware group by tag order by amount desc;
-- 6. Вывести количество товарных позиций со скидками на складе.
select amount from hardware
where tag = 'discount';
-- 7. Вывести название и цену самой дорогой новинки.
select title, price from hardware where tag = 'new' order by price desc limit 1;
-- 8. Добавить в таблицу товар Ноутбук Lenovo 2BXKQ7E9XD как новинку по цене 54500 руб. в единственном экземпляре.
insert into hardware (title, price, amount, tag) 
values ('Ноутбук Lenovo 2BXKQ7E9XD', '54500', '1', 'new');
-- 9. Найти и удалить по названию из базы ошибочно добавленный товар Очки PS VR 2.
delete from hardware 
where id in (18);