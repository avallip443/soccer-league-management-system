-- Create Tables

CREATE TABLE LeagueAdmin (
    CompetitionAdminID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(25),
    LastName VARCHAR2(25),
    AdminPassword VARCHAR2(255) NOT NULL
);

CREATE TABLE LeagueAdminContact (
    CompetitionAdminID NUMBER PRIMARY KEY,
    Email VARCHAR2(50) UNIQUE,
    PhoneNumber VARCHAR2(20) UNIQUE,
    Username VARCHAR2(24) NOT NULL UNIQUE
);

CREATE TABLE League (
    LeagueID NUMBER PRIMARY KEY,
    LeagueName VARCHAR2(30) NOT NULL,
    CompetitionAdminID NUMBER,
    CONSTRAINT fk_admin_for_league FOREIGN KEY (CompetitionAdminID)
    REFERENCES LeagueAdminContact(CompetitionAdminID)
);

CREATE TABLE Team (
    TeamID NUMBER PRIMARY KEY,
    LeagueID NUMBER NOT NULL,
    CompetitionAdminID NUMBER NOT NULL,
    TeamName VARCHAR2(50) NOT NULL,
    CONSTRAINT fk_league_for_team FOREIGN KEY (LeagueID)
    REFERENCES League(LeagueID),
    CONSTRAINT fk_admin_for_team FOREIGN KEY (CompetitionAdminID)
    REFERENCES LeagueAdminContact(CompetitionAdminID)
); 

CREATE TABLE TeamStats (
    TeamID NUMBER PRIMARY KEY,
    Points NUMBER DEFAULT 0,
    Wins NUMBER DEFAULT 0,
    Losses NUMBER DEFAULT 0,
    Draws NUMBER DEFAULT 0,
    GoalsFor NUMBER DEFAULT 0,
    GoalsAgainst NUMBER DEFAULT 0,
    Venue VARCHAR2(50),
    GoalDifference NUMBER,
    CHECK (GoalsFor >= 0),
    CHECK (GoalsAgainst >= 0)
);

CREATE TABLE Player (
    PlayerID NUMBER PRIMARY KEY,
    TeamID NUMBER NOT NULL,
    FirstName VARCHAR2(25) NOT NULL,
    LastName VARCHAR2(25) NOT NULL,
    PlayerPassword VARCHAR2(255) NOT NULL,
    PlayerPosition VARCHAR2(15),
    CHECK (PlayerPosition IN ('Goalkeeper', 'Defender', 'Midfielder', 'Forward')),
    CONSTRAINT fk_team_for_player FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

CREATE TABLE PlayerContact (
    PlayerID NUMBER PRIMARY KEY,
    Email VARCHAR2(50) UNIQUE,
    PhoneNumber VARCHAR2(20) UNIQUE,
    Username VARCHAR2(24) NOT NULL UNIQUE
);

CREATE TABLE TeamManagement (
    TeamManagementID NUMBER PRIMARY KEY,
    TeamID NUMBER NOT NULL,
    FirstName VARCHAR2(25) NOT NULL,
    LastName VARCHAR2(25) NOT NULL,
    ManagementPassword VARCHAR2(255) NOT NULL,
    TeamRole VARCHAR2(15),
    CONSTRAINT fk_team_management_for_team FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

CREATE TABLE TeamManagementContact (
    TeamManagementID NUMBER PRIMARY KEY,
    Email VARCHAR2(50) UNIQUE,
    PhoneNumber VARCHAR2(20) UNIQUE,
    Username VARCHAR2(24) NOT NULL UNIQUE
);

CREATE TABLE Referee (
    RefereeID NUMBER PRIMARY KEY,
    FirstName VARCHAR2(25) NOT NULL,
    LastName VARCHAR2(25) NOT NULL,
    RefereePassword VARCHAR2(255) NOT NULL
);

CREATE TABLE RefereeContact (
    RefereeID NUMBER PRIMARY KEY,
    Email VARCHAR2(50) NOT NULL UNIQUE,
    PhoneNumber VARCHAR2(20) UNIQUE,
    Username VARCHAR2(24) NOT NULL UNIQUE
);

CREATE TABLE Game (
    GameID NUMBER PRIMARY KEY, 
    CompetitionAdminID NUMBER NOT NULL,
    RefereeID NUMBER NOT NULL,
    GameLocation VARCHAR2(50) NOT NULL,
    GameDate DATE NOT NULL,
    GameTime TIMESTAMP,
    CONSTRAINT fk_admin_for_game FOREIGN KEY (CompetitionAdminID)
        REFERENCES LeagueAdmin(CompetitionAdminID),
    CONSTRAINT fk_referee_for_game FOREIGN KEY (RefereeID)
        REFERENCES Referee(RefereeID)
);

CREATE TABLE GameStatus (
    GameID NUMBER PRIMARY KEY, 
    MatchStatus VARCHAR2(10) DEFAULT 'SCHEDULED',
    CHECK (MatchStatus IN ('SCHEDULED', 'COMPLETED', 'CANCELLED','DELAYED'))
);

CREATE TABLE GameTeamStats (
    GameID NUMBER NOT NULL,
    TeamID NUMBER NOT NULL,
    Goals NUMBER DEFAULT 0 NOT NULL,
    PRIMARY KEY (GameID, TeamID),
    CONSTRAINT fk_game_for_gameTeamStats FOREIGN KEY (GameID) REFERENCES Game(GameID),
    CONSTRAINT fk_team_for_gameTeamStats FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

CREATE TABLE GamePlayerStats (
    GameID NUMBER NOT NULL,
    PlayerID NUMBER NOT NULL,
    PlayerSaves NUMBER DEFAULT 0,
    PlayerGoals NUMBER DEFAULT 0,
    PlayerAssists NUMBER DEFAULT 0,
    PlayerBlocks NUMBER DEFAULT 0,
    PlayerRedCards NUMBER DEFAULT 0,
    PlayerYellowCards NUMBER DEFAULT 0,
    PlayerLineupStatus VARCHAR2(12) DEFAULT 'RESERVES',
    PRIMARY KEY (GameID, PlayerID),
    CONSTRAINT fk_game_for_gamePlayerStats FOREIGN KEY (GameID) REFERENCES Game(GameID),
    CONSTRAINT fk_player_for_gamePlayerStats FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
    CHECK (PlayerLineupStatus IN ('FIRSTTEAM', 'SUBSTITUTE', 'RESERVES'))
);

-- Populate Tables

-- League Admins
INSERT INTO LeagueAdmin (CompetitionAdminID, FirstName, LastName, AdminPassword)
VALUES (1, 'Joseph', 'Guirguis', 'password123');

INSERT INTO LeagueAdmin (CompetitionAdminID, FirstName, LastName, AdminPassword)
VALUES (2, 'Alice', 'Johnson', 'alicePass456');

INSERT INTO LeagueAdminContact (CompetitionAdminID, Email, PhoneNumber, Username)
VALUES (1, 'joseph.guirguis@example.com', '123-456-7890', 'joe027');

INSERT INTO LeagueAdminContact (CompetitionAdminID, Email, PhoneNumber, Username)
VALUES (2, 'alice.johnson@example.com', '234-567-8901', 'aliceJ');

-- Leagues
INSERT INTO League (LeagueID, LeagueName, CompetitionAdminID)
VALUES (1, 'Mississauga League', 1);

INSERT INTO League (LeagueID, LeagueName, CompetitionAdminID)
VALUES (2, 'Toronto Premier League', 2);

-- Teams
INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName)
VALUES (1, 1, 1, 'Mississauga Warriors');

INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName)
VALUES (2, 1, 1, 'Oakville Hawks');

INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName)
VALUES (3, 2, 2, 'Toronto Titans');

INSERT INTO TeamStats (TeamID, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue, GoalDifference)
VALUES (1, 30, 10, 2, 0, 25, 15, 'Mississauga Stadium', 10);

INSERT INTO TeamStats (TeamID, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue, GoalDifference)
VALUES (2, 25, 8, 3, 1, 20, 12, 'Oakville Arena', 8);

INSERT INTO TeamStats (TeamID, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue, GoalDifference)
VALUES (3, 18, 6, 5, 0, 18, 16, 'Toronto Field', 2);

-- Players
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, PlayerPassword, PlayerPosition)
VALUES (1, 1, 'Lionel', 'Messi', 'password456', 'Forward');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, PlayerPassword, PlayerPosition)
VALUES (2, 1, 'Cristiano', 'Ronaldo', 'password789', 'Forward');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, PlayerPassword, PlayerPosition)
VALUES (3, 2, 'Kevin', 'De Bruyne', 'password234', 'Midfielder');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, PlayerPassword, PlayerPosition)
VALUES (4, 3, 'Neymar', 'Jr', 'password567', 'Forward');

INSERT INTO PlayerContact (PlayerID, Email, PhoneNumber, Username)
VALUES (1, 'lionel.messi@example.com', '987-654-3210', 'messi10');

INSERT INTO PlayerContact (PlayerID, Email, PhoneNumber, Username)
VALUES (2, 'cristiano.ronaldo@example.com', '876-543-2109', 'ronaldo7');

INSERT INTO PlayerContact (PlayerID, Email, PhoneNumber, Username)
VALUES (3, 'kevin.debruyne@example.com', '765-432-1098', 'kdb17');

INSERT INTO PlayerContact (PlayerID, Email, PhoneNumber, Username)
VALUES (4, 'neymar.jr@example.com', '654-321-0987', 'neymar11');

-- Team Management
INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, ManagementPassword, TeamRole)
VALUES (1, 1, 'Sindi', 'Smith', 'password789', 'Coach');

INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, ManagementPassword, TeamRole)
VALUES (2, 2, 'James', 'White', 'pass123', 'Manager');

INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, ManagementPassword, TeamRole)
VALUES (3, 3, 'Sandra', 'Doe', 'password321', 'Assistant Coach');

INSERT INTO TeamManagementContact (TeamManagementID, Email, PhoneNumber, Username)
VALUES (1, 'sindi.smith@example.com', '567-890-1234', 'coach_sindi');

INSERT INTO TeamManagementContact (TeamManagementID, Email, PhoneNumber, Username)
VALUES (2, 'james.white@example.com', '456-789-0123', 'jwhite');

INSERT INTO TeamManagementContact (TeamManagementID, Email, PhoneNumber, Username)
VALUES (3, 'sandra.doe@example.com', '345-678-9012', 'sandraD');

-- Referees
INSERT INTO Referee (RefereeID, FirstName, LastName, RefereePassword)
VALUES (1, 'Michael', 'Oliver', 'ref12345');

INSERT INTO Referee (RefereeID, FirstName, LastName, RefereePassword)
VALUES (2, 'Pierluigi', 'Collina', 'ref45678');

INSERT INTO RefereeContact (RefereeID, Email, PhoneNumber, Username)
VALUES (1, 'michael.oliver@example.com', '456-789-0123', 'ref_mike');

INSERT INTO RefereeContact (RefereeID, Email, PhoneNumber, Username)
VALUES (2, 'pierluigi.collina@example.com', '789-012-3456', 'legend_ref');

-- Games
INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime)
VALUES (1, 1, 1, 'Mississauga Stadium', TO_DATE('2024-11-01', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'));

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime)
VALUES (2, 1, 2, 'Oakville Arena', TO_DATE('2024-11-03', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'));

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime)
VALUES (3, 2, 2, 'Toronto Field', TO_DATE('2024-11-05', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'));

INSERT INTO GameStatus (GameID, MatchStatus)
VALUES (1, 'SCHEDULED');

INSERT INTO GameStatus (GameID, MatchStatus)
VALUES (2, 'DELAYED');

INSERT INTO GameStatus (GameID, MatchStatus)
VALUES (3, 'COMPLETED');

-- Game Team Stats
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (1, 1, 3);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (1, 2, 1);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (2, 1, 2);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (2, 3, 3);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (3, 3, 4);

-- Game Player Stats
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (1, 1, 0, 2, 1, 0, 0, 0, 'FIRSTTEAM');

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (1, 2, 0, 1, 0, 0, 0, 1, 'FIRSTTEAM');

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (2, 3, 0, 2, 1, 1, 0, 0, 'FIRSTTEAM');

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (3, 4, 0, 3, 2, 0, 0, 1, 'FIRSTTEAM');

-- Queries

/* 
1) The Manager (Sindi1 with username sindig1) of Team 17 (Mississauga Warriors) wants to get all the players in her team to see how the lineup looks like for the next game. 
I want the database to search username currently using the website to get all players of the team Sindi1 manages. 
Maybe Sindi1 wants to update the lineup status or position of a player for next game because a player has poor performance or is injured or has a red card.
*/

SELECT p.FirstName, p.LastName, p.PlayerPosition
FROM Player p, TeamManagementContact tmc, TeamManagement tm
WHERE p.TeamID = tm.TeamID 
      AND tmc.Username = 'coach_sindi';

/* 
2) I am the Competition Admin (Joseph Guirguis with username joe027) and I want to see how the standings look, because by the end of the league,
I will transfer the top 4 teams to another competition admin who is controlling a league that is more prestigious.
*/

SELECT TeamName, Wins, Draws, Losses, GoalsFor, GoalsAgainst, GoalDifference, Points
FROM Team ,TeamStats 
WHERE LeagueID = (
    SELECT l.LeagueID
    FROM LeagueAdminContact c, League l
    WHERE c.Username = 'joe027' AND l.CompetitionAdminID = c.CompetitionAdminID
)
ORDER BY Points DESC, GoalDifference DESC, GoalsFor DESC;

/* 
3) A general fan (specific league will be queried in view) wants to go on the website and check the 
player with the most goals scored in the league to see if his favourite player is doing
well this season.
*/
SELECT p.PlayerID,p.FirstName, p.LastName,p.PlayerPosition, t.TeamName, SUM(gps.PlayerGoals) AS TotalGoals,l.LeagueID
FROM Player p, GamePlayerStats gps, Team t, League l
WHERE p.PlayerID = gps.PlayerID AND p.TeamID = t.TeamID AND l.LeagueID = t.LeagueID
GROUP BY p.PlayerID,p.FirstName, p.LastName,p.PlayerPosition, t.TeamName,l.LeagueID
ORDER BY TotalGoals DESC;

/* 
4) A general fan want to see all the games that were played for his favourite league (in the view, could search for specific league)
to remember the craziest matchups that happened and check if there are any new interesting games coming up.
*/

SELECT LEAST(t1.TeamName,t2.TeamName) AS Team1,GREATEST(t1.TeamName,t2.TeamName) AS Team2,
gts1.Goals AS Team1Goals, gts2.Goals AS Team2Goals, g.GameDate,g.RefereeID,gs.MatchStatus,l.LeagueName,l.LeagueID
FROM Game g, GameTeamStats gts1, GameTeamStats gts2, Team t1, Team t2,League l,LeagueAdmin c, GameStatus gs
WHERE gts1.TeamID = t1.TeamID AND gts2.TeamID = t2.TeamID AND g.CompetitionAdminID = l.CompetitionAdminID
AND g.GameID = gts1.GameID AND g.GameID = gts2.GameID AND gts1.TeamID != gts2.TeamID 
AND (t1.TeamName != LEAST(t1.TeamName,t2.TeamName)) AND l.CompetitionAdminID = c.CompetitionAdminID
ORDER BY g.GameDate;

/* 
5) The Competition Admin (Joseph Guirguis) wants to make sure all referees in the league (Mississauga League) have officiated an 
equal amount of games.
*/

SELECT cc.Username AS AdminUsername,l.LeagueName,r.FirstName,r.LastName,COUNT(r.RefereeID) AS GamesOfficiated,l.LeagueID
FROM LeagueAdmin c, League l, Referee r, Game g, LeagueAdminContact cc
WHERE c.CompetitionAdminID = l.CompetitionAdminID AND g.RefereeID = r.RefereeID 
AND g.CompetitionAdminID = l.CompetitionAdminID 
GROUP BY cc.Username,l.LeagueName,r.FirstName,r.LastName,l.LeagueID
ORDER BY GamesOfficiated;

/*
6) I want to find all the players with more than 2 yellow cards for the Mississauga League
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
7) Get players who received yellow cards using the EXISTS operator.
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
8) Get players who have scored but never received a yellow card using MINUS operator.
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
9) Retrieve all players who either scored more than 2 goals and/or assisted 1 goal or more in a game  
*/
SELECT p.PlayerID,p.FirstName,p.LastName,gps.PlayerGoals,gps.PlayerAssists
FROM GamePlayerStats gps,Player p
WHERE gps.PlayerGoals > 2 and p.PlayerID = gps.PlayerID
UNION
SELECT p.PlayerID,p.FirstName,p.LastName,gps.PlayerGoals,gps.PlayerAssists
FROM GamePlayerStats gps, Player p
WHERE gps.PlayerAssists > 0 and p.PlayerID = gps.PlayerID;

/* 
10) A special trophy is given to those who got the most amount of hattricks or higher (3 goals or more in a single game). 
The competition Admin (Joseph Guirguis) wants to find who got the most amount of hattricks (more than 3 in a game counts as a hattrick).
*/

SELECT p.PlayerID, p.FirstName, p.LastName, p.PlayerPosition, t.TeamName,COUNT(gps.PlayerID) AS hattricks
FROM GamePlayerStats gps, Player p, Game g, Team t
WHERE p.PlayerID = gps.PlayerID AND gps.PlayerGoals >= 3 AND g.GameID = gps.GameID AND p.TeamID = t.TeamID
GROUP BY p.PlayerID, p.FirstName, p.LastName, p.PlayerPosition, t.TeamName
ORDER BY hattricks DESC;

/* 
11) I am the Manager (username specified when querying by view of a specific Team (team is known from which manager we are querying) and I want to see the players who scored higher than 
0.5 to see who is providing the most value playing in the 'FIRSTTEAM' so that I can later adjust salaries and the First Team lineup.
*/

SELECT tmc.Username,p.FirstName, p.LastName,p.PlayerPosition, t.TeamName, AVG(gps.PlayerGoals) AS GoalsPerGame
FROM Player p, GamePlayerStats gps, Team t, TeamManagementContact tmc,  TeamManagement tm
WHERE p.PlayerID = gps.PlayerID AND p.TeamID = t.TeamID AND tm.TeamID = p.TeamID
GROUP BY tmc.Username,p.FirstName, p.LastName,p.PlayerPosition, t.TeamName
HAVING AVG(gps.PlayerGoals) > 0.5
ORDER BY GoalsPerGame DESC;



