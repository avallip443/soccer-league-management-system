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
	LeagueName VARCHAR2(30),
	PRIMARY KEY(LeagueID, CompetitionAdminID)
);


CREATE TABLE Team (
	TeamID NUMBER,
	LeagueID NUMBER REFERENCES League(LeagueID),
	CompetitionAdminID NUMBER REFERENCES CompetitionAdmin(CompetitionAdminID),
	TeamName VARCHAR2(30),
	Points NUMBER,
	Wins NUMBER,
	Losses NUMBER,
	Draws NUMBER,
	GoalsFor NUMBER,
	GoalsAgainst NUMBER,
	Venue VARCHAR2(20),
	GoalDifference NUMBER AS (GoalsFor - GoalsAgainst),
	PRIMARY KEY(TeamID, LeagueID, CompetitionAdminID)
);


CREATE TABLE Player (
	PlayerID NUMBER,
	FirstName VARCHAR2(25),
	LastName VARCHAR2(25),
	Email VARCHAR2(30),
	PhoneNumber VARCHAR2(15),
	Username VARCHAR2(24) NOT NULL,
	Password VARCHAR2(24) NOT NULL,
	Position VARCHAR2(15),
	PRIMARY KEY(PlayerID)
);
