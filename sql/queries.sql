-- Queries

/* 1) The Manager (Sindi1 with username cid1) of Team 1 (Mississauga Warriors) wants to 
see all the players in her team to see how the lineup looks like for the next game. I want the database to search username currently using the website to
get all players of the team Sindi1 manages. Maybe Sindi1 wants to update the lineup status or position of a player for next game because
a player has poor performance or is injured or has a red card.
*/

SELECT FirstName, LastName, PlayerPosition
FROM Player
WHERE TeamID = (
    SELECT TeamID
    FROM TeamManagement
    WHERE Username = 'Cid1'
);

/* 2) I am the Competition Admin (Joseph Guirguis with username joe027) and I want to see how the standings look because 
by the end of the league, I will transfer the top 4 teams to another competition admin (Anne) who is controlling a
league that is more prestigious
*/

SELECT TeamName, Wins, Draws, Losses, GoalsFor, GoalsAgainst, GoalDifference, Points
FROM Team
WHERE LeagueID = (
    SELECT l.LeagueID
    FROM CompetitionAdmin c, League l
    WHERE c.Username = 'joe027' AND c.CompetitionAdminID = l.CompetitionAdminID
)
ORDER BY Points DESC, GoalDifference DESC, GoalsFor DESC;

/* 3) A general Mississauga League fan wants to go on the website and check the 
player with the most goals scored in the league to see if his favourite player is doing
well this season.
*/

SELECT p.PlayerID,p.FirstName, p.LastName,p.PlayerPosition, t.TeamName, SUM(gps.PlayerGoals) AS TotalGoals
FROM Player p, GamePlayerStats gps, Team t
WHERE p.PlayerID = gps.PlayerID AND p.TeamID = t.TeamID
GROUP BY p.PlayerID,p.FirstName, p.LastName,p.PlayerPosition, t.TeamName
ORDER BY TotalGoals DESC;

/* 4) A general fan want to see all the games that were played for his favourite league (Mississauga League)
to remember the craziest matchups that happened and check if there are any new interesting games coming up.
*/

SELECT LEAST(t1.TeamName,t2.TeamName) AS Team1,GREATEST(t1.TeamName,t2.TeamName) AS Team2,gts1.Goals AS Team1Goals, gts2.Goals AS Team2Goals, g.GameDate,g.RefereeID,g.MatchStatus
FROM Game g, GameTeamStats gts1, GameTeamStats gts2, Team t1, Team t2
WHERE gts1.TeamID = t1.TeamID AND gts2.TeamID = t2.TeamID 
AND g.GameID = gts1.GameID AND g.GameID = gts2.GameID AND gts1.TeamID != gts2.TeamID 
AND (t1.TeamName != LEAST(t1.TeamName,t2.TeamName))
ORDER BY g.GameDate;

/* 5) A special trophy is given to those who got the most amount of hattricks or higher (3 goals or more in a single game). 
The competition Admin (Joseph Guirguis) wants to 
find who got the most amount of hattricks (more than 3 in a game counts as a hattrick).
*/

SELECT p.PlayerID,p.FirstName,p.LastName,p.PlayerPosition,t.TeamName,COUNT(gps.PlayerID) AS hattricks
FROM GamePlayerStats gps, Player p, Game g, Team t
WHERE p.PlayerID = gps.PlayerID AND gps.PlayerGoals >= 3 AND g.GameID = gps.GameID AND p.TeamID = t.TeamID
GROUP BY p.PlayerID,p.FirstName,p.LastName,p.PlayerPosition,t.TeamName
ORDER BY hattricks DESC;
