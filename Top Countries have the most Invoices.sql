/* Q2: Which countries have the most Invoices? */

SELECT Count(*) as Total,billing_country
from invoice
group by billing_country
order by Total desc
