-- PART 1: 

-- Profile the data by finding the total number of records for each of the tables below:
    -- Attribute table = 10000
        SELECT COUNT (*) FROM Attribute
    -- Business table = 10000
        SELECT COUNT (*) FROM Business
    -- Category table = 10000
        SELECT COUNT (*) FROM Category
    -- Checkin table = 10000
        SELECT COUNT (*) FROM Checkin
    -- Elite_years table = 10000
        SELECT COUNT (*) FROM Elite_years
    -- Friend table = 10000
        SELECT COUNT (*) FROM Friend
    -- Hours table = 10000
        SELECT COUNT (*) FROM Hours
    -- Photo table = 10000
        SELECT COUNT (*) FROM Photo
    -- Review table = 10000
        SELECT COUNT (*) FROM Review
    -- Tip table = 10000
        SELECT COUNT (*) FROM Tip
    -- User table = 10000
        SELECT COUNT (*) FROM User



-- Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.
    -- Business (id) = 10000
        SELECT COUNT (DISTINCT id) FROM Business
    -- Hours (business_id) = 1562
        SELECT COUNT (DISTINCT business_id) FROM Hours
    -- Category (business_id) = 2643
        SELECT COUNT (DISTINCT business_id) FROM Category
    -- Attribute (business_id) = 1115
        SELECT COUNT (DISTINCT business_id) FROM Attribute
    -- Review (business_id) = 8090
        SELECT COUNT (DISTINCT business_id) FROM Review
    -- Checkin (business_id) = 493
        SELECT COUNT (DISTINCT business_id) FROM Checkin
    -- Photo (business_id) = 6493
        SELECT COUNT (DISTINCT business_id) FROM Photo
    -- Tip (business_id) = 3979
        SELECT COUNT (DISTINCT business_id) FROM Tip
    -- User (id) = 10000
        SELECT COUNT (DISTINCT id) FROM User
    -- Friend (user_id) = 11
        SELECT COUNT (DISTINCT user_id) FROM Friend
    -- Elite_years (user_id) = 2780
        SELECT COUNT (DISTINCT user_id) FROM Elite_years



-- Are there any columns with null values in the Users table? Indicate "yes," or "no."
    -- Answer : No
    SELECT id, name, review_count, yelping_since, useful, funny, cool, fans, average_stars, compliment_hot, compliment_more, compliment_profile, compliment_cute, compliment_list, compliment_note, compliment_plain, compliment_cool, compliment_funny, compliment_writer, compliment_photos
    FROM user
    WHERE id is null or name is null or review_count is null or yelping_since is null or useful is null or funny is null or cool is null or fans is null or average_stars is null or compliment_hot is null or compliment_more is null or compliment_profile is null or compliment_cute is null or compliment_list is null or compliment_note is null or compliment_plain is null or compliment_cool is null or compliment_funny is null or compliment_writer is null or compliment_photos is null



-- For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:
    -- Table: Review, Column: Stars
        SELECT MIN (stars),
            MAX (stars),
            AVG (stars)
        FROM review
        -- min: 1	    max: 5  	avg: 3.7082
    -- Table: Business, Column: Stars
        SELECT MIN (stars),
            MAX (stars),
            AVG (stars)
        FROM business
        -- min: 1.0     max: 5.0    avg: 3.6549
    -- Table: Tip, Column: Likes
        SELECT MIN (likes),
            MAX (likes),
            AVG (likes)
        FROM tip
        -- min: 0       max: 2      avg: 0.0144
    -- Table: Checkin, Column: Count
        SELECT MIN (count),
            MAX (count),
            AVG (count)
        FROM checkin
        -- min: 1       max: 53     avg: 1.9414
    -- Table: User, Column: Review_count
        SELECT MIN (review_count),
            MAX (review_count),
            AVG (review_count)
        FROM user
        -- min: 0       max: 2000   avg: 24.2995



-- List the cities with the most reviews in descending order:
    SELECT SUM(review_count) AS total_review, city
    FROM business
    GROUP BY city
    ORDER BY total_review DESC
    +--------------+-----------------+
    | total_review | city            |
    +--------------+-----------------+
    |        82854 | Las Vegas       |
    |        34503 | Phoenix         |
    |        24113 | Toronto         |
    |        20614 | Scottsdale      |
    |        12523 | Charlotte       |
    |        10871 | Henderson       |
    |        10504 | Tempe           |
    |         9798 | Pittsburgh      |
    |         9448 | Montr??al        |
    |         8112 | Chandler        |
    |         6875 | Mesa            |
    |         6380 | Gilbert         |
    |         5593 | Cleveland       |
    |         5265 | Madison         |
    |         4406 | Glendale        |
    |         3814 | Mississauga     |
    |         2792 | Edinburgh       |
    |         2624 | Peoria          |
    |         2438 | North Las Vegas |
    |         2352 | Markham         |
    |         2029 | Champaign       |
    |         1849 | Stuttgart       |
    |         1520 | Surprise        |
    |         1465 | Lakewood        |
    |         1155 | Goodyear        |
    +--------------+-----------------+
    (Output limit exceeded, 25 of 362 total rows shown)

-- Find the distribution of star ratings to the business in the following cities:
    -- Avon
    SELECT stars as star_rating, COUNT (stars)
    FROM business
    WHERE city = 'Avon'
    GROUP BY star_rating
    +-------------+---------------+
    | star_rating | COUNT (stars) |
    +-------------+---------------+
    |         1.5 |             1 |
    |         2.5 |             2 |
    |         3.5 |             3 |
    |         4.0 |             2 |
    |         4.5 |             1 |
    |         5.0 |             1 |
    +-------------+---------------+
-- Beachwood
    SELECT stars as star_rating, COUNT (stars)
    FROM business
    WHERE city = 'Beachwood'
    GROUP BY star_rating
    +-------------+---------------+
    | star_rating | COUNT (stars) |
    +-------------+---------------+
    |         2.0 |             1 |
    |         2.5 |             1 |
    |         3.0 |             2 |
    |         3.5 |             2 |
    |         4.0 |             1 |
    |         4.5 |             2 |
    |         5.0 |             5 |
    +-------------+---------------+



-- Find the top 3 users based on their total number of reviews
    SELECT name, SUM (review_count) as total_review
    FROM user
    GROUP BY name
    ORDER BY total_review DESC
    +--------+--------------+
    | name   | total_review |
    +--------+--------------+
    | Nicole |         2397 |
    | Sara   |         2253 |
    | Gerald |         2034 |
    +--------+--------------+



-- Does posing more reviews correlate with more fans?
    -- It is impossible to answer this question without using correlation function that is not supported on Coursera. The standard deviation and root square functions are also unavailable, therefore it is not possible to do manual correlation here. However, looking at the returned data below, there is possibility that review count and fans are not significantly correlated as we can see the inconsistency between the average of review count and fans.
    SELECT AVG(review_count) AS avg_review_count, AVG(fans) AS avg_fans
    FROM user
    GROUP BY review_count
    +------------------+-----------------+
    | avg_review_count |        avg_fans |
    +------------------+-----------------+
    |              0.0 |             0.0 |
    |              1.0 | 0.0203856749311 |
    |              2.0 | 0.0563265306122 |
    |              3.0 | 0.0668058455115 |
    |              4.0 |  0.102874432678 |
    |              5.0 |  0.123983739837 |
    |              6.0 |  0.481481481481 |
    |              7.0 |             0.4 |
    |              8.0 |  0.198555956679 |
    |              9.0 |  0.264840182648 |
    |             10.0 |  0.363184079602 |
    |             11.0 |  0.322751322751 |
    |             12.0 |  0.348837209302 |
    |             13.0 |  0.333333333333 |
    |             14.0 |  0.290076335878 |
    |             15.0 |  0.335820895522 |
    |             16.0 |  0.932692307692 |
    |             17.0 |  0.495145631068 |
    |             18.0 |  0.630434782609 |
    |             19.0 |         0.40625 |
    |             20.0 |  0.631578947368 |
    |             21.0 |  0.835616438356 |
    |             22.0 |  0.453333333333 |
    |             23.0 |            0.85 |
    |             24.0 |          0.5625 |
    +------------------+-----------------+
    (Output limit exceeded, 25 of 367 total rows shown)



-- Are there more reviews with the word "love" or with the word "hate" in them?
    -- More "love"
    SELECT reaction, count(*) total_count
    FROM (
        SELECT CASE WHEN LOWER(text) LIKE '%love%' THEN 'love'
                    WHEN LOWER(text) LIKE '%hate%' THEN 'hate' 
                    ELSE NULL END AS reaction
        FROM review)
    GROUP BY reaction
    ORDER BY total_count DESC
    +----------+-------------+
    | reaction | total_count |
    +----------+-------------+
    |     None |        8042 |
    |     love |        1780 |
    |     hate |         178 |
    +----------+-------------+



-- Find the top 10 users with the most fans:
    SELECT name, fans
    FROM user
    ORDER BY fans DESC
    LIMIT 10
    +-----------+------+
    | name      | fans |
    +-----------+------+
    | Amy       |  503 |
    | Mimi      |  497 |
    | Harald    |  311 |
    | Gerald    |  253 |
    | Christine |  173 |
    | Lisa      |  159 |
    | Cat       |  133 |
    | William   |  126 |
    | Fran      |  124 |
    | Lissa     |  120 |
    +-----------+------+



-- PART 2

-- Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
       SELECT b.city, c.category, b.review_count
            CASE    WHEN stars >= 4.0 THEN '4-5 stars'
                    WHEN stars >= 2.0 THEN '2-3 stars'
                    ELSE 'below 2' END AS 'rating',                         
            COUNT(hours) AS days_open,     
            COUNT(hours) / COUNT(DISTINCT b.id)  AS avg_days_open
        FROM ((business b INNER JOIN hours h ON b.id = h.business_id)
        INNER JOIN category c ON b.id = c.business_id)
        WHERE city = 'Las Vegas' AND c.category ='Restaurants'
        GROUP BY rating
        +-----------+-------------+--------------+-----------+-----------+---------------+
        | city      | category    | review_count | rating    | days_open | avg_days_open |
        +-----------+-------------+--------------+-----------+-----------+---------------+
        | Las Vegas | Restaurants |          123 | 2-3 stars |         7 |             7 |
        | Las Vegas | Restaurants |          768 | 4-5 stars |        14 |             7 |
        +-----------+-------------+--------------+-----------+-----------+---------------+
    -- Do the two groups you chose to analyze have a different distribution of hours? No difference in the average
    -- Do the two groups you chose to analyze have a different number of reviews? Yes
    -- Are you able to infer anything from the location data provided between these two groups? Yes, newer restaurans in Las Vegas tend to have fewer reviews and lower rating



-- Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
    SELECT is_open, 
        AVG(r.stars) as avg_rating,
        COUNT(DISTINCT r.id) as total_review
    FROM business b
    JOIN review r ON b.id =  r.business_id
    GROUP BY is_open
    +---------+---------------+--------------+
    | is_open |    avg_rating | total_review |
    +---------+---------------+--------------+
    |       0 | 3.64788732394 |           71 |
    |       1 |  3.7610619469 |          565 |
    +---------+---------------+--------------+
    -- Difference 1: average rating from the ones that closed is lower than those that are still open
    -- Difference 2: the ones that are open received more reviews (possibly more popular) compared to the closed ones



-- For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.
-- Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
    -- Indicate the type of analysis you chose to do:
        -- Most popular categories on Yelp in the past 7 days (from August 9, 2022)
    -- Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
        -- I want to know what categories are the most popular on Yelp in these past 7 days. The data that I need is total number of review and date from review table; and category from category table.
        -- By substracting current date and the review date, we can get the latest number of review based on the categories. I also want to add the average of stars rating to give a brief information on how users perceived these categories.
    --Output
    +------------------------+--------------+-----------+------------------------+
    | category               | count_review | avg_stars | days_since_last_review |
    +------------------------+--------------+-----------+------------------------+
    | Restaurants            |            6 |       4.0 |                      6 |
    | Food                   |            3 |       4.3 |                      5 |
    | American (Traditional) |            2 |       4.3 |                      5 |
    | Nightlife              |            2 |       3.8 |                      5 |
    | Breakfast & Brunch     |            2 |       4.0 |                      6 |
    | Ethnic Food            |            2 |       4.5 |                      6 |
    | Farmers Market         |            2 |       4.5 |                      6 |
    | Fruits & Veggies       |            2 |       4.5 |                      6 |
    | Market Stalls          |            2 |       4.5 |                      6 |
    | Meat Shops             |            2 |       4.5 |                      6 |
    +------------------------+--------------+-----------+------------------------+
    -- SQL code    
        SELECT 
            category.category, 
            COUNT(DISTINCT r.id) as count_review,   -- number of reviews in the past 7 days
            round(AVG(b.stars),1) as avg_stars,
            DATE('now') - r.date as days_since_last_review  -- how many days
        FROM ((review r LEFT JOIN business b on r.business_id = b.id) INNER JOIN category on b.id = category.business_id)
        WHERE days_since_last_review <= 7
        GROUP BY category.category
        ORDER BY count_review desc, days_since_last_review asc
        LIMIT 10
