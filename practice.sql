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

