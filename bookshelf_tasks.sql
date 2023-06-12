-- 1. Найти автора с самым большим числом книг и вывести его имя.
select authors.name from authors join authors_books on authors_books.authors_id = authors.id group by authors.name order by count(authors_books.authors_id) desc limit 1;
-- 2. Вывести пять самых старых книг у которых указан год издания. 
select * from books where books.year is not null order by books.year asc limit 5;
-- 3. Вывести общее количество книг на полке в кабинете.
select count(books.id) as count from books join shelves on books.shelves_id = shelves.id where shelves.title = 'Полка в кабинете' group by books.shelves_id;
-- 4. Вывести названия, имена авторов и годы издания книг, которые находятся на полке в спальне. 
select books.title, authors.name, books.year from books join shelves on shelves.id = books.shelves_id join authors_books on authors_books.books_id = books.id join authors on authors_books.authors_id = authors.id where shelves.title = 'Полка в спальне';
-- 5. Вывести названия и годы издания книг, написанных автором 'Лев Толстой'. 
select books.title, books.year from books join shelves on shelves.id = books.shelves_id join authors_books on authors_books.books_id = books.id join authors on authors_books.authors_id = authors.id where authors.name = 'Лев Толстой';
-- 6. Вывести название книг, которые написали авторы, чьи имена начинаются на букву "А". 
select books.title from books join shelves on shelves.id = books.shelves_id join authors_books on authors_books.books_id = books.id join authors on authors_books.authors_id = authors.id where authors.name like 'А%';
-- 7. Вывести название книг и имена авторов для книг, которые находятся на полках, названия которых включают слова «верхняя» или «нижняя». 
select books.title, authors.name from books join shelves on shelves.id = books.shelves_id join authors_books on authors_books.books_id = books.id join authors on authors_books.authors_id = authors.id where shelves.title like '%нижняя%' or shelves.title like '%верхняя%';
-- 8. Книгу «Божественная комедия» автора «Данте Алигьери» одолжили почитать другу Ивану Иванову, необходимо написать один или несколько запросов которые отразят это событие в БД. 
update books join authors_books on authors_books.books_id = books.id join authors on authors_books.authors_id = authors.id set books.friends_id = (select friends.id from friends where friends.name = 'Иванов Иван') where authors.name = 'Данте Алигьери' and books.title = 'Божественная комедия' and books.id > 0;
-- 9. Добавить в базу книгу «Краткие ответы на большие вопросы», год издания 2020, автор «Стивен Хокинг», положить ее на полку в кабинете. 
insert into authors(name) values ("Стивен Хокинг"); insert into books(title, year, shelves_id) values ("Краткие ответы на большие вопросы", 2020, (select shelves.id from shelves where shelves.title = "Полка в кабинете" limit 1)); insert into authors_books(books_id, authors_id) values ((select books.id from books where books.title = "Краткие ответы на большие вопросы" and books.year = 2020 limit 1), (select authors.id from authors where authors.name = "Стивен Хокинг" limit 1));