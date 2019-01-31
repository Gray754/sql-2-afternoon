select * 
from invoice i
join invoice_line il on il.invoice_id = i.invoice_id
where unit_price > 0.99

select invoice_date, first_name, last_name, total 
from customer c
join invoice i on i.customer_id = c.customer_id

select c.first_name, c.last_name, e.first_name, e.last_name 
from employee e
join customer c on c.support_rep_id = e.employee_id

select title, name 
from artist ar
join album al on al.artist_id = ar.artist_id

select track_id 
from playlist_track pt
join playlist p on p.playlist_id = pt.playlist_id

select track_id 
from playlist_track pt
join playlist p on p.playlist_id = pt.playlist_id
where name = 'Music'

select name
from track t
join playlist_track p on p.track_id = t.track_id
where playlist_id = 5

select t.name, p.name
from track t
join playlist_track pt on pt.track_id = t.track_id
join playlist p on p.playlist_id = pt.playlist_id

select t.name, a.title
from track t
join album a on t.album_id = a.album_id
join genre g on g.genre_id = t.genre_id
where g.name = 'Alternative & Punk'

select *
from invoice
where invoiceid in
(select invoiceid from invoiceline
where UnitPrice > 0.99)

select *
from playlistTrack
where playlistId in
(select playlistId from playlist
where name = 'Music')

select name
from track
where trackId in
(select trackId from playlistTrack
where trackId = 5)

select *
from track
where genreId in
(select genreId from genre
where name = 'Comedy')

select *
from track
where albumId in
(select albumId from album
where title = 'Fireball')

select *
from track
where albumId in
(select albumId from album where artistId in 
(select artistId from artist where name = 'Queen')
)

update customer
set fax = null
where fax IS NOT null

update customer
set company = 'Self'
where company IS null

update customer
set last_name = 'Thompson'
where first_name = 'Julia' AND last_name = 'Barnett'

update customer
set support_rep_id = 4
where email = 'luisrojas@yahoo.cl'

update track
set composer = 'The Darkness Around Us'
where genre_id in (select genre_id from genre 
                   where name = 'Metal')
and composer IS null

select count(*), g.name
from track t
join genre g on t.genre_id = g.genre_id
group by g.name

select count(*), g.name
from track t
join genre g on t.genre_id = g.genre_id
where g.name = 'Pop' OR g.name = 'Rock'
group by g.name

select ar.name, count(*)
from album al
join artist ar on ar.artist_id = al.album_id
group by ar.name

select distinct composer
from track

select distinct billing_postal_code
from invoice

select distinct company
from customer

delete from practice_delete
where type = 'bronze'

delete from practice_delete
where type = 'silver'

delete from practice_delete
where value = 150

create table user (
  user_id SERIAL PRIMARY KEY,
  name text,
  email text
)

create table product (
  product_id SERIAL PRIMARY KEY,
  name text,
  price int
)

create table product_order (
  order_id SERIAL PRIMARY KEY
)

alter table product_order
FOREIGN KEY (product_id) REFERENCES product (product_id)

alter table product
FOREIGN KEY (user_id) REFERENCES user (user_id)

insert into users (name, email)
values ('bob', 'bob.com'),
('billy', 'billy.com'),
('jack', 'jack.com')

insert into product (user_id, name, price)
values (1, 'egg', 2.99),
(2, 'pogo stick', 12.99),
(3, 'pack of gum', 1.99)

select * from product
limit 1

select * from product_order po
join product p on
p.product_id = po.product_id

select SUM(*) from product_order po
join product p on
p.product_id = po.product_id
