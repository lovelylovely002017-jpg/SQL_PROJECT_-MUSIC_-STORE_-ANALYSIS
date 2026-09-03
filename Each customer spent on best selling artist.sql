/* Q1: Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent */

WITH best_selling_artist AS (
SELECT artist.artist_id AS artist_id, artist.name AS artist_name,
SUM(invoice_line.unit_price * invoice_line.quantity) AS total_sales
FROM invoice_line
JOIN track ON invoice_line.track_id = track.track_id
JOIN album ON track.album_id = album.album_id
JOIN artist ON album.artist_id = artist.artist_id
GROUP BY 1
ORDER BY 3 DESC
LIMIT 1
)
SELECT customer.customer_id,customer.first_name,customer.last_name,best_selling_artist.artist_name,
SUM(invoice_line.unit_price*invoice_line.quantity)
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
JOIN invoice_line ON invoice.invoice_id = invoice_line.invoice_id
JOIN track ON invoice_line.track_id = track.track_id
JOIN album ON track.album_id = album.album_id
JOIN best_selling_artist ON album.artist_id = best_selling_artist.artist_id
GROUP BY 1,2,3,4
ORDER BY 5 DESC







