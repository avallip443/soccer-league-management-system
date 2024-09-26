--- Group: Joseph Guirguis (501172194), Sindi Gurakuqi (501197737), Arathi Vallipuranathan (501168322)
 
CREATE TABLE CompetitionAdmin (
	CompetitionAdminID NUMBER,
	FirstName VARCHAR2(25),
	LastName VARCHAR2(25),
	Email VARCHAR2(30),
	PhoneNumber VARCHAR2(15),
	Username VARCHAR2(24) NOT NULL,
	AdminPassword VARCHAR2(24) NOT NULL,
	PRIMARY KEY (CompetitionAdminID)
);


CREATE TABLE League (
	LeagueID NUMBER,
	CompetitionAdminID NUMBER NOT NULL,
	LeagueName VARCHAR2(30) NOT NULL,
	PRIMARY KEY (LeagueID, CompetitionAdminID),
	FOREIGN KEY (CompetitionAdminID) REFERENCES CompetitionAdmin(CompetitionAdminID)
);


CREATE TABLE Team (
	TeamID NUMBER,
	LeagueID NUMBER NOT NULL,
	CompetitionAdminID NUMBER NOT NULL,
	TeamName VARCHAR2(30) NOT NULL,
	Points NUMBER NULL,
	Wins NUMBER NULL,
	Losses NUMBER NULL,
	Draws NUMBER NULL,
	GoalsFor NUMBER NULL,
	GoalsAgainst NUMBER NULL,
	Venue VARCHAR2(20) NULL,
	GoalDifference NUMBER AS (GoalsFor - GoalsAgainst) NULL,
	PRIMARY KEY (TeamID, LeagueID, CompetitionAdminID),
	FOREIGN KEY (LeagueID, CompetitionAdminID) REFERENCES League(LeagueID, CompetitionAdminID),
	FOREIGN KEY (CompetitionAdminID) REFERENCES CompetitionAdmin(CompetitionAdminID)
);


CREATE TABLE Player (
	PlayerID NUMBER,
	TeamID NUMBER NOT NULL,
	LeagueID NUMBER NOT NULL,
	CompetitionAdminID NUMBER NOT NULL,
	FirstName VARCHAR2(25) NOT NULL,
	LastName VARCHAR2(25) NOT NULL,
	Email VARCHAR2(30),
	PhoneNumber VARCHAR2(15),
	Username VARCHAR2(24) NOT NULL,
	PlayerPassword VARCHAR2(24) NOT NULL,
	PlayerPosition VARCHAR2(15) NULL,
	PRIMARY KEY (PlayerID),
	FOREIGN KEY (TeamID, LeagueID, CompetitionAdminID) REFERENCES Team(TeamID, LeagueID, CompetitionAdminID)
);


CREATE TABLE TeamManagement (
	TeamManagementID NUMBER,
	TeamID NUMBER NOT NULL,
	LeagueID NUMBER NOT NULL,
	CompetitionAdminID NUMBER NOT NULL,
	FirstName VARCHAR2(25) NOT NULL,
	LastName VARCHAR2(25) NOT NULL,
	Email VARCHAR2(30),
	PhoneNumber VARCHAR2(15),
	Username VARCHAR2(24) NOT NULL,
	ManagementPassword VARCHAR2(24) NOT NULL,
	TeamRole VARCHAR2(15),
	PRIMARY KEY (TeamManagementID, TeamID),
	FOREIGN KEY (TeamID, LeagueID, CompetitionAdminID) REFERENCES Team(TeamID, LeagueID, CompetitionAdminID)
);


CREATE TABLE Referee (
	RefereeID NUMBER,
	FirstName VARCHAR2(25) NOT NULL,
	LastName VARCHAR2(25) NOT NULL,
	Email VARCHAR2(30),
	PhoneNumber VARCHAR2(15),
	Username VARCHAR2(24) NOT NULL,
	RefereePassword VARCHAR2(24) NOT NULL,
	PRIMARY KEY (RefereeID)
);


CREATE TABLE Game (
	GameID NUMBER, 
	CompetitionAdminID NUMBER NOT NULL,
	RefereeID NUMBER NOT NULL,
	GameLocation VARCHAR2(30),
	GameDate DATE NOT NULL,
	GameTime TIMESTAMP,
	MatchStatus VARCHAR(10) DEFAULT 'SCHEDULED',
	PRIMARY KEY (GameID),
	FOREIGN KEY (CompetitionAdminID) REFERENCES CompetitionAdmin(CompetitionAdminID),
	FOREIGN KEY (RefereeID) REFERENCES Referee(RefereeID)
);


CREATE TABLE GameTeamStats (
	GameID NUMBER NOT NULL,
	TeamID NUMBER NOT NULL,
	LeagueID NUMBER NOT NULL,
	Goals NUMBER NULL,
	PRIMARY KEY (GameID, TeamID),
	FOREIGN KEY (GameID) REFERENCES Game(GameID),
	FOREIGN KEY (TeamID, LeagueID) REFERENCES Team(TeamID, LeagueID)
);


CREATE TABLE GamePlayerStats (
	GameID NUMBER NOT NULL,
	PlayerID NUMBER NOT NULL,
	CompetitionAdminID NUMBER NOT NULL,
	RefereeID NUMBER NOT NULL,
	TeamID NUMBER NOT NULL,
	LeagueID NUMBER NOT NULL,
	Saves NUMBER NULL,
	Goals NUMBER NULL,
	Assists NUMBER NULL,
	Blocks NUMBER NULL,
	RedCards NUMBER NULL,
	YellowCards NUMBER NULL,
	PRIMARY KEY (GameID, PlayerID),
	FOREIGN KEY (GameID, CompetitionAdminID, RefereeID) REFERENCES Game(GameID, CompetitionAdminID, RefereeID),
	FOREIGN KEY (PlayerID) REFERENCES Player(PlayerID),
);

