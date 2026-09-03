/* Q3: Write a query that determines the customer that has spent the most on music for each country. 
Write a query that returns the country along with the top customer and how much they spent. 
For countries where the top amount spent is shared, provide all customers who spent this amount. */

/* Steps to Solve:  Similar to the above question. There are two parts in question- 
first find the most spent on music for each country and second filter the data for respective customers. */

WITH customer_with_country AS
(    SELECT customer.customer_id,first_name,last_name,billing_country,SUM(total) AS total_spent,
     ROW_NUMBER()OVER(PARTITION BY billing_country ORDER BY SUM(total)DESC) AS row_no
 	 FROM invoice
	 JOIN customer ON customer.customer_id = invoice.customer_id
	 GROUP BY 1,2,3,4
	 ORDER BY 4 ASC, 5 DESC)
SELECT * FROM customer_with_country
WHERE row_no <=1