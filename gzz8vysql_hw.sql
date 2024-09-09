/* Part 1: Querying the World & Chinook Databases */
/* World Database Questions */
/* 1. List all countries in South America. */
SELECT Name FROM country where continent = 'South America';

/* 2. Find the population of 'Germany'. */
SELECT Population FROM country WHERE Name = 'Germany';

/* 3. Retrieve all cities in the country 'Japan'. */
SELECT Name FROM city WHERE CountryCode = 'JPN';

/* 4. Find the 3 most populated countries in the 'Africa' region. */
SELECT Name FROM country WHERE Region = 'Western Africa' LIMIT 3;

/* 5. Retrieve the country and its life expectancy where the population is between 1 and 5 million. */
SELECT Name, LifeExpectancy FROM country WHERE Population BETWEEN 1000000 AND 5000000;

/* 6. List countries with an official language of 'French'. */
SELECT country.name FROM country JOIN countrylanguage ON country.code = countrylanguage.countrycode WHERE countrylanguage.language = 'French' AND countrylanguage.isofficial = 'T';

/* Chinook Database Questions */
/* 7. Retrieve all album titles by the artist 'AC/DC'. */
SELECT Album.title FROM Album JOIN Artist ON Album.ArtistId = Artist.ArtistId WHERE Artist.Name = 'AC/DC';

/* 8. Find the name and email of customers located in 'Brazil'. */
SELECT FirstName, LastName, Email FROM Customer WHERE Country = 'Brazil'

/* 9. List all playlists in the database. */
SELECT * FROM `Playlist`

/* 10. Find the total number of tracks in the 'Rock' genre. */
SELECT COUNT(Track.TrackId) AS TotalRockTracks
FROM Track
JOIN Genre ON Track.GenreId = Genre.GenreId
WHERE Genre.Name = 'Rock';

/* 11. List all employees who report to 'Nancy Edwards'. */
SELECT FirstName, LastName FROM Employee WHERE ReportsTo = 2;

/* 12. Calculate the total sales per customer by summing the total amount in invoices. */
SELECT CustomerId, SUM(Total) AS Total FROM Invoice GROUP BY CustomerId;


/* Part 2: Create Your Own Database */
/* 1. Design Your Database: Create a database for a small business of your choice, with at least 3 tables with appropriate columns. */
CREATE DATABASE GirlScoutCookies;
+ USE GirlScoutCookies;

/* 2. Create the Tables: Write SQL statements to create the tables for your database. Ensure that each table has a primary key and relationships where appropriate. */
CREATE TABLE Cookies(
    CookieId INT AUTO_INCREMENT PRIMARY KEY,
    CookieName VARCHAR(100) NOT Null,
    Price DECIMAL(5, 2) NOT Null,
    Stock INT NOT NULL
);

CREATE TABLE Customers (
    CustomerId INT AUTO_INCREMENT PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100) NOT NULL,
    Email VARCHAR(255),
    PhoneNumber VARCHAR(15)
);

CREATE TABLE Orders (
    OrderId INT AUTO_INCREMENT PRIMARY KEY,
    CustomerId INT,
    CookieId INT,
    OrderDate DATE NOT NULL,
    Quantity INT NOT NULL,
    TotalAmount DECIMAL(7, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (CookieID) REFERENCES Cookies(CookieID)
);

/* 3. Insert Data: Insert at least 5 rows of data into each of the tables you created. */
INSERT INTO Cookies (CookieName, Price, Stock)
VALUES 
('Thin Mints', 3.50, 100),
('Samoas', 4.00, 80),
('Tagalongs', 4.00, 120),
('Trefoils', 3.00, 90),
('Do-si-dos', 4.00, 60);

INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber)
VALUES 
('Sophia', 'Zhang', 'a@gmail.com', '123-456-7890'),
('Skye', 'Zhong', 'b@gmail.com', '234-567-8901'),
('Julia', 'Hong', 'c@gmail.com', '345-678-9012'),
('Nicco', 'Cox', 'd@gmail.com', '456-789-0123'),
('Diane', 'Nguyen', 'e@example.com', '567-890-1234');

INSERT INTO Orders (CustomerId, CookieId, OrderDate, Quantity, TotalAmount)
VALUES 
(1, 1, '2024-09-01', 2, 7.00),
(1, 2, '2024-09-01', 1, 4.00),
(2, 3, '2024-09-02', 3, 12.00),
(3, 4, '2024-09-03', 2, 6.00),
(4, 5, '2024-09-04', 4, 16.00),
(5, 1, '2024-09-05', 5, 17.50);

/* 4. Write Queries: Write at least 3 queries to extract data from your new database. */
SELECT CookieName FROM Cookies WHERE Price = 3.50;
SELECT Customers.FirstName, Customers.LastName, Orders.TotalAmount FROM Customers JOIN Orders ON Customers.CustomerId = Orders.CustomerId;
SELECT Orders.CustomerId, Cookies.CookieName, Orders.Quantity FROM Orders JOIN Cookies ON Orders.CookieId = Cookies.CookieId;


