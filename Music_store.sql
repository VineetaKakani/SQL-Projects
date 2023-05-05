USE musicstore

/*	Question Set 1 - Easy */

/* Q1: Who is the senior most employee based on job title? */

SELECT last_name, first_name, title, levels, hire_date FROM musicstore.employee
ORDER BY levels DESC
limit 1

/* Q2: Which countries have the most Invoices? */
SELECT COUNT(*) AS TOTALINVOICES, BILLING_COUNTRY FROM MUSICSTORE.INVOICE
GROUP BY BILLING_COUNTRY
ORDER BY TOTALINVOICES DESC

/* Q3: What are top 3 values of total invoice? */
SELECT INVOICE_DATE, BILLING_COUNTRY, BILLING_STATE, TOTAL FROM MUSICSTORE.INVOICE
ORDER BY TOTAL DESC
LIMIT 3

/* Q4: Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 
Write a query that returns one city that has the highest sum of invoice totals. 
Return both the city name & sum of all invoice totals */
SELECT BILLING_CITY, BILLING_COUNTRY, SUM(TOTAL) AS INVOICETOTAL FROM MUSICSTORE.INVOICE
GROUP BY BILLING_CITY
ORDER BY INVOICETOTAL DESC
LIMIT 1

/* Rename customer table */
RENAME TABLE customer_csv TO customer;

/* Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
Write a query that returns the person who has spent the most money.*/
SELECT CUSTOMER.CUSTOMER_ID, CUSTOMER.FIRST_NAME, CUSTOMER.LAST_NAME, CUSTOMER.CITY, CUSTOMER.COUNTRY, SUM(TOTAL) FROM MUSICSTORE.CUSTOMER
JOIN MUSICSTORE.INVOICE ON CUSTOMER.CUSTOMER_ID = INVOICE.CUSTOMER_ID
GROUP BY FIRST_NAME
ORDER BY TOTAL DESC
LIMIT 1

/* Question Set 2 - Moderate */

/* Q1: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. */
SELECT DISTINCT CUSTOMER.FIRST_NAME AS FN, CUSTOMER.LAST_NAME AS LN, CUSTOMER.EMAIL, genre.name FROM MUSICSTORE.CUSTOMER
JOIN MUSICSTORE.INVOICE ON CUSTOMER.CUSTOMER_ID = INVOICE.CUSTOMER_ID
JOIN MUSICSTORE.INVOICE_LINE ON INVOICE.INVOICE_ID = INVOICE_LINE.INVOICE_ID
JOIN MUSICSTORE.TRACK ON TRACK.TRACK_ID = INVOICE_LINE.TRACK_ID
JOIN MUSICSTORE.GENRE ON TRACK.GENRE_ID = GENRE.GENRE_ID
WHERE GENRE.name LIKE  "ROCK"
ORDER BY EMAIL

/* Q2: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */
SELECT ARTIST.NAME, ARTIST.ARTIST_ID, COUNT(ARTIST.ARTIST_ID) AS NUMBER_SONGS, genre.name FROM MUSICSTORE.TRACK
JOIN MUSICSTORE.ALBUM ON TRACK.ALBUM_ID = ALBUM.ALBUM_ID
JOIN MUSICSTORE.ARTIST ON ARTIST.ARTIST_ID = ALBUM.ARTIST_ID
JOIN MUSICSTORE.GENRE ON TRACK.GENRE_ID = GENRE.GENRE_ID
WHERE GENRE.name LIKE  "ROCK"
GROUP BY ARTIST_ID
ORDER BY NUMBER_SONGS DESC
LIMIT 10

/* Q3: Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first. */
SELECT NAME, COMPOSER, MILLISECONDS FROM MUSICSTORE.TRACK
WHERE MILLISECONDS > (SELECT AVG(MILLISECONDS) AS SONG_LENGTH FROM TRACK)
ORDER BY MILLISECONDS DESC 





SELECT * FROM CUSTOMER
SELECT * FROM INVOICE
SELECT * FROM GENRE
SELECT * FROM artist
SELECT * FROM TRACK