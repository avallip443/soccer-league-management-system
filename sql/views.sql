
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

