#USE CASE 1 
#finding errors in our dataset or people who voted twice(two ssn in same date.) 
SELECT
    ssn, election_date, COUNT(*) as votedTwice
FROM
    vote_table
GROUP BY
    ssn, election_date
HAVING 
    votedTwice > 1;
    
    
########################################################################################


#USE CASE 2 
#INVESTIGATING TWO VOTERS OVER THE PAST 4 YEARS
#How many time did Herrod vote over the last 4 elections. 
SELECT 
    firstName,
    lastName,
    partyAffiliation,
    votes,
    election_date,
    gender
FROM
    voter_table,
    vote_table
WHERE
    voter_table.ssn = vote_table.ssn
        AND firstName = 'Herrod';

#How many time did Morgan vote over the last 4 elections.
SELECT 
    firstName,
    lastName,
    partyAffiliation,
    votes,
    election_date,
    gender
FROM
    voter_table,
    vote_table
WHERE
    voter_table.ssn = vote_table.ssn
        AND firstName = 'Morgan';


########################################################################################
    
    
#USE CASE 3 
#Investigating Hennepin and Ramsey registered voters
SELECT 
    firstName, lastName, county, gender
FROM
    voter_table AS vtr
        INNER JOIN
    address_table AS adr ON vtr.precinct_id = adr.﻿precinct_id
WHERE
    county = 'Ramsey' OR county = 'Hennepin';
    
    
########################################################################################


#USE CASE 4
#republican votes count for all four years
select election_date,votes as party, count(*) as totalVotes
from vote_table
where votes ="Republican"
group by votes, election_date;

#democrat votes count for all four years
select election_date,votes as party, count(*) as totalVotes
from vote_table
where votes ="Democrat"
group by votes, election_date;


########################################################################################

    
#USE CASE 5 
#total number of registered voters categorized from genders
SELECT 
    gender, COUNT(gender) AS TotalNumberofVotes
FROM
    voter_table
GROUP BY gender;


/*-----------------------------------END-----------------------------------------------*/