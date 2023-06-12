-- 1. ������� ������� ������� ����� ������������ Universal Pictures.
select count(movies.title) from movies join companies on companies.id = movies.companies_id where companies.title = "Universal Pictures";
-- 2. ������� ������� ����� ������� ���� ����� ���������� ��������� ������ ��������.
select count(movies.title) from movies join directors on directors.id = movies.directors_id where directors.full_name = "������� ���� �������";
-- 3. ������� ���������� ������ ������� �� ��������� 20 ���.
select count(*) from movies where year between (year(curdate()) - 20) and year(curdate());
-- 4. ������� ��� ����� ������� � ������� ������ ������ �������� � ������� ���� ����� �������. 
select distinct genres.title from genres join movies on genres.id = movies.genres_id join directors on directors.id = movies.directors_id where directors.full_name = "������ ��������";
-- 5. ������� ��������, ����� � ���������� 5 ����� ������� �������.
select movies.title, genres.title, directors.full_name from movies join genres on genres.id = movies.genres_id join directors on directors.id = directors_id order by budget desc limit 5;
-- 6. ������� ��� ��������� � ����� ������� ����������� �������.
select directors.full_name from directors join movies on directors.id = directors_id group by directors.full_name order by count(movies.title) desc limit 1;
-- 7.������� �������� � ����� �������, ������ ����� ������� ������������� (�� ����� ���� �������� �������)
select movies.title, genres.title from movies join genres on genres.id = movies.genres_id where companies_id = (select companies.id from companies join movies on movies.companies_id = companies.id group by companies.id order by sum(movies.budget) desc limit 1);
-- 8. ������� ������� ������ �������, ������ ������������� Warner Bros.
select avg(movies.budget) from movies join companies on companies.id = companies_id where companies.title = "Warner Bros.";
-- 9. ������� ���������� ������� ������� ����� � ������� ������ �� �����. 
select count(movies.title), genres.title, avg(movies.budget) from movies join genres on genres.id = genres_id group by genres.title;
-- 10. ����� � ������� ������� "����� �������" 2014-�� ����. 
delete movies from movies join genres on genres.id = movies.genres_id where genres.title = '�������' and movies.title = '����� �������' and movies.year = 2014;