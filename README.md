# SQL_PROJECT_-MUSIC_-STORE_-ANALYSIS
SQL project to analyze online music store data  we have examine the dataset with SQL and help the store understand its business growth by answering simple questions.
here's the schema 

<img width="1456" height="862" alt="image" src="https://github.com/user-attachments/assets/e7e54a3d-4805-4063-a9ba-3e784375ffcc" />


## Overview
A SQL portfolio project analyzing a music store database to answer business
questions around employee structure, customer spending, sales trends, and
catalog performance using PostgreSQL.

## Database & Tools
- PostgreSQL
- pgAdmin

## Database Schema
The database consists of 11 tables modeling a digital music store:

| Table | Description |
|---|---|
| `artist` | Music artists |
| `album` | Albums, linked to artists |
| `track` | Individual tracks, linked to albums, media types, and genres |
| `genre` | Music genres |
| `media_type` | File/media format types |
| `playlist` | Curated playlists |
| `playlist_track` | Junction table linking playlists to tracks |
| `customer` | Customer details and contact info |
| `employee` | Store employees, including reporting hierarchy |
| `invoice` | Customer purchase invoices |
| `invoice_line` | Line items per invoice (track, quantity, price) |

**Key relationships:**
- `artist` → `album` → `track` (one-to-many)
- `track` links to `genre`, `media_type`, and appears in `playlist_track`
- `customer` → `invoice` → `invoice_line` (one-to-many)
- `employee.reports_to` self-references `employee` (org hierarchy)
- `customer.support_rep_id` references `employee`

![Schema Diagram](schema.png)


## Key SQL Techniques Used
- Window functions (`RANK()`, `ROW_NUMBER()`)
- CTEs (Common Table Expressions)
- Multi-table `JOIN`s across 4+ tables
- Aggregations with `GROUP BY` / `HAVING`
- Subqueries for comparison against aggregate values (e.g. above-average song length)

---

## Question Set 1 – Easy

**1. Who is the senior most employee based on job title?**
```sql

```
**Insight:**

**2. Which countries have the most invoices?**
```sql

```
**Insight:**

**3. What are the top 3 values of total invoice?**
```sql

```
**Insight:**

**4. Which city has the best customers?**
*We would like to throw a promotional Music Festival in the city we made the most money. Return the city name & sum of all invoice totals.*
```sql

```
**Insight:**

**5. Who is the best customer?**
*The customer who has spent the most money will be declared the best customer.*
```sql

```
**Insight:**

---

## Question Set 2 – Moderate

**1. Rock Music listeners**
*Return the email, first name, last name, & Genre of all Rock Music listeners, ordered alphabetically by email starting with A.*
```sql

```
**Insight:**

**2. Top 10 rock bands**
*Return the Artist name and total track count of the top 10 rock bands.*
```sql

```
**Insight:**

**3. Above-average song length**
*Return all track names with a song length longer than the average song length. Return Name and Milliseconds, ordered longest first.*
```sql

```
**Insight:**

---

## Question Set 3 – Advanced

**1. Amount spent by each customer per artist**
*Return customer name, artist name, and total spent.*
```sql

```
**Insight:**

**2. Most popular genre by country**
*The most popular genre is the one with the highest amount of purchases. Return each country along with its top genre. For countries where the max is shared, return all tied genres.*
```sql

```
**Insight:**

**3. Top-spending customer by country**
*Return the country along with the top customer and how much they spent. For countries where the top amount is shared, return all tied customers.*
```sql
WITH customer_with_country AS (
    SELECT customer.customer_id, first_name, last_name, billing_country,
           SUM(total) AS total_spent,
           RANK() OVER (PARTITION BY billing_country ORDER BY SUM(total) DESC) AS rank_no
    FROM invoice
    JOIN customer ON customer.customer_id = invoice.customer_id
    GROUP BY 1,2,3,4
)
SELECT * FROM customer_with_country
WHERE rank_no = 1;
```
**Insight:** Identifies the highest-spending customer per country, correctly
surfacing all tied customers where the top amount is shared.

---

## How to Run
1. Load the music store (Chinook) database into PostgreSQL
2. Open `queries.sql` in pgAdmin (or your preferred client)
3. Run each query against the database

## Author
[LOVELY] — transitioning from financial services into data analytics,
building skills in SQL, Python, and Power BI.
