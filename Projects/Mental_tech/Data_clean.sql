
--- Data exploration

-- first, we will look the questions

SELECT
	q.questiontext
FROM 
	Question q;

-- COUNT to verify 
SELECT COUNT (*) FROM Question q;

-- there are 105 questions, and it appears there are mixes questions

SELECT DISTINCT 
	AnswerText
FROM
	Answer a;


-- With the information that we have, explore the questions and answer and take a look to the format

SELECT 
	q.questionid,
	q.questionText,
	a.AnswerText
FROM 
	Answer a 
JOIN
	Question q  ON a.QuestionID  = q.questionid
WHERE
	q.questionid = 1;

-- Normalized values. we observed that -1 = NA, 0 = NO, 1 = YES
--Firts, search if the values are text

SELECT DISTINCT 
	AnswerText	
FROM 
	Answer a 
WHERE 
	a.AnswerText IN ('-1', '12', '0');

-- Reset de values 

UPDATE Answer 
SET AnswerText = 'N/A'
WHERE AnswerText = '-1';

UPDATE Answer  
SET AnswerText = 'No'
WHERE AnswerText = '0';

UPDATE Answer 
SET AnswerText = 'Yes'
WHERE AnswerText = '1';

---Check de change

SELECT DISTINCT 
	AnswerText
FROM 
	Answer
WHERE 
	AnswerText IN ('-1','0','1','N/A', 'No', 'Yes');



-- Now, verify if exist other type of Yes, No, N/A, No Answer

SELECT DISTINCT 
	AnswerText
FROM
	Answer 
WHERE
	LOWER(TRIM(AnswerText)) in ('yes', 'y', 'yess', 'ye', 'yep');

SELECT DISTINCT 
	AnswerText
FROM
	Answer 
WHERE LOWER(TRIM(AnswerText)) IN ('no', 'n', 'nope', 'nah');


SELECT DISTINCT 
	AnswerText
FROM
	Answer 
WHERE LOWER(TRIM(AnswerText)) IN ('na', 'n/a', 'n.a', 'n.a.', 'n\a'); -- We need to normalize

SELECT DISTINCT 
	AnswerText
FROM
	Answer 
WHERE LOWER(TRIM(AnswerText)) IN ('prefer not to say', 'rather not say', 'decline to answer');


--- Normalize the values 

UPDATE Answer
SET AnswerText = 'N/A'
WHERE LOWER(REPLACE(AnswerText, ' ', '')) IN ('na', 'n/a', 'n.a', 'n.a.', 'n\a');


-- In order to see good the number, and thinking that we already change -1, 1, 0, aply abs in the numbers 

SELECT DISTINCT
	AnswerText
FROM
	Answer 
WHERE 
	AnswerText GLOB '-*' OR AnswerText GLOB '[0-9]*';

-- we only need to change the questionid = 1

BEGIN;

UPDATE 
	Answer
SET
	AnswerText = CAST(ABS(CAST(AnswerText AS REAL))AS TEXT)
WHERE
	QuestionID = 1
AND AnswerText GLOB '-*';

COMMIT ;


-- Now change worlds in some questions 

--- change 'Maybe', 'Possibly', "Don't Know" for 'Maybe'



SELECT DISTINCT 
	AnswerText
FROM 
	Answer 
WHERE
	QuestionID = 33;

SELECT AnswerText
FROM   Answer
WHERE  QuestionID = 33
  AND  AnswerText IN ('Possibly', 'Don''t Know');


UPDATE 
	Answer 
SET
	AnswerText = 'Maybe'
WHERE 
	QuestionID  = 33
AND AnswerText IN ('Possibly', 'Don''t Know');

-- Check the change
SELECT DISTINCT 
	AnswerText
FROM 
	Answer 
WHERE
	QuestionID = 33;


--- Change 'United states of america ' and 'united states' for usa

SELECT DISTINCT 
	AnswerText
FROM 
	Answer
WHERE 
	QuestionID == 3;


BEGIN TRANSACTION;

UPDATE 
	Answer 
SET 
	AnswerText = 'Usa'
WHERE
	AnswerText IN ('United States', 'United States of America');

DELETE FROM
	Answer 
WHERE
	AnswerText = 'N/A' OR AnswerText = 'Other';

	
----Check

SELECT DISTINCT 
	AnswerText
FROM 
	Answer
WHERE 
	QuestionID == 3;

COMMIT;


















