#!/bin/bash

export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

-- Insert data into CompetitionAdmin table
INSERT INTO CompetitionAdmin (CompetitionAdminID, FirstName, LastName, Email, PhoneNumber, Username, AdminPassword) 
VALUES (1, 'Joseph', 'Guirguis', 'joe027@example.com', '400-000-0000', 'joe027', 'password123');


-- Insert data into League table
INSERT INTO League (LeagueID, CompetitionAdminID, LeagueName)
VALUES (1, 1, 'Mississauga League');


-- Insert data into Team table
-- Insert Mississauga league teams
INSERT INTO Team (TeamID, LeagueID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (1, 1, 'Mississauga Warriors', 10, 3, 2, 1, 14, 7, 'Churchill Medows Arena');

INSERT INTO Team (TeamID, LeagueID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (2, 1, 'Mississauga Dragons', 8, 2, 2, 2, 14, 12, 'Erin Mills Arena');

INSERT INTO Team (TeamID, LeagueID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (3, 1, 'Mississauga Eagles', 7, 2, 3, 1, 11, 20, 'Square One Arena');

INSERT INTO Team (TeamID, LeagueID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (4, 1, 'Mississauga Bull Dogs', 8, 2, 2, 2, 14, 14, 'Liverpool Frauds Arena');


-- Insert data into Player table
-- Insert players for teams for Mississauga league
-- Insert players for Mississauga Warriors
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (1, 1, 'Aiden', 'Aiden', 'Aiden@gmail.com', '145-541-9999', 'Aiden123', 'Aiden321', 'Goalkeeper');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (2, 1, 'Andrew', 'Andrew', 'Andrew@gmail.com', '145-541-9990', 'Andrew123', 'Andrew321', 'Defender');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (3, 1, 'Aaron', 'Aaron', 'Aaron@gmail.com', '145-541-9900', 'Aaron123', 'Aaron321', 'Midfielder');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (4, 1, 'Adam', 'Adam', 'Adam@gmail.com', '145-541-9000', 'Adam123', 'Adam321', 'Forward');

-- Insert players for Mississauga Dragons
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (5, 2, 'Beau', 'Beau', 'Beau@gmail.com', '145-541-1234', 'Beau123', 'Beau321', 'Goalkeeper');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (6, 2, 'Blake', 'Blake', 'Blake@gmail.com', '145-541-1233', 'Blake123', 'Blake321', 'Defender');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (7, 2, 'Belle', 'Belle', 'Belle@gmail.com', '145-541-1232', 'Belle123', 'Belle321', 'Midfielder');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (8, 2, 'Boron', 'Boron', 'Boron@gmail.com', '145-541-1231', 'Boron123', 'Boron321', 'Forward');

-- Insert players for Mississauga Eagles
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (9, 3, 'Caleb', 'Caleb', 'Caleb@gmail.com', '145-541-4321', 'Caleb123', 'Caleb321', 'Goalkeeper');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (10, 3, 'Colton', 'Colton', 'Colton@gmail.com', '145-541-4320', 'Colton123', 'Colton321', 'Defender');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (11, 3, 'Charles', 'Charles', 'Charles@gmail.com', '145-541-4310', 'Charles123', 'Charles321', 'Midfielder');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (12, 3, 'Collin', 'Collin', 'Collin@gmail.com', '145-541-4301', 'Collin123', 'Collin321', 'Forward');

-- Insert players for Mississauga Bull Dogs
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (13, 4, 'Drake', 'Drake', 'Drake@gmail.com', '145-541-1111', 'Drake123', 'Drake321', 'Goalkeeper');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (14, 4, 'David', 'David', 'David@gmail.com', '145-541-1110', 'David123', 'David321', 'Defender');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (15, 4, 'Dorris', 'Dorris', 'Dorris@gmail.com', '145-541-1100', 'Dorris123', 'Dorris321', 'Midfielder');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (16, 4, 'Darren', 'Darren', 'Darren@gmail.com', '145-541-1000', 'Darren123', 'Darren321', 'Forward');


-- Insert data into Team Management table
-- Insert management for Mississauga Warriors
INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (1, 1, 'Sindi1', 'Gur', 'sindi1@mwarriors.com', '000-017-0000', 'sindig1', 'password456', 'Manager');

INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (2, 1, 'Sindi2', 'Gur', 'sindi2@mwarriors.com', '000-018-0000', 'sindig2', 'password456', 'Assistant Manager');

-- Insert management for Mississauga Dragons
INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (3, 2, 'Arathi1', 'Vall', 'arathi1@mdragons.com', '000-019-0000', 'arathiv1', 'password567', 'Manager');

INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (4, 2, 'Arathi2', 'Vall', 'arathi2@mdragons.com', '000-020-0000', 'arathiv2', 'password567', 'Assistant Manager');

-- Insert management for Mississauga Dragons
INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (5, 3, 'Sindi3', 'Gur', 'sindi3@mwarriors.com', '000-021-0000', 'sindig3', 'password456', 'Manager');

INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (6, 3, 'Sindi4', 'Gur', 'sindi4@mwarriors.com', '000-022-0000', 'sindig4', 'password456', 'Assistant Manager');

-- Insert management for Mississauga Dragons
INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (7, 4, 'Arathi3', 'Vall', 'arathi3@mdragons.com', '000-023-0000', 'arathiv3', 'password567', 'Manager');

INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (8, 4, 'Arathi4', 'Vall', 'arathi4@mdragons.com', '000-024-0000', 'arathiv4', 'password567', 'Assistant Manager');


-- Insert data into Referee table
-- Insert fake referees
INSERT INTO Referee (RefereeID, FirstName, LastName, Email, PhoneNumber, Username, RefereePassword) 
VALUES (1, 'Jane', 'Doe', 'janedoe@referees.com', '555-001-0001', 'janedoe', 'password123');

INSERT INTO Referee (RefereeID, FirstName, LastName, Email, PhoneNumber, Username, RefereePassword) 
VALUES (2, 'Michael', 'Johnson', 'mjohnson@referees.com', '555-001-0002', 'mjohnson', 'password456');

INSERT INTO Referee (RefereeID, FirstName, LastName, Email, PhoneNumber, Username, RefereePassword) 
VALUES (3, 'David', 'Williams', 'dwilliams@referees.com', '555-001-0003', 'dwilliams', 'password789');

INSERT INTO Referee (RefereeID, FirstName, LastName, Email, PhoneNumber, Username, RefereePassword) 
VALUES (4, 'James', 'Brown', 'jbrown@referees.com', '555-001-0004', 'jbrown', 'password101');


-- Insert data into Game table
INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (1, 1, 1, 'Mississauga', TO_DATE('2024-10-01', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (2, 1, 2, 'Mississauga', TO_DATE('2024-10-02', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (3, 1, 3, 'Mississauga', TO_DATE('2024-10-03', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (4, 1, 4, 'Mississauga', TO_DATE('2024-10-04', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (5, 1, 1, 'Mississauga', TO_DATE('2024-10-05', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (6, 1, 2, 'Mississauga', TO_DATE('2024-10-06', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (7, 1, 3, 'Mississauga', TO_DATE('2024-10-07', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (8, 1, 4, 'Mississauga', TO_DATE('2024-10-08', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');
    
INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (9, 1, 1, 'Mississauga', TO_DATE('2024-10-09', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (10, 1, 2, 'Mississauga', TO_DATE('2024-10-10', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (11, 1, 3, 'Mississauga', TO_DATE('2024-10-11', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (12, 1, 4, 'Mississauga', TO_DATE('2024-10-12', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (1, 1, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM');


-- Insert data into GamePlayerStats table
-- Team 1
-- Game 1 (Total Goals = 1)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (1, 1, 5, 0, 0, 0, 0, 1, 'FIRSTTEAM'); 
-- Goalkeeper (5 saves, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (1, 2, 0, 1, 0, 2, 0, 0, 'FIRSTTEAM'); 
-- Defender (1 goal, 2 blocks)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (1, 3, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (1, 4, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward

-- Game 2 (Total Goals = 0)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (2, 1, 3, 0, 0, 0, 0, 1, 'FIRSTTEAM'); 
-- Goalkeeper (3 saves, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (2, 2, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Defender

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (2, 3, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (2, 4, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward

-- Game 3 (Total Goals = 4)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (3, 1, 2, 0, 0, 0, 0, 1, 'FIRSTTEAM'); 
-- Goalkeeper (2 saves, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (3, 2, 0, 1, 0, 1, 0, 1, 'FIRSTTEAM'); 
-- Defender (1 goal, 1 block, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (3, 3, 0, 1, 0, 0, 0, 1, 'FIRSTTEAM'); 
-- Midfielder (1 goal, 1 assist)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (3, 4, 0, 2, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward (2 goals)

-- Game 4 (Total Goals = 0)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (4, 1, 6, 0, 0, 0, 0, 1, 'FIRSTTEAM'); 
-- Goalkeeper (6 saves, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (4, 2, 0, 0, 0, 2, 0, 0, 'FIRSTTEAM'); 
-- Defender (2 blocks)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (4, 3, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (4, 4, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward

-- Game 7 (Total Goals = 9)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (7, 1, 4, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Goalkeeper (4 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (7, 2, 0, 0, 0, 3, 0, 1, 'FIRSTTEAM'); 
-- Defender (3 blocks, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (7, 3, 0, 5, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder (5 goals)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (7, 4, 0, 4, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward (4 goals)

-- Game 10 (Total Goals = 0)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (10, 1, 3, 0, 0, 0, 0, 1, 'FIRSTTEAM'); 
-- Goalkeeper (3 saves, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (10, 2, 0, 0, 0, 1, 0, 0, 'FIRSTTEAM'); 
-- Defender (1 block)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (10, 3, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (10, 4, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward

-- Team 2
-- Game 1 (Total Goals = 0)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (1, 5, 2, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Goalkeeper (2 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (1, 6, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Defender (0 goal)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (1, 7, 0, 0, 1, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder (0 goal, 1 assist)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (1, 8, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward (0 goal)

-- Game 4 (Total Goals = 3)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (4, 5, 3, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Goalkeeper (3 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (4, 6, 0, 2, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Defender (2 goals)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (4, 7, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (4, 8, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward (1 goal)

-- Game 5 (Total Goals = 4)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (5, 5, 2, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Goalkeeper (2 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (5, 6, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Defender

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (5, 7, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder (1 goal)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (5, 8, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward (3 goals)

-- Game 6 (Total Goals = 3)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (6, 5, 1, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Goalkeeper (1 save)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (6, 6, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Defender (1 goal)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (6, 7, 0, 1, 1, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder (1 goal, 1 assist)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (6, 8, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward (1 goal)

-- Game 8 (Total Goals = 2)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (8, 5, 2, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Goalkeeper (2 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (8, 6, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Defender (1 goal)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (8, 7, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (8, 8, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward (1 goal)

-- Game 11 (Total Goals = 2)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (11, 5, 4, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Goalkeeper (4 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (11, 6, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Defender

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (11, 7, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder (1 goal)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (11, 8, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward (1 goal)

-- Team 3
-- Game 7 (Total Goals = 0)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (7, 9, 2, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Goalkeeper (2 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (7, 10, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Defender (no goals)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (7, 11, 0, 0, 1, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder (1 assist)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (7, 12, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward (no goals)

-- Game 8 (Total Goals = 1)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (8, 9, 3, 0, 0, 0, 0, 1, 'FIRSTTEAM'); 
-- Goalkeeper (3 saves, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (8, 10, 0, 0, 0, 1, 0, 0, 'FIRSTTEAM'); 
-- Defender (1 block)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (8, 11, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder (1 goal)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (8, 12, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward (no goals)

-- Game 9 (Total Goals = 2)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (9, 9, 1, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Goalkeeper (1 save)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (9, 10, 0, 1, 0, 2, 0, 0, 'FIRSTTEAM'); 
-- Defender (1 goal, 2 blocks)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (9, 11, 0, 0, 1, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder (1 assist)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (9, 12, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward (1 goal)

-- Game 12 (Total Goals = 3)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (12, 9, 2, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Goalkeeper (2 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (12, 10, 0, 1, 0, 1, 0, 0, 'FIRSTTEAM'); 
-- Defender (1 goal, 1 block)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (12, 11, 0, 1, 1, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder (1 goal, 1 assist)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (12, 12, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward (1 goal)

-- Game 5 (Total Goals = 2)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (5, 9, 4, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Goalkeeper (4 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (5, 10, 0, 0, 0, 1, 0, 0, 'FIRSTTEAM'); 
-- Defender (1 block)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (5, 11, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder (no goals)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (5, 12, 0, 2, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward (2 goals)

-- Game 2 (Total Goals = 2)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (2, 9, 2, 0, 0, 0, 0, 1, 'FIRSTTEAM'); 
-- Goalkeeper (2 saves, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (2, 10, 0, 0, 0, 2, 0, 0, 'FIRSTTEAM'); 
-- Defender (2 blocks)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (2, 11, 0, 2, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder (2 goals)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (2, 12, 0, 0, 1, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward (no goals)

-- Team 4
-- Game 10 (Total Goals = 1)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (10, 13, 2, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Goalkeeper (2 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (10, 14, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Defender (1 goal)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (10, 15, 0, 0, 1, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder (1 assist)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (10, 16, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward (no contributions)

-- Game 11 (Total Goals = 2)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (11, 13, 3, 0, 0, 0, 0, 1, 'FIRSTTEAM'); 
-- Goalkeeper (3 saves, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (11, 14, 0, 1, 0, 1, 0, 0, 'FIRSTTEAM'); 
-- Defender (1 goal, 1 block)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (11, 15, 0, 0, 1, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder (1 assist)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (11, 16, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward (1 goal)

-- Game 12 (Total Goals = 2)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (12, 13, 2, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Goalkeeper (2 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (12, 14, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Defender (no contributions)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (12, 15, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Midfielder (1 goal)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (12, 16, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward (1 goal)

-- Game 9 (Total Goals = 3)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (9, 13, 1, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Goalkeeper (1 save)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (9, 14, 0, 0, 0, 1, 0, 0, 'FIRSTTEAM'); 
-- Defender (1 block)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (9, 15, 0, 0, 0, 1, 0, 0, 'FIRSTTEAM'); 
-- Midfielder (1 block)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (9, 16, 0, 3, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Forward (3 goals)

-- Game 6 (Total Goals = 3)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (6, 13, 3, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Goalkeeper (3 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (6, 14, 0, 0, 0, 1, 0, 1, 'FIRSTTEAM'); 
-- Defender (1 block, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (6, 15, 0, 0, 0, 1, 0, 0, 'FIRSTTEAM'); 
-- Midfielder (1 block)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (6, 16, 0, 3, 0, 1, 0, 0, 'FIRSTTEAM'); 
-- Forward (3 goals)

-- Game 3 (Total Goals = 3)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (3, 13, 2, 0, 0, 0, 0, 0, 'FIRSTTEAM'); 
-- Goalkeeper (2 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (3, 14, 0, 1, 0, 1, 0, 0, 'FIRSTTEAM'); 
-- Defender (1 goal, 1 block)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (3, 15, 0, 1, 0, 1, 0, 0, 'FIRSTTEAM'); 
-- Midfielder (1 goal)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (3, 16, 0, 1, 0, 1, 0, 0, 'FIRSTTEAM'); 
-- Forward (1 goal)


-- Insert data into GameTeamStats table
-- Games for Team 1 at home
--Game 1
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (1, 1, 1);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (1, 2, 0);

--Game 2
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (2, 1, 0);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (2, 3, 0);
--Game 3
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (3, 1, 4);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (3, 4, 3);

--Games for Team 2 at home
--Game 4
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (4, 2, 3);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (4, 1, 0);

--Game 5
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (5, 2, 4);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (5, 3, 5);

--Game 6
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (6, 2, 3);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (6, 4, 3);

--Games for Team 3 at home
--Game 7
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (7, 3, 0);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (7, 1, 9);

--Game 8
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (8, 3, 1);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (8, 2, 2);

--Game 9
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (9, 3, 2);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (9, 4, 3);

--Games for Team 4 at home
--Game 10
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (10, 4, 1);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (10, 1, 0);

--Game 11
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (11, 4, 2);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (11, 2, 2);

--Game 12
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (12, 4, 2);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (12, 3, 3);


exit;
EOF
