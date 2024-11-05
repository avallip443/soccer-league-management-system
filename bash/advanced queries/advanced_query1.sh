#!/bin/bash

export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

--I am putting all the queries and views here

-- Queries

/* 
1) The Manager (Sindi1 with username sindig1) of Team 17 (Mississauga Warriors) wants to get all the players in her team to see how the lineup looks like for the next game. 
I want the database to search username currently using the website to get all players of the team Sindi1 manages. 
Maybe Sindi1 wants to update the lineup status or position of a player for next game because a player has poor performance or is injured or has a red card.
*/

SELECT FirstName, LastName, PlayerPosition
FROM Player
WHERE TeamID = (
    SELECT TeamID
    FROM TeamManagement
    WHERE Username = 'sindig1'
);

/* 
2) I am the Competition Admin (Joseph Guirguis with username joe027) and I want to see how the standings look, because by the end of the league,
I will transfer the top 4 teams to another competition admin who is controlling a league that is more prestigious.
*/

SELECT TeamName, Wins, Draws, Losses, GoalsFor, GoalsAgainst, GoalDifference, Points
FROM Team
WHERE LeagueID = (
    SELECT l.LeagueID
    FROM CompetitionAdmin c, League l
    WHERE c.Username = 'joe027' AND l.CompetitionAdminID = c.CompetitionAdminID
)
ORDER BY Points DESC, GoalDifference DESC, GoalsFor DESC;

/* 
VIEW #3
3) A general fan (specific league will be queried in view) wants to go on the website and check the 
player with the most goals scored in the league to see if his favourite player is doing
well this season.
*/

CREATE VIEW playersRankedByGoals AS
SELECT p.PlayerID,p.FirstName, p.LastName,p.PlayerPosition, t.TeamName, SUM(gps.PlayerGoals) AS TotalGoals,l.LeagueID
FROM Player p, GamePlayerStats gps, Team t, League l
WHERE p.PlayerID = gps.PlayerID AND p.TeamID = t.TeamID AND l.LeagueID = t.LeagueID
GROUP BY p.PlayerID,p.FirstName, p.LastName,p.PlayerPosition, t.TeamName,l.LeagueID
ORDER BY TotalGoals DESC;

/* 
VIEW #1
4) A general fan want to see all the games that were played for his favourite league (in the view, could search for specific league)
to remember the craziest matchups that happened and check if there are any new interesting games coming up.
*/

CREATE VIEW fixtures AS
SELECT LEAST(t1.TeamName,t2.TeamName) AS Team1,GREATEST(t1.TeamName,t2.TeamName) AS Team2,
gts1.Goals AS Team1Goals, gts2.Goals AS Team2Goals, g.GameDate,g.RefereeID,g.MatchStatus,l.LeagueName,l.LeagueID
FROM Game g, GameTeamStats gts1, GameTeamStats gts2, Team t1, Team t2,League l,CompetitionAdmin c
WHERE gts1.TeamID = t1.TeamID AND gts2.TeamID = t2.TeamID AND g.CompetitionAdminID = l.CompetitionAdminID
AND g.GameID = gts1.GameID AND g.GameID = gts2.GameID AND gts1.TeamID != gts2.TeamID 
AND (t1.TeamName != LEAST(t1.TeamName,t2.TeamName)) AND l.CompetitionAdminID = c.CompetitionAdminID
ORDER BY g.GameDate;

/* 
VIEW #2
7) The Competition Admin (Joseph Guirguis) wants to make sure all referees in the league (Mississauga League) have officiated an 
equal amount of games.
*/

CREATE VIEW EachRefereeOfficiatedTotal AS
SELECT c.Username AS AdminUsername,l.LeagueName,r.FirstName,r.LastName,COUNT(r.RefereeID) AS GamesOfficiated,l.LeagueID
FROM CompetitionAdmin c, League l, Referee r, Game g
WHERE c.CompetitionAdminID = l.CompetitionAdminID AND g.RefereeID = r.RefereeID 
AND g.CompetitionAdminID = l.CompetitionAdminID 
GROUP BY c.Username,l.LeagueName,r.FirstName,r.LastName,l.LeagueID
ORDER BY GamesOfficiated;

/*
8) A general fan wants to see all the games happening in october except the first week for the Mississauga League
*/

SELECT * 
FROM (
    SELECT * 
    FROM fixtures
    WHERE LeagueID = 4
    MINUS
    SELECT * 
    FROM fixtures
    WHERE GameDate BETWEEN TO_DATE('2024-10-01', 'YYYY-MM-DD') AND TO_DATE('2024-10-07', 'YYYY-MM-DD') AND LeagueID = 4
) 
ORDER BY GameDate;

/*
9) I want to find all the players with more than 2 yellow cards for the Mississauga League
*/
SELECT p.PlayerID, p.FirstName, p.LastName, p.TeamID, SUM(gps.PlayerYellowCards) as TotalYellowCards
FROM Player p, GamePlayerStats gps, Team t, League l
WHERE p.PlayerID = gps.PlayerID
AND p.TeamID = t.TeamID
AND t.LeagueID = l.LeagueID
AND l.LeagueID = 4 
GROUP BY p.PlayerID, p.FirstName, p.LastName, p.TeamID
HAVING SUM(gps.PlayerYellowCards) >= 2;  

/*
10) Get players who received yellow cards using the EXISTS operator.
*/
SELECT p.PlayerID, p.FirstName, p.LastName, t.TeamName
FROM Player p
JOIN Team t ON p.TeamID = t.TeamID
WHERE EXISTS (
    SELECT *
    FROM GamePlayerStats gps
    JOIN Player p2 ON gps.PlayerID = p2.PlayerID
    WHERE p2.TeamID = t.TeamID
    AND gps.PlayerYellowCards > 0
);

/* 
11) Get players who have scored but never received a yellow card using MINUS operator.
*/
SELECT p.PlayerID, p.FirstName, p.LastName
FROM Player p
JOIN GamePlayerStats gps ON p.PlayerID = gps.PlayerID
WHERE gps.PlayerGoals > 0
MINUS
SELECT p.PlayerID, p.FirstName, p.LastName
FROM Player p
JOIN GamePlayerStats gps ON p.PlayerID = gps.PlayerID
WHERE gps.PlayerYellowCards > 0;

/* 
12) Retrieve all players who either scored more than 2 goals and/or assisted 1 goal or more in a game  
*/
SELECT p.PlayerID,p.FirstName,p.LastName,gps.PlayerGoals,gps.PlayerAssists
FROM GamePlayerStats gps,Player p
WHERE gps.PlayerGoals > 2 and p.PlayerID = gps.PlayerID
UNION
SELECT p.PlayerID,p.FirstName,p.LastName,gps.PlayerGoals,gps.PlayerAssists
FROM GamePlayerStats gps, Player p
WHERE gps.PlayerAssists > 0 and p.PlayerID = gps.PlayerID;

/* 
5) A special trophy is given to those who got the most amount of hattricks or higher (3 goals or more in a single game). 
The competition Admin (Joseph Guirguis) wants to find who got the most amount of hattricks (more than 3 in a game counts as a hattrick).
*/

SELECT p.PlayerID, p.FirstName, p.LastName, p.PlayerPosition, t.TeamName,COUNT(gps.PlayerID) AS hattricks
FROM GamePlayerStats gps, Player p, Game g, Team t
WHERE p.PlayerID = gps.PlayerID AND gps.PlayerGoals >= 3 AND g.GameID = gps.GameID AND p.TeamID = t.TeamID
GROUP BY p.PlayerID, p.FirstName, p.LastName, p.PlayerPosition, t.TeamName
ORDER BY hattricks DESC;

/* 
VIEW #4
6) I am the Manager (username specified when querying by view of a specific Team (team is known from which manager we are querying) and I want to see the players who scored higher than 
0.5 to see who is providing the most value playing in the 'FIRSTTEAM' so that I can later adjust salaries and the First Team lineup.
*/

CREATE VIEW GoodPlayerPerformance AS
SELECT tm.Username,p.FirstName, p.LastName,p.PlayerPosition, t.TeamName, AVG(gps.PlayerGoals) AS GoalsPerGame
FROM Player p, GamePlayerStats gps, Team t, TeamManagement tm
WHERE p.PlayerID = gps.PlayerID AND p.TeamID = t.TeamID AND tm.TeamID = p.TeamID
GROUP BY tm.Username,p.FirstName, p.LastName,p.PlayerPosition, t.TeamName
HAVING AVG(gps.PlayerGoals) > 0.5
ORDER BY GoalsPerGame DESC;

-- Testing views

--View 1 => It was already tested by being used for another query

--View 2
SELECT FirstName,LastName,GamesOfficiated
FROM EachRefereeOfficiatedTotal
WHERE LeagueID = 4

--View 3 
SELECT PlayerID,FirstName, LastName,PlayerPosition,TeamName, TotalGoals
FROM playersRankedByGoals
WHERE LeagueID = 4;

--View 4
SELECT Username,FirstName AS PlayerFirstName, LastName AS PlayerLastName,PlayerPosition, TeamName, GoalsPerGame
FROM GoodPlayerPerformance
WHERE Username = 'arathiv2';


exit;
EOF
