-- References Game and Player
DROP TABLE GamePlayerStats;

-- References Game and Team
DROP TABLE GameTeamStats;

-- References CompetitionAdmin and Referee
DROP TABLE Game;

-- Referenced by Game
DROP TABLE Referee;

-- References Team
DROP TABLE TeamManagement;

-- Referenced by TeamManagement and GamePlayerStats
DROP TABLE Player;

-- References League
DROP TABLE Team;

-- References CompetitionAdmin
DROP TABLE League;

-- Referenced by League
DROP TABLE CompetitionAdmin;
