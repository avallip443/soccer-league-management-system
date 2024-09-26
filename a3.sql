CREATE TABLE CompetitionAdmin (
	CompetitionAdminID NUMBER,
	FirstName VARCHAR2(25),
	LastName VARCHAR2(25),
	Email VARCHAR2(30),
	PhoneNumber VARCHAR2(15),
	Username VARCHAR2(24) NOT NULL,
	Password VARCHAR2(24) NOT NULL,
	PRIMARY KEY(CompetitionAdminID)
);


CREATE TABLE League (
	LeagueID NUMBER,
	CompetitionAdminID NUMBER REFERENCES CompetitionAdmin(CompetitionAdminID),
	LeagueName VARCHAR2(30) NOT NULL,
	PRIMARY KEY(LeagueID, CompetitionAdminID)
);


CREATE TABLE Team (
	TeamID NUMBER,
	LeagueID NUMBER REFERENCES League(LeagueID),
	CompetitionAdminID NUMBER REFERENCES CompetitionAdmin(CompetitionAdminID),
	TeamName VARCHAR2(30) NOT NULL,
	Points NUMBER NULL,
	Wins NUMBER NULL,
	Losses NUMBER NULL,
	Draws NUMBER NULL,
	GoalsFor NUMBER NULL,
	GoalsAgainst NUMBER NULL,
	Venue VARCHAR2(20) NULL,
	GoalDifference NUMBER AS (GoalsFor - GoalsAgainst) NULL,
	PRIMARY KEY(TeamID, LeagueID, CompetitionAdminID)
);


CREATE TABLE Player (
	PlayerID NUMBER,
	TeamID NUMBER REFERENCES Team(TeamID),
	FirstName VARCHAR2(25) NOT NULL,
	LastName VARCHAR2(25) NOT NULL,
	Email VARCHAR2(30),
	PhoneNumber VARCHAR2(15),
	Username VARCHAR2(24) NOT NULL,
	Password VARCHAR2(24) NOT NULL,
	Position VARCHAR2(15) NULL,
	PRIMARY KEY(PlayerID, TeamID)
);


CREATE TABLE TeamManagement (
	TeamManagementID NUMBER,
	TeamID NUMBER REFERENCES Team(TeamID),
	FirstName VARCHAR2(25) NOT NULL,
	LastName VARCHAR2(25) NOT NULL,
	Email VARCHAR2(30),
	PhoneNumber VARCHAR2(15),
	Username VARCHAR2(24) NOT NULL,
	Password VARCHAR2(24) NOT NULL,
	TeamRole VARCHAR2(15),
	PRIMARY KEY(TeamManagementID, TeamID)
);


CREATE TABLE Referee (
	RefereeID NUMBER,
	FirstName VARCHAR2(25),
	LastName VARCHAR2(25),
	Email VARCHAR2(30),
	PhoneNumber VARCHAR2(15),
	Username VARCHAR2(24) NOT NULL,
	Password VARCHAR2(24) NOT NULL,
	PRIMARY KEY(RefereeID)
);


CREATE TABLE Match (
	MatchID NUMBER, 
	CompetitionAdminID NUMBER REFERENCES CompetitionAdmin(CompetitionAdminID),
	RefereeID NUMBER REFERENCES Referee(RefereeID),
	Location VARCHAR2(30),
	Date DATE,
	Time TIMESTAMP,
	MatchStatus VARCHAR(10),
	PRIMARY KEY(RefereeID, CompetitionAdminID, RefereeID)
);
	
