-- 2. Use the albums_db database.
USE albums_db;

-- 3. Explore the structure of the albums table
DESCRIBE albums;

 # a. How many rows are in the albums table?
 SELECT count(*) from albums;
 
 # b. How many unique artist names are in the albums table?
 SELECT count(distinct artist) from albums;
 
 
 # c. What is the primary key for the albums table?
  ID
 
  # d. What is the oldest release date for any album in the albums table? What is the most recent release date?
   select MIN(release_date) AS 'OLD_RELEASE_DATE' from albums;
   select MAX(release_date) AS 'RECENT_RELEASE_DATE' from albums;
   
-- 4. Write queries to find the following information:
# a. The name of all albums by Pink Floyd
 
 SELECT name as album_name FROM albums
 WHERE ARTIST ='Pink Floyd';
 


# b. The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT release_date as Year from albums
where name = "Sgt. Pepper's Lonely Hearts Club Band"



# c. The genre for the album Nevermind
select genre from albums
where name = 'Nevermind';



# d. Which albums were released in the 1990s
SELECT name as album_name_1990_release_date from albums
where release_date = 1990;

 
 

# e. Which albums had less than 20 million certified sales

select name as less_than_20_million_sales from albums 
where sales < 20;


# f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?

-- Answer: Because they are not identical strings.


  