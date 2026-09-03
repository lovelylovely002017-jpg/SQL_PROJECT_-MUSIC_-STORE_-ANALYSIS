/* Q3: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */

SELECT name,milliseconds
FROM track
WHERE milliseconds >(
SELECT AVG(milliseconds) AS length_of_songs
FROM track)
ORDER BY milliseconds DESC






