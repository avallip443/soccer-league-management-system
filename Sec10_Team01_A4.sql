--- Group: Joseph Guirguis (501172194), Sindi Gurakuqi (501197737), Arathi Vallipuranathan (501168322)
 
CREATE TABLE CompetitionAdmin (
	CompetitionAdminID NUMBER PRIMARY KEY,
	FirstName VARCHAR2(25),
	LastName VARCHAR2(25),
	Email VARCHAR2(50) UNIQUE,
	PhoneNumber VARCHAR2(15),
	Username VARCHAR2(24) NOT NULL UNIQUE,
	AdminPassword VARCHAR2(24) NOT NULL,
	PRIMARY KEY (CompetitionAdminID)
);

INSERT INTO CompetitionAdmin (CompetitionAdminID, FirstName, LastName, Email, PhoneNumber, Username, AdminPassword) 
VALUES (1, 'John', 'Doe', 'johndoe@example.com', '416-100-0000', 'johndoe', 'password123');

INSERT INTO CompetitionAdmin (CompetitionAdminID, FirstName, LastName, Email, PhoneNumber, Username, AdminPassword) 
VALUES (2, 'Jane', 'Smith', 'janesmith@example.com', '416-200-0000', 'janesmith', 'securepassword456');

INSERT INTO CompetitionAdmin (CompetitionAdminID, FirstName, LastName, Email, PhoneNumber, Username, AdminPassword) 
VALUES (2, 'Bob', 'Smith', 'bobsmith@example.com', '416-300-0000', 'bobsmith', 'password456');



CREATE TABLE League (
	LeagueID NUMBER PRIMARY KEY,
	CompetitionAdminID NUMBER,
	LeagueName VARCHAR2(30) NOT NULL,
	CONSTRAINT fk_admin_for_league FOREIGN KEY (CompetitionAdminID) REFERENCES CompetitionAdmin(CompetitionAdminID)
);

INSERT INTO League (LeagueID, CompetitionAdminID, LeagueName)
VALUES (1, 1, 'English Premier League');

INSERT INTO League (LeagueID, CompetitionAdminID, LeagueName)
VALUES (2, 2, 'Spanish LALIGA');

INSERT INTO League (LeagueID, CompetitionAdminID, LeagueName)
VALUES (3, 3, 'Italian Serie A');



CREATE TABLE Team (
	TeamID NUMBER PRIMARY KEY,
	LeagueID NUMBER NOT NULL,
	CompetitionAdminID NUMBER NOT NULL,
	TeamName VARCHAR2(30) NOT NULL,
	Points NUMBER DEFAULT 0,
	Wins NUMBER DEFAULT 0,
	Losses NUMBER DEFAULT 0,
	Draws NUMBER DEFAULT 0,
	GoalsFor NUMBER DEFAULT 0,
	GoalsAgainst NUMBER DEFAULT 0,
	Venue VARCHAR2(20),
	GoalDifference NUMBER AS (GoalsFor - GoalsAgainst),
	CONSTRAINT fk_league_for_team FOREIGN KEY (LeagueID) REFERENCES League(LeagueID),
	CONSTRAINT fk_admin_for_team FOREIGN KEY (CompetitionAdminID) REFERENCES CompetitionAdmin(CompetitionAdminID),
    	CHECK (GoalsFor >= 0),
    	CHECK (GoalsAgainst >= 0)
);

-- Insert Premier League teams 
INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (1, 1, 1, 'Arsenal', 0, 0, 0, 0, 0, 0, 'Emirates Stadium');

INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (2, 1, 1, 'Liverpool', 0, 0, 0, 0, 0, 0, 'Anfield');

INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (3, 1, 1, 'Manchester City', 0, 0, 0, 0, 0, 0, 'Etihad Stadium');

-- Insert LaLiga Madrid
INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (4, 2, 2, 'Real Madrid', 0, 0, 0, 0, 0, 0, 'Santiago Bernabeu');

INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (5, 2, 2, 'Barcelona', 0, 0, 0, 0, 0, 0, 'Camp Nou');

INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (6, 2, 2, 'Atletico Madrid', 0, 0, 0, 0, 0, 0, 'Wanda Metropolitano');

-- Insert Series A
INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (7, 3, 2, 'Juventus', 0, 0, 0, 0, 0, 0, 'Allianz Stadium');

INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (8, 3, 2, 'AC Milan', 0, 0, 0, 0, 0, 0, 'San Siro');

INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (9, 3, 2, 'Inter Milan', 0, 0, 0, 0, 0, 0, 'San Siro');



CREATE TABLE Player (
	PlayerID NUMBER PRIMARY KEY,
	TeamID NUMBER NOT NULL,
	LeagueID NUMBER NOT NULL,
	CompetitionAdminID NUMBER NOT NULL,
	FirstName VARCHAR2(25) NOT NULL,
	LastName VARCHAR2(25) NOT NULL,
	Email VARCHAR2(30) UNIQUE,
	PhoneNumber VARCHAR2(15),
	Username VARCHAR2(24) NOT NULL UNIQUE,
	PlayerPassword VARCHAR2(24) NOT NULL,
	PlayerPosition VARCHAR2(15),
	PRIMARY KEY (PlayerID),
	CHECK (PlayerPosition IN ('Goalkeeper', 'Defender', 'Midfielder', 'Forward')),
    	CONSTRAINT fk_team_for_player FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

-- Insert players for Arsenal
INSERT INTO Player (PlayerID, TeamID, LeagueID, CompetitionAdminID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (1, 1, 1, 1, 'David', 'Raya', 'draya@arsenal.com', '416-400-0000', 'draya', 'password123', 'Goalkeeper');

INSERT INTO Player (PlayerID, TeamID, LeagueID, CompetitionAdminID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (2, 1, 1, 1, 'Leandro', 'Trossard', 'ltrossard@arsenal.com', '1234567891', 'ltrossard', 'password456', 'Forward');

INSERT INTO Player (PlayerID, TeamID, LeagueID, CompetitionAdminID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (3, 1, 1, 1, 'Thomas', 'Partey', 'tpartey@arsenal.com', '1234567892', 'tpartey', 'password789', 'Midfielder');
 
INSERT INTO Player (PlayerID, TeamID, LeagueID, CompetitionAdminID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (4, 1, 1, 1, 'William', 'Saliba', 'swaliba@arsenal.com', '1234567892', 'swaliba', 'password789', 'Defender');

-- Insert players for Barcelona
INSERT INTO Player (PlayerID, TeamID, LeagueID, CompetitionAdminID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (1, 5, 2, 2, 'Marc-André', 'ter Stegen', 'mstegen@arsenal.com', '416-400-0000', 'mstegen', 'password123', 'Goalkeeper');

INSERT INTO Player (PlayerID, TeamID, LeagueID, CompetitionAdminID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (2, 5, 2, 2, 'Lamine', 'Yamal', 'lyamal@arsenal.com', '1234567891', 'lyamal', 'password456', 'Forward');

INSERT INTO Player (PlayerID, TeamID, LeagueID, CompetitionAdminID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (3, 5, 2, 2, 'Marc', 'Casadó', 'mcasado@arsenal.com', '1234567892', 'mcasado', 'password789', 'Midfielder');

INSERT INTO Player (PlayerID, TeamID, LeagueID, CompetitionAdminID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (3, 5, 2, 2, 'Pau', 'Cubarsí', 'pcubarsi@arsenal.com', '1234567892', 'pcubarsi', 'password789', 'Defender');


CREATE TABLE TeamManagement (
    	TeamManagementID NUMBER PRIMARY KEY,
    	TeamID NUMBER NOT NULL,
    	FirstName VARCHAR2(25) NOT NULL,
    	LastName VARCHAR2(25) NOT NULL,
    	Email VARCHAR2(50) UNIQUE,
    	PhoneNumber VARCHAR2(20),
    	Username VARCHAR2(24) NOT NULL UNIQUE,
    	ManagementPassword VARCHAR2(255) NOT NULL,
    	TeamRole VARCHAR2(15),
    	CONSTRAINT fk_team_management_for_team FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);


CREATE TABLE Referee (
    	RefereeID NUMBER PRIMARY KEY,
    	FirstName VARCHAR2(25) NOT NULL,
    	LastName VARCHAR2(25) NOT NULL,
    	Email VARCHAR2(50) NOT NULL UNIQUE,
    	PhoneNumber VARCHAR2(20),
    	Username VARCHAR2(24) NOT NULL UNIQUE,
    	RefereePassword VARCHAR2(255) NOT NULL
);


CREATE TABLE Game (
    	GameID NUMBER PRIMARY KEY, 
    	CompetitionAdminID NUMBER NOT NULL,
    	RefereeID NUMBER NOT NULL,
    	GameLocation VARCHAR2(50) NOT NULL,
    	GameDate DATE NOT NULL,
    	GameTime TIMESTAMP,
    	MatchStatus VARCHAR2(10) DEFAULT 'SCHEDULED',
    	CONSTRAINT fk_admin_for_game FOREIGN KEY (CompetitionAdminID) REFERENCES CompetitionAdmin(CompetitionAdminID),
    	CONSTRAINT fk_referee_for_game FOREIGN KEY (RefereeID) REFERENCES Referee(RefereeID),
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

