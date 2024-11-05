#!/bin/bash

export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

-- Populate Tables

-- Competition Admin

INSERT INTO CompetitionAdmin (CompetitionAdminID, FirstName, LastName, Email, PhoneNumber, Username, AdminPassword) 
VALUES (1, 'John', 'Doe', 'jdoe@example.com', '100-000-0000', 'jdoe', 'password123');

INSERT INTO CompetitionAdmin (CompetitionAdminID, FirstName, LastName, Email, PhoneNumber, Username, AdminPassword) 
VALUES (2, 'Jane', 'Smith', 'jsmith@example.com', '200-000-0000', 'jsmith', 'password123');

INSERT INTO CompetitionAdmin (CompetitionAdminID, FirstName, LastName, Email, PhoneNumber, Username, AdminPassword) 
VALUES (3, 'Anne', 'Guirguis', 'anne027@example.com', '300-000-0000', 'anne027', 'password456');

INSERT INTO CompetitionAdmin (CompetitionAdminID, FirstName, LastName, Email, PhoneNumber, Username, AdminPassword) 
VALUES (4, 'Joesph', 'Guirguis', 'joe027@example.com', '400-000-0000', 'joe027', 'password123');

-- League

INSERT INTO League (LeagueID, CompetitionAdminID, LeagueName)
VALUES (1, 1, 'English Premier League');

INSERT INTO League (LeagueID, CompetitionAdminID, LeagueName)
VALUES (2, 2, 'Spanish LaLiga');

INSERT INTO League (LeagueID, CompetitionAdminID, LeagueName)
VALUES (3, 3, 'Italian Serie A');

INSERT INTO League (LeagueID, CompetitionAdminID, LeagueName)
VALUES (4, 4, 'Mississauga League');

UPDATE League
SET CompetitionAdminID = 4
WHERE LeagueID = 4;

-- Team

-- Insert Premier League teams 
INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (1, 1, 1,'Arsenal', 0, 0, 0, 0, 0, 0, 'Emirates Stadium');

INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (2, 1, 1,'Liverpool', 0, 0, 0, 0, 0, 0, 'Anfield');

INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (3, 1,1, 'Manchester City', 0, 0, 0, 0, 0, 0, 'Etihad Stadium');

-- Insert LaLiga teams
INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (4, 2,2, 'Real Madrid', 0, 0, 0, 0, 0, 0, 'Santiago Bernabeu');

INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (5, 2,2, 'Barcelona', 0, 0, 0, 0, 0, 0, 'Camp Nou');

INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (6, 2,2, 'Atletico Madrid', 0, 0, 0, 0, 0, 0, 'Wanda Metropolitano');

-- Insert Serie A teams
INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (7, 3, 3,'Juventus', 0, 0, 0, 0, 0, 0, 'Allianz Stadium');

INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (8, 3, 3,'AC Milan', 0, 0, 0, 0, 0, 0, 'San Siro');

INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (9, 3,3, 'Inter Milan', 0, 0, 0, 0, 0, 0, 'San Siro');

-- Insert Mississauga league teams
INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (10, 4, 4,'Mississauga Warriors', 10, 3, 2, 1, 14, 7, 'Churchill Medows Arena');

INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (11, 4, 4,'Mississauga Dragons', 8, 2, 2, 2, 14, 12, 'Erin Mills Arena');

INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (12, 4, 4,'Mississauga Eagles', 7, 2, 3, 1, 11, 20, 'Square One Arena');

INSERT INTO Team (TeamID, LeagueID, CompetitionAdminID, TeamName, Points, Wins, Losses, Draws, GoalsFor, GoalsAgainst, Venue) 
VALUES (13, 4,4, 'Mississauga Bull Dogs', 8, 2, 2, 2, 14, 14, 'Liverpool Frauds Arena');

-- Player 
select * from Player;
-- Insert players for teams for Premier League
-- Insert players for Arsenal
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (1, 1, 'David', 'Raya', 'draya@arsenal.com', '000-000-0001', 'draya', 'password123', 'Goalkeeper');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (2, 1, 'Leandro', 'Trossard', 'ltrossard@arsenal.com', '000-000-0002', 'ltrossard', 'password456', 'Forward');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (3, 1, 'Thomas', 'Partey', 'tpartey@arsenal.com', '000-000-0003', 'tpartey', 'password789', 'Midfielder');
 
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (4, 1, 'William', 'Saliba', 'swaliba@arsenal.com', '000-000-0004', 'swaliba', 'password78eg9', 'Defender');

-- Insert players for Liverpool
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (5, 2, 'Alisson', 'Becker', 'abecker@arsenal.com', '000-000-0005', 'abecker', 'password1023', 'Goalkeeper');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (6, 2, 'Luis', 'Díaz', 'ldiaz@arsenal.com', '000-000-0006', 'ldiaz', 'password7089', 'Forward');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (7, 2, 'Ryan', 'Gravenberch', 'rgravenberch@arsenal.com', '000-000-0007', 'rgravenberch', 'password7890', 'Midfielder');
 
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (8, 2, 'Virgil', 'van Dijk', 'vdijk@arsenal.com', '000-000-0008', 'vdijk', 'password789ki', 'Defender');

-- Insert players for Manchester City
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (9, 3, 'Ederson', 'Santana de Moraes', 'emoraes@arsenal.com', '000-000-0009', 'emoraes', 'password321', 'Goalkeeper');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (10, 3, 'Erling', 'Haaland', 'ehaaland@arsenal.com', '000-000-0010', 'haaland', 'password654', 'Forward');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (11, 3, 'Bernardo', 'Silva', 'bsilva@arsenal.com', '000-000-0011', 'bsilva', 'password987', 'Midfielder');
 
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (12, 3, 'Josko', 'Gvardiol', 'jgvardiol@arsenal.com', '000-000-0012', 'jgvardiol', 'password343', 'Defender');



-- Insert players for teams for LaLiga
-- Insert players for Real Madrid
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (13, 4, 'Thibaut', 'Courtois', 'tcourtois@realmadrid.com', '000-000-0013', 'tcourtois', 'password123', 'Goalkeeper');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (14, 4, 'Vinícius', 'Júnior', 'vjunior@realmadrid.com', '000-000-0014', 'vjunior', 'password456', 'Forward');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (15, 4, 'Luka', 'Modri?', 'lmodric@realmadrid.com', '000-000-0015', 'lmodric', 'password789', 'Midfielder');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (16, 4, 'Éder', 'Militão', 'emilitao@realmadrid.com', '000-000-0016', 'emilitao', 'password789', 'Defender');

-- Insert players for Barcelona
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (17, 5, 'Marc-André', 'ter Stegen', 'mstegen@arsenal.com', '000-000-0017', 'mstegen', 'password123', 'Goalkeeper');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (18, 5, 'Lamine', 'Yamal', 'lyamal@arsenal.com', '000-000-0018', 'lyamal', 'password456', 'Forward');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (19, 5, 'Marc', 'Casadó', 'mcasado@arsenal.com', '000-000-0019', 'mcasado', 'password789', 'Midfielder');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (20, 5, 'Pau', 'Cubarsí', 'pcubarsi@arsenal.com', '000-000-0020', 'pcubarsi', 'password789', 'Defender');

-- Insert players for Atletico Madrid
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (21, 6, 'Jan', 'Oblak', 'joblak@atleticomadrid.com', '000-000-0021', 'joblak', 'password123', 'Goalkeeper');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (22, 6, 'Julián', 'Álvarez', 'jalvarez@atleticomadrid.com', '000-000-0022', 'jalvarez', 'password456', 'Forward');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (23, 6, 'Marcos', 'Llorente', 'mllorente@atleticomadrid.com', '000-000-0023', 'mllorente', 'password789', 'Midfielder');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (24, 6, 'Reinildo', 'Mandava', 'rmandava@atleticomadrid.com', '000-000-0024', 'rmandava', 'password789', 'Defender');



-- Insert players for teams for Serie A
-- Insert players for Juventus
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (25, 7, 'Michele', 'Di Gregorio', 'mdigregorio@juventus.com', '000-000-0025', 'mdigregorio', 'password123', 'Goalkeeper');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (26, 7, 'Kenan', 'Yildiz', 'kyildiz@juventus.com', '000-000-0026', 'kyildiz', 'password456', 'Forward');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (27, 7, 'Douglas', 'Luiz', 'dluiz@juventus.com', '000-000-0027', 'dluiz', 'password789', 'Midfielder');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (28, 7, 'Andrea', 'Cambiaso', 'acambiaso@juventus.com', '000-000-0028', 'acambiaso', 'password789', 'Defender');

-- Insert players for AC Milan
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (29, 8, 'Mike', 'Maignan', 'mmaignan@acmilan.com', '000-000-0029', 'mmaignan', 'password123', 'Goalkeeper');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (30, 8, 'Rafael', 'Leão', 'rleao@acmilan.com', '000-000-0030', 'rleao', 'password456', 'Forward');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (31, 8, 'Tijjani', 'Reijnders', 'treijnders@acmilan.com', '000-000-0031', 'treijnders', 'password789', 'Midfielder');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (32, 8, 'Theo', 'Hernández', 'thernandez@acmilan.com', '000-000-0032', 'thernandez', 'password789', 'Defender');

-- Insert players for Inter Milan
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (33, 9, 'Yann', 'Sommer', 'ysommer@intermilan.com', '000-000-0033', 'ysommer', 'password123', 'Goalkeeper');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (34, 9, 'Marcus', 'Thuram', 'mthuram@intermilan.com', '000-000-0034', 'mthuram', 'password456', 'Forward');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (35, 9, 'Davide', 'Frattesi', 'dfrattesi@intermilan.com', '000-000-0035', 'dfrattesi', 'password789', 'Midfielder');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (36, 9, 'Carlos', 'Augusto', 'caugusto@intermilan.com', '000-000-0036', 'caugusto', 'password789', 'Defender');



-- Insert players for teams for Mississauga league
-- Insert players for Mississauga Warriors
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (37, 10, 'Aiden', 'Aiden', 'Aiden@gmail.com', '145-541-9999', 'Aiden123', 'Aiden321', 'Goalkeeper');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (38, 10, 'Andrew', 'Andrew', 'Andrew@gmail.com', '145-541-9990', 'Andrew123', 'Andrew321', 'Defender');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (39, 10, 'Aaron', 'Aaron', 'Aaron@gmail.com', '145-541-9900', 'Aaron123', 'Aaron321', 'Midfielder');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (40, 10, 'Adam', 'Adam', 'Adam@gmail.com', '145-541-9000', 'Adam123', 'Adam321', 'Forward');

-- Insert players for Mississauga Dragons
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (41, 11, 'Beau', 'Beau', 'Beau@gmail.com', '145-541-1234', 'Beau123', 'Beau321', 'Goalkeeper');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (42, 11, 'Blake', 'Blake', 'Blake@gmail.com', '145-541-1233', 'Blake123', 'Blake321', 'Defender');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (43, 11, 'Belle', 'Belle', 'Belle@gmail.com', '145-541-1232', 'Belle123', 'Belle321', 'Midfielder');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (44, 11, 'Boron', 'Boron', 'Boron@gmail.com', '145-541-1231', 'Boron123', 'Boron321', 'Forward');

-- Insert players for Mississauga Eagles
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (45, 12, 'Caleb', 'Caleb', 'Caleb@gmail.com', '145-541-4321', 'Caleb123', 'Caleb321', 'Goalkeeper');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (46, 12, 'Colton', 'Colton', 'Colton@gmail.com', '145-541-4320', 'Colton123', 'Colton321', 'Defender');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (47, 12, 'Charles', 'Charles', 'Charles@gmail.com', '145-541-4310', 'Charles123', 'Charles321', 'Midfielder');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (48, 12, 'Collin', 'Collin', 'Collin@gmail.com', '145-541-4301', 'Collin123', 'Collin321', 'Forward');

-- Insert players for Mississauga Bull Dogs
INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (49, 13, 'Drake', 'Drake', 'Drake@gmail.com', '145-541-1111', 'Drake123', 'Drake321', 'Goalkeeper');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (50, 13, 'David', 'David', 'David@gmail.com', '145-541-1110', 'David123', 'David321', 'Defender');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (51, 13, 'Dorris', 'Dorris', 'Dorris@gmail.com', '145-541-1100', 'Dorris123', 'Dorris321', 'Midfielder');

INSERT INTO Player (PlayerID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, PlayerPassword, PlayerPosition) 
VALUES (52, 13, 'Darren', 'Darren', 'Darren@gmail.com', '145-541-1000', 'Darren123', 'Darren321', 'Forward');

-- Team Management

-- Insert management for Arsenal
INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (1, 1, 'Mikel', 'Arteta', 'marteta@arsenal.com', '000-001-0000', 'marteta', 'password123', 'Manager');

INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (2, 1, 'Albert', 'Stuivenberg', 'astuivenberg@arsenal.com', '000-002-0000', 'astuivenberg', 'password234', 'Assistant');

-- Insert management for Liverpool
INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (3, 2, 'Arne', 'Slot', 'aslot@liverpool.com', '000-003-0000', 'aslot', 'password456', 'Manager');

INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (4, 2, 'Sipke', 'Hulshoff', 'shulshoff@liverpool.com', '000-004-0000', 'shulshoff', 'password567', 'Assistant');

-- Insert management for Manchester City
INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (5, 3, 'Pep', 'Guardiola', 'pguardiola@manchestercity.com', '000-005-0000', 'pguardiola', 'password789', 'Manager');

INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (6, 3, 'Carlos', 'Vicens', 'cvicens@manchestercity.com', '000-006-0000', 'cvicens', 'password890', 'Assistant');

-- Insert management for Real Madrid
INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (7, 5, 'Carlo', 'Ancelotti', 'cancelotti@realmadrid.com', '000-007-0000', 'cancelotti', 'password123', 'Manager');

INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (8, 5, 'Davide', 'Ancelotti', 'dancelotti@realmadrid.com', '000-008-0000', 'dancelotti', 'password234', 'Assistant');

-- Insert management for Atlético Madrid
INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (9, 6, 'Diego', 'Simeone', 'dsimeone@atleticomadrid.com', '000-009-0000', 'dsimeone', 'password456', 'Manager');

INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (10, 6, 'Nelson', 'Vivas', 'nvivas@atleticomadrid.com', '000-010-0000', 'nvivas', 'password567', 'Assistant');

-- Insert management for Juventus
INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (11, 7, 'Thiago', 'Motta', 'tmotta@juventus.com', '000-011-0000', 'tmotta', 'password789', 'Manager');

INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (12, 7, 'Alexandre', 'Hugeux', 'ahugeux@juventus.com', '000-012-0000', 'ahugeux', 'password890', 'Assistant');

-- Insert management for AC Milan
INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (13, 8, 'Paulo', 'Fonseca', 'pfonseca@acmilan.com', '000-013-0000', 'pfonseca', 'password123', 'Manager');

INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (14, 8, 'Paulo', 'Ferreira', 'pferreira@acmilan.com', '000-014-0000', 'pferreira', 'password234', 'Assistant');

-- Insert management for Inter Milan
INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (15, 9, 'Simone', 'Inzaghi', 'sinzaghi@intermilan.com', '000-015-0000', 'sinzaghi', 'password456', 'Manager');

INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (16, 9, 'Massimiliano', 'Farris', 'mfarris@intermilan.com', '000-016-0000', 'mfarris', 'password567', 'Assistant');

-- Insert management for Mississauga Warriors
INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (17, 10, 'Sindi1', 'Gur', 'sindi1@mwarriors.com', '000-017-0000', 'sindig1', 'password456', 'Manager');

INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (18, 10, 'Sindi2', 'Gur', 'sindi2@mwarriors.com', '000-018-0000', 'sindig2', 'password456', 'Assistant');

-- Insert management for Mississauga Dragons
INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (19, 11, 'Arathi1', 'Vall', 'arathi1@mdragons.com', '000-019-0000', 'arathiv1', 'password567', 'Manager');

INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (20, 11, 'Arathi2', 'Vall', 'arathi2@mdragons.com', '000-020-0000', 'arathiv2', 'password567', 'Assistant');

-- Insert management for Mississauga Dragons
INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (21, 12, 'Sindi3', 'Gur', 'sindi3@mwarriors.com', '000-021-0000', 'sindig3', 'password456', 'Manager');

INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (22, 12, 'Sindi4', 'Gur', 'sindi4@mwarriors.com', '000-022-0000', 'sindig4', 'password456', 'Assistant');

-- Insert management for Mississauga Dragons
INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (23, 13, 'Arathi3', 'Vall', 'arathi3@mdragons.com', '000-023-0000', 'arathiv3', 'password567', 'Manager');

INSERT INTO TeamManagement (TeamManagementID, TeamID, FirstName, LastName, Email, PhoneNumber, Username, ManagementPassword, TeamRole) 
VALUES (24, 13, 'Arathi4', 'Vall', 'arathi4@mdragons.com', '000-024-0000', 'arathiv4', 'password567', 'Assistant');

-- Referee

INSERT INTO Referee (RefereeID, FirstName, LastName, Email, PhoneNumber, Username, RefereePassword) 
VALUES (1, 'Jane', 'Doe', 'janedoe@referees.com', '555-001-0001', 'janedoe', 'password123');

INSERT INTO Referee (RefereeID, FirstName, LastName, Email, PhoneNumber, Username, RefereePassword) 
VALUES (2, 'Michael', 'Johnson', 'mjohnson@referees.com', '555-001-0002', 'mjohnson', 'password456');

INSERT INTO Referee (RefereeID, FirstName, LastName, Email, PhoneNumber, Username, RefereePassword) 
VALUES (3, 'David', 'Williams', 'dwilliams@referees.com', '555-001-0003', 'dwilliams', 'password789');

INSERT INTO Referee (RefereeID, FirstName, LastName, Email, PhoneNumber, Username, RefereePassword) 
VALUES (4, 'James', 'Brown', 'jbrown@referees.com', '555-001-0004', 'jbrown', 'password101');

-- Games

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (1, 4, 1, 'Mississauga', TO_DATE('2024-10-01', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (2, 4, 2, 'Mississauga', TO_DATE('2024-10-02', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (3, 4, 3, 'Mississauga', TO_DATE('2024-10-03', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (4, 4, 4, 'Mississauga', TO_DATE('2024-10-04', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (5, 4, 1, 'Mississauga', TO_DATE('2024-10-05', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (6, 4, 2, 'Mississauga', TO_DATE('2024-10-06', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (7, 4, 3, 'Mississauga', TO_DATE('2024-10-07', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (8, 4, 4, 'Mississauga', TO_DATE('2024-10-08', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');
    
INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (9, 4, 1, 'Mississauga', TO_DATE('2024-10-09', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (10, 4, 2, 'Mississauga', TO_DATE('2024-10-10', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (11, 4, 3, 'Mississauga', TO_DATE('2024-10-11', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

INSERT INTO Game (GameID, CompetitionAdminID, RefereeID, GameLocation, GameDate, GameTime, MatchStatus) 
VALUES (12, 4, 4, 'Mississauga', TO_DATE('2024-10-12', 'YYYY-MM-DD'), TO_TIMESTAMP('17:00:00', 'HH24:MI:SS'), 'SCHEDULED');

-- Game-Team-Stats

-- Games for Team 1 at home
--Game 1
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (1, 10, 1);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (1, 11, 0);


--Game 2
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (2, 10, 0);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (2, 12, 0);


--Game 3
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (3, 10, 4);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (3, 13, 3);



--Games for Team 2 at home
--Game 4
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (4, 11, 3);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (4, 10, 0);


--Game 5
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (5, 11, 4);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (5, 12, 5);


--Game 6
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (6, 11, 3);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (6, 13, 3);


--Games for Team 3 at home
--Game 7
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (7, 12, 0);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (7, 10, 9);


--Game 8
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (8, 12, 1);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (8, 11, 2);


--Game 9
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (9, 12, 2);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (9, 13, 3);


--Games for Team 4 at home
--Game 10
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (10, 13, 1);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (10, 10, 0);


--Game 11
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (11, 13, 2);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (11, 11, 2);


--Game 12
INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (12, 13, 2);

INSERT INTO GameTeamStats (GameID, TeamID, Goals)
VALUES (12, 12, 3);

-- Game-Player-Stats

-- Team 1
-- Game 1 (Total Goals = 1)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (1, 37, 5, 0, 0, 0, 0, 1, 'FIRSTTEAM'); -- Goalkeeper (5 saves, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (1, 38, 0, 1, 0, 2, 0, 0, 'FIRSTTEAM'); -- Defender (1 goal, 2 blocks)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (1, 39, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (1, 40, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward


-- Game 2 (Total Goals = 0)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (2, 37, 3, 0, 0, 0, 0, 1, 'FIRSTTEAM'); -- Goalkeeper (3 saves, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (2, 38, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Defender

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (2, 39, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (2, 40, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward


-- Game 3 (Total Goals = 4)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (3, 37, 2, 0, 0, 0, 0, 1, 'FIRSTTEAM'); -- Goalkeeper (2 saves, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (3, 38, 0, 1, 0, 1, 0, 1, 'FIRSTTEAM'); -- Defender (1 goal, 1 block, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (3, 39, 0, 1, 0, 0, 0, 1, 'FIRSTTEAM'); -- Midfielder (1 goal, 1 assist)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (3, 40, 0, 2, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward (2 goals)


-- Game 4 (Total Goals = 0)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (4, 37, 6, 0, 0, 0, 0, 1, 'FIRSTTEAM'); -- Goalkeeper (6 saves, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (4, 38, 0, 0, 0, 2, 0, 0, 'FIRSTTEAM'); -- Defender (2 blocks)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (4, 39, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (4, 40, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward


-- Game 7 (Total Goals = 9)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (7, 37, 4, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Goalkeeper (4 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (7, 38, 0, 0, 0, 3, 0, 1, 'FIRSTTEAM'); -- Defender (3 blocks, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (7, 39, 0, 5, 0, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder (5 goals)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (7, 40, 0, 4, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward (4 goals)


-- Game 10 (Total Goals = 0)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (10, 37, 3, 0, 0, 0, 0, 1, 'FIRSTTEAM'); -- Goalkeeper (3 saves, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (10, 38, 0, 0, 0, 1, 0, 0, 'FIRSTTEAM'); -- Defender (1 block)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (10, 39, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (10, 40, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward



-- Team 2
-- Game 1 (Total Goals = 0)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (1, 41, 2, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Goalkeeper (2 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (1, 42, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Defender (0 goal)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (1, 43, 0, 0, 1, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder (0 goal, 1 assist)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (1, 44, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward (0 goal)


-- Game 4 (Total Goals = 3)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (4, 41, 3, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Goalkeeper (3 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (4, 42, 0, 2, 0, 0, 0, 0, 'FIRSTTEAM'); -- Defender (2 goals)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (4, 43, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (4, 44, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward (1 goal)


-- Game 5 (Total Goals = 4)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (5, 41, 2, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Goalkeeper (2 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (5, 42, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Defender

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (5, 43, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder (1 goal)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (5, 44, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward (3 goals)


-- Game 6 (Total Goals = 3)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (6, 41, 1, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Goalkeeper (1 save)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (6, 42, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); -- Defender (1 goal)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (6, 43, 0, 1, 1, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder (1 goal, 1 assist)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (6, 44, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward (1 goal)


-- Game 8 (Total Goals = 2)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (8, 41, 2, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Goalkeeper (2 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (8, 42, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); -- Defender (1 goal)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (8, 43, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (8, 44, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward (1 goal)


-- Game 11 (Total Goals = 2)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (11, 41, 4, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Goalkeeper (4 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (11, 42, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Defender

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (11, 43, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder (1 goal)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (11, 44, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward (1 goal)



-- Team 3
-- Game 7 (Total Goals = 0)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (7, 45, 2, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Goalkeeper (2 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (7, 46, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Defender (no goals)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (7, 47, 0, 0, 1, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder (1 assist)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (7, 48, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward (no goals)


-- Game 8 (Total Goals = 1)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (8, 45, 3, 0, 0, 0, 0, 1, 'FIRSTTEAM'); -- Goalkeeper (3 saves, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (8, 46, 0, 0, 0, 1, 0, 0, 'FIRSTTEAM'); -- Defender (1 block)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (8, 47, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder (1 goal)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (8, 48, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward (no goals)


-- Game 9 (Total Goals = 2)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (9, 45, 1, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Goalkeeper (1 save)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (9, 46, 0, 1, 0, 2, 0, 0, 'FIRSTTEAM'); -- Defender (1 goal, 2 blocks)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (9, 47, 0, 0, 1, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder (1 assist)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (9, 48, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward (1 goal)


-- Game 12 (Total Goals = 3)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (12, 45, 2, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Goalkeeper (2 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (12, 46, 0, 1, 0, 1, 0, 0, 'FIRSTTEAM'); -- Defender (1 goal, 1 block)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (12, 47, 0, 1, 1, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder (1 goal, 1 assist)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (12, 48, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward (1 goal)


-- Game 5 (Total Goals = 2)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (5, 45, 4, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Goalkeeper (4 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (5, 46, 0, 0, 0, 1, 0, 0, 'FIRSTTEAM'); -- Defender (1 block)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (5, 47, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder (no goals)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (5, 48, 0, 2, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward (2 goals)


-- Game 2 (Total Goals = 2)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (2, 45, 2, 0, 0, 0, 0, 1, 'FIRSTTEAM'); -- Goalkeeper (2 saves, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (2, 46, 0, 0, 0, 2, 0, 0, 'FIRSTTEAM'); -- Defender (2 blocks)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (2, 47, 0, 2, 0, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder (2 goals)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (2, 48, 0, 0, 1, 0, 0, 0, 'FIRSTTEAM'); -- Forward (no goals)



-- Team 4
-- Game 10 (Total Goals = 1)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (10, 49, 2, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Goalkeeper (2 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (10, 50, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); -- Defender (1 goal)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (10, 51, 0, 0, 1, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder (1 assist)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (10, 52, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward (no contributions)


-- Game 11 (Total Goals = 2)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (11, 49, 3, 0, 0, 0, 0, 1, 'FIRSTTEAM'); -- Goalkeeper (3 saves, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (11, 50, 0, 1, 0, 1, 0, 0, 'FIRSTTEAM'); -- Defender (1 goal, 1 block)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (11, 51, 0, 0, 1, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder (1 assist)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (11, 52, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward (1 goal)


-- Game 12 (Total Goals = 2)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (12, 49, 2, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Goalkeeper (2 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (12, 50, 0, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Defender (no contributions)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (12, 51, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); -- Midfielder (1 goal)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (12, 52, 0, 1, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward (1 goal)


-- Game 9 (Total Goals = 3)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (9, 49, 1, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Goalkeeper (1 save)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (9, 50, 0, 0, 0, 1, 0, 0, 'FIRSTTEAM'); -- Defender (1 block)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (9, 51, 0, 0, 0, 1, 0, 0, 'FIRSTTEAM'); -- Midfielder (1 block)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (9, 52, 0, 3, 0, 0, 0, 0, 'FIRSTTEAM'); -- Forward (3 goals)


-- Game 6 (Total Goals = 3)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (6, 49, 3, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Goalkeeper (3 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (6, 50, 0, 0, 0, 1, 0, 1, 'FIRSTTEAM'); -- Defender (1 block, 1 yellow card)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (6, 51, 0, 0, 0, 1, 0, 0, 'FIRSTTEAM'); -- Midfielder (1 block)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (6, 52, 0, 3, 0, 1, 0, 0, 'FIRSTTEAM'); -- Forward (3 goals)


-- Game 3 (Total Goals = 3)
INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (3, 49, 2, 0, 0, 0, 0, 0, 'FIRSTTEAM'); -- Goalkeeper (2 saves)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (3, 50, 0, 1, 0, 1, 0, 0, 'FIRSTTEAM'); -- Defender (1 goal, 1 block)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (3, 51, 0, 1, 0, 1, 0, 0, 'FIRSTTEAM'); -- Midfielder (1 goal)

INSERT INTO GamePlayerStats (GameID, PlayerID, PlayerSaves, PlayerGoals, PlayerAssists, PlayerBlocks, PlayerRedCards, PlayerYellowCards, PlayerLineupStatus)
VALUES (3, 52, 0, 1, 0, 1, 0, 0, 'FIRSTTEAM'); -- Forward (1 goal)

exit;
EOF
