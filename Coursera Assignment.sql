-- Using a subquery, find the names of all the tracks for the album "Californication".
select tracks.albumid
	,tracks.name
from tracks
where tracks.albumid in 
	(
	select
	albums.albumid
	from albums
	where albums.title = 'Californication')
	+---------+-------------------+
	| AlbumId | Name              |
	+---------+-------------------+
	|     195 | Around The World  |
	|     195 | Parallel Universe |
	|     195 | Scar Tissue       |
	|     195 | Otherside         |
	|     195 | Get On Top        |
	|     195 | Californication   |
	|     195 | Easily            |
	|     195 | Porcelain         |
	|     195 | Emit Remmus       |
	|     195 | I Like Dirt       |
	+---------+-------------------+
	(Output limit exceeded, 10 of 15 total rows shown)

-- Find the total number of invoices for each customer along with the customer's full name, city and email.
select firstname,
	lastname,
	email
from customers
where customerid in
    (
	select customerid
    from invoices
    group by customerid
    having invoiceid > 0)
	+-----------+-------------+--------------------------+
	| FirstName | LastName    | Email                    |
	+-----------+-------------+--------------------------+
	| Luís      | Gonçalves   | luisg@embraer.com.br     |
	| Leonie    | Köhler      | leonekohler@surfeu.de    |
	| François  | Tremblay    | ftremblay@gmail.com      |
	| Bjørn     | Hansen      | bjorn.hansen@yahoo.no    |
	| František | Wichterlová | frantisekw@jetbrains.com |
	| Helena    | Holý        | hholy@gmail.com          |
	| Astrid    | Gruber      | astrid.gruber@apple.at   |
	| Daan      | Peeters     | daan_peeters@apple.be    |
	| Kara      | Nielsen     | kara.nielsen@jubii.dk    |
	| Eduardo   | Martins     | eduardo@woodstock.com.br |
	+-----------+-------------+--------------------------+
	(Output limit exceeded, 10 of 59 total rows shown)
	
	

-- Retrieve the track name, album, artistID, and trackID for all the albums.
SELECT Albums.title, Albums.artistid, Tracks.trackid, Tracks.name
FROM Albums
LEFT JOIN tracks ON Albums.albumid = Tracks.albumid  



-- Retrieve a list with the managers last name, and the last name of the employees who report to him or her.
select m.lastname as MAN, 
	e.lastname as EMP
from employees m inner join employees e on m.employeeid = e.reportsto
+----------+----------+
| MAN      | EMP      |
+----------+----------+
| Adams    | Edwards  |
| Adams    | Mitchell |
| Edwards  | Peacock  |
| Edwards  | Park     |
| Edwards  | Johnson  |
| Mitchell | King     |
| Mitchell | Callahan |
+----------+----------+



-- Find the name and ID of the artists who do not have albums.
select a.artistid
	,a.name
	,al.albumid as AlID
from artists a
left join albums al on a.artistid = al.artistid
where AlID IS NULL
+----------+----------------------------+------+
| ArtistId | Name                       | AlID |
+----------+----------------------------+------+
|       25 | Milton Nascimento & Bebeto | None |
|       26 | Azymuth                    | None |
|       28 | João Gilberto              | None |
|       29 | Bebel Gilberto             | None |
|       30 | Jorge Vercilo              | None |
|       31 | Baby Consuelo              | None |
|       32 | Ney Matogrosso             | None |
|       33 | Luiz Melodia               | None |
|       34 | Nando Reis                 | None |
|       35 | Pedro Luís & A Parede      | None |
+----------+----------------------------+------+
(Output limit exceeded, 10 of 71 total rows shown)



-- Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.
select firstname,
	lastname
from employees
union
select firstname,
	lastname
from customers
order by lastname desc
+-----------+--------------+
| firstname | lastname     |
+-----------+--------------+
| Fynn      | Zimmermann   |
| Stanisław | Wójcik       |
| František | Wichterlová  |
| Johannes  | Van der Berg |
| François  | Tremblay     |
| Mark      | Taylor       |
| Ellie     | Sullivan     |
| Victor    | Stevens      |
| Puja      | Srivastava   |
| Jack      | Smith        |
+-----------+--------------+
(Output limit exceeded, 10 of 67 total rows shown)



-- See if there are any customers who have a different city listed in their billing city versus their customer city.
select c.customerid, 
	c.city, 
	i.billingcity
from customers c
inner join invoices i on c.customerid = i.customerid
where c.city <> i.billingcity
+------------+------+-------------+
| CustomerId | City | BillingCity |
+------------+------+-------------+
+------------+------+-------------+
(Zero rows)



-- Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)
select customerid,
	firstname || ' ' || lastname as fullname,
	address,
	upper (city || ' ' || country) as city_country
from customers
1.
Question 1
All of the questions in this quiz refer to the open source Chinook Database. Please familiarize yourself with the ER diagram in order to familiarize yourself with the table and column names in order to write accurate queries and get the appropriate answers.

Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)

123456
select customerid,
firstname || ' ' || lastname as fullname,
address,
upper (city || ' ' || country) as city_country
from customers
limit 10
+------------+-----------------------+--------------------------------------+----------------------------+
| CustomerId | fullname              | Address                              | city_country               |
+------------+-----------------------+--------------------------------------+----------------------------+
|          1 | Luís Gonçalves        | Av. Brigadeiro Faria Lima, 2170      | SãO JOSé DOS CAMPOS BRAZIL |
|          2 | Leonie Köhler         | Theodor-Heuss-Straße 34              | STUTTGART GERMANY          |
|          3 | François Tremblay     | 1498 rue Bélanger                    | MONTRéAL CANADA            |
|          4 | Bjørn Hansen          | Ullevålsveien 14                     | OSLO NORWAY                |
|          5 | František Wichterlová | Klanova 9/506                        | PRAGUE CZECH REPUBLIC      |
|          6 | Helena Holý           | Rilská 3174/6                        | PRAGUE CZECH REPUBLIC      |
|          7 | Astrid Gruber         | Rotenturmstraße 4, 1010 Innere Stadt | VIENNE AUSTRIA             |
|          8 | Daan Peeters          | Grétrystraat 63                      | BRUSSELS BELGIUM           |
|          9 | Kara Nielsen          | Sønder Boulevard 51                  | COPENHAGEN DENMARK         |
|         10 | Eduardo Martins       | Rua Dr. Falcão Filho, 155            | SãO PAULO BRAZIL           |
+------------+-----------------------+--------------------------------------+----------------------------+



-- Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.
select firstname,
	lastname, 
lower (substr (firstname,1,4) || substr (lastname,1,2)) as userid
from employees
+-----------+----------+--------+
| FirstName | LastName | userid |
+-----------+----------+--------+
| Andrew    | Adams    | andrad |
| Nancy     | Edwards  | nanced |
| Jane      | Peacock  | janepe |
| Margaret  | Park     | margpa |
| Steve     | Johnson  | stevjo |
| Michael   | Mitchell | michmi |
| Robert    | King     | robeki |
| Laura     | Callahan | laurca |
+-----------+----------+--------+



-- Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.
 select LastName,
	FirstName,
	date('now') - HireDate as Tenure 
 from Employees 
 where Tenure >= 15 
 order by LastName asc 
 +----------+-----------+--------+
| LastName | FirstName | Tenure |
+----------+-----------+--------+
| Adams    | Andrew    |     20 |
| Callahan | Laura     |     18 |
| Edwards  | Nancy     |     20 |
| Johnson  | Steve     |     19 |
| King     | Robert    |     18 |
| Mitchell | Michael   |     19 |
| Park     | Margaret  |     19 |
| Peacock  | Jane      |     20 |
+----------+-----------+--------+



-- Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.
select c.firstname || c.lastname || i.invoiceid as newinvoice
from customers c 
left join invoices i on c.customerid = i.customerid
order by firstname, lastname, invoiceid
+-------------------+
| newinvoice        |
+-------------------+
| AaronMitchell50   |
| AaronMitchell61   |
| AaronMitchell116  |
| AaronMitchell245  |
| AaronMitchell268  |
| AaronMitchell290  |
| AaronMitchell342  |
| AlexandreRocha57  |
| AlexandreRocha68  |
| AlexandreRocha123 |
| AlexandreRocha252 |
| AlexandreRocha275 |
| AlexandreRocha297 |
| AlexandreRocha349 |
| AstridGruber78    |
| AstridGruber89    |
| AstridGruber144   |
| AstridGruber273   |
| AstridGruber296   |
| AstridGruber318   |
| AstridGruber370   |
| BjørnHansen2      |
| BjørnHansen24     |
| BjørnHansen76     |
| BjørnHansen197    |
+-------------------+
(Output limit exceeded, 25 of 412 total rows shown)
