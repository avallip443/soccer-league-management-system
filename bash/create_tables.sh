#!/bin/bash

export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF


CREATE TABLE CompetitionAdmin (
	CompetitionAdminID NUMBER PRIMARY KEY,
	FirstName VARCHAR2(25),
	LastName VARCHAR2(25),
	Email VARCHAR2(50) UNIQUE,
	PhoneNumber VARCHAR2(15),
	Username VARCHAR2(24) NOT NULL UNIQUE,
	AdminPassword VARCHAR2(24) NOT NULL
);

CREATE TABLE League (
    LeagueID NUMBER PRIMARY KEY,
    CompetitionAdminID NUMBER NOT NULL,
    LeagueName VARCHAR2(40) NOT NULL,
    CONSTRAINT fk_admin_for_league FOREIGN KEY (CompetitionAdminID) REFERENCES CompetitionAdmin(CompetitionAdminID)
);

CREATE TABLE Team (
    TeamID NUMBER PRIMARY KEY,
    LeagueID NUMBER NOT NULL,
    TeamName VARCHAR2(40) NOT NULL,
    Points NUMBER DEFAULT 0,
    Wins NUMBER DEFAULT 0,
    Losses NUMBER DEFAULT 0,
    Draws NUMBER DEFAULT 0,
    GoalsFor NUMBER DEFAULT 0,
    GoalsAgainst NUMBER DEFAULT 0,
    Venue VARCHAR2(40),
    GoalDifference NUMBER AS (GoalsFor - GoalsAgainst),
    CONSTRAINT fk_league_for_team FOREIGN KEY (LeagueID) REFERENCES League(LeagueID),
    CHECK (GoalsFor >= 0),
    CHECK (GoalsAgainst >= 0)
);

CREATE TABLE Player (
    PlayerID NUMBER PRIMARY KEY,
    TeamID NUMBER NOT NULL,
    FirstName VARCHAR2(25) NOT NULL,
    LastName VARCHAR2(25) NOT NULL,
    Email VARCHAR2(30) UNIQUE,
    PhoneNumber VARCHAR2(15),
    Username VARCHAR2(24) NOT NULL UNIQUE,
    PlayerPassword VARCHAR2(24) NOT NULL,
    PlayerPosition VARCHAR2(15),
    CHECK (PlayerPosition IN ('Goalkeeper', 'Defender', 'Midfielder', 'Forward')),
    CONSTRAINT fk_team_for_player FOREIGN KEY (TeamID) REFERENCES Team(TeamID)
);

CREATE TABLE TeamManagement (
    TeamManagementID NUMBER PRIMARY KEY,
    TeamID NUMBER NOT NULL,
    FirstName VARCHAR2(25) NOT NULL,
    LastName VARCHAR2(25) NOT NULL,
    Email VARCHAR2(50) UNIQUE,
    PhoneNumber VARCHAR2(20),
    Username VARCHAR2(24) NOT NULL UNIQUE,
    ManagementPassword VARCHAR2(24) NOT NULL,
    TeamRole VARCHAR2(40),
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

exit;
EOF
