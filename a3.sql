CREATE TABLE CompetitionAdmin {
	CompetitionAdminID NUMBER,
	FirstName VARCHAR2(25),
	LastName VARCHAR2(25),
	Email VARCHAR2(30),
	PhoneNumber VARCHAR2(15),
	Username VARCHAR2(24) NOT NULL,
	Password VARCHAR2(24) NOT NULL,
	PRIMARY KEY(CompetitionAdminID)
};


CREATE TABLE League {
	LeagueID NUMBER,
	CompetitionAdminID NUMBER REFERENCES CompetitionAdmin(CompetitionAdminID),
	PRIMARY KEY(LeagueID)
};

CREATE TABLE Player {
	PlayerID NUMBER,
	FirstName VARCHAR2(25),
	LastName VARCHAR2(25),
	Email VARCHAR2(30),
	PhoneNumber VARCHAR2(15),
	Username VARCHAR2(24) NOT NULL,
	Password VARCHAR2(24) NOT NULL,
	Position VARCHAR2(15),
	PRIMARY KEY(PlayerID)
};
