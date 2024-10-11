/* Create view of all players with over 3 red cards. Joins tables Player and GamePlayerStats. */
CREATE VIEW bad_players AS
SELECT p.PlayerID, p.FirstName, p.LastName, p.TeamID, SUM(gps.PlayerRedCards) as TotalRedCards
FROM Player p 
JOIN GamePlayerStats gps on p.PlayerID = gps.PlayerID
GROUP BY p.PlayerID, p.FirstName, p.LastName, p.TeamID
HAVING SUM(gps.PlayerRedCards) > 3;


/* Create view of all upcoming games with teams participating. Joins tables Game, GameTeamStats, and Team. */
CREATE VIEW upcoming_matches_at_venue AS
SELECT g.GameID, g.GameLocation, g.GameDate, g.GameTime, g.MatchStatus, t.TeamName 
FROM Game g
JOIN GameTeamStats gts ON g.GameID = gts.GameID
JOIN Team t ON gts.TeamID = t.TeamID
WHERE g.MatchStatus = 'SCHEDULED';


/* Create view of top scorers. Joins tables Player and GamePlayerStats. */
CREATE VIEW top_scorers AS
SELECT p.PlayerID, p.FirstName, p.LastName, p.TeamID, SUM(gps.PlayerGoals) as TotalScores
FROM Player p
JOIN GamePlayerStats gps on p.PlayerID = gpa.PlayerID
GROUP BY p.PlayerID, p.FirstName, p.LastName, p.TeamID
HAVING SUM(gps.PlayerGoals) > 3;


/* Create view of active teams in a league. Joins tables League and Team. */
CREATE VIEW active_teams AS
SELECT l.LeagueName, t.TeamID, t.TeamName, t.Points, t.Wins, t.Losses, t.Draws
FROM League l
JOIN Team t on t.LeagueID = l.LeagueID


/* Create view of game summary with stats of both teams. */
CREATE VIEW game_summary AS
SELECT g.GameID, g.GameDate, g.GameLocation, SUM(gts.Goals) as TotalGoalsScored
FROM Game g
JOIN GameTeamStats gts ON g.GameID = gts.GameID
GROUP BY g.GameID, g.GameDate, g.GameLocation;



/* Create view of all games played and upcoming games within a league. Joins tables Team, League, Games, GameTeamStats, and CompetitionAdmin tables.. */
CREATE VIEW fixtures AS
SELECT LEAST(t1.TeamName, t2.TeamName) AS Team1, GREATEST(t1.TeamName, t2.TeamName) AS Team2,
gts1.Goals AS Team1Goals, gts2.Goals AS Team2Goals, g.GameDate, g.RefereeID, g.MatchStatus, l.LeagueName, l.LeagueID
FROM Game g, GameTeamStats gts1, GameTeamStats gts2, Team t1, Team t2, League l, CompetitionAdmin c
WHERE gts1.TeamID = t1.TeamID AND gts2.TeamID = t2.TeamID AND g.CompetitionAdminID = l.CompetitionAdminID
AND g.GameID = gts1.GameID AND g.GameID = gts2.GameID AND gts1.TeamID != gts2.TeamID 
AND (t1.TeamName != LEAST(t1.TeamName,t2.TeamName)) AND l.CompetitionAdminID = c.CompetitionAdminID
ORDER BY g.GameDate;


/* 
VIEW #3
3) A general fan (specific league will be queried in view) wants to go on the website and check the 
player with the most goals scored in the league to see if his favourite player is doing
well this season.
*/

CREATE VIEW playersRankedByGoals AS
SELECT p.PlayerID, p.FirstName, p.LastName, p.PlayerPosition, t.TeamName, SUM(gps.PlayerGoals) AS TotalGoals, l.LeagueID
FROM Player p, GamePlayerStats gps, Team t, League l
WHERE p.PlayerID = gps.PlayerID AND p.TeamID = t.TeamID AND l.LeagueID = t.LeagueID
GROUP BY p.PlayerID,p.FirstName, p.LastName,p.PlayerPosition, t.TeamName,l.LeagueID
ORDER BY TotalGoals DESC;



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


