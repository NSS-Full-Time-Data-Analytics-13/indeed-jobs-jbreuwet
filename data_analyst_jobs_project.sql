SELECT *
FROM data_analyst_jobs;

-- 1793 rows

SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- ExxonMobil is the 10th row

SELECT *
FROM data_analyst_jobs
WHERE location = 'TN';

-- 21 jobs in TN

SELECT *
FROM data_analyst_jobs
WHERE location = 'TN' OR location = 'KY';

-- 27 jobs in TN or KY

SELECT *
FROM data_analyst_jobs
WHERE location = 'TN' AND star_rating > 4;

-- 3 jobs in TN above 4 star rating

SELECT *
FROM data_analyst_jobs
WHERE review_count >= 500 AND review_count <= 1000;

-- 151 postings between 500 and 1000 reviews

SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE location IS NOT NULL AND star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;

-- Nebraska has the highest average star rating

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title IS NOT NULL;

-- 881 unique job titles

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE location = 'CA' AND title IS NOT NULL;

-- 230 unique job titles in CA

SELECT DISTINCT company, AVG(star_rating)
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT NULL
GROUP BY company;

-- 40 companies with more than 5000 reviews

SELECT DISTINCT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count > 5000 AND company IS NOT NULL
GROUP BY company
ORDER BY avg_rating DESC;

-- American Express has the highest rating of 4.2 (6 companies technically tied for 1st)


SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title ILIKE '%analyst%';

-- 774 jobs contain the word 'Analyst'

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE title NOT ILIKE '%analyst%' AND title NOT ILIKE '%analytics%';

-- 4 job postings without the words 'Analyst' or 'Analytics', these postings all related to Tableau

SELECT DISTINCT domain AS industry, COUNT(title) AS jobs_count
FROM data_analyst_jobs
WHERE skill ILIKE '%sql%' 
	AND days_since_posting > 21
	AND domain IS NOT NULL
GROUP BY industry
ORDER BY jobs_count DESC;

-- top 4 industries with hard to fill jobs are: Internet and Software with 62 jobs, Banks and Financial Services with 61 jobs, Consulting and Business Services with 57 jobs, and Health Care with 52 jobs, 




