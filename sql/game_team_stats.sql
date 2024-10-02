-- Games for Team 1 at home
--Game 1
INSERT INTO GameTeamStats VALUES (1,1,1);
INSERT INTO GameTeamStats VALUES (1,2,0);

--Game 2
INSERT INTO GameTeamStats VALUES (2,1,0);
INSERT INTO GameTeamStats VALUES (2,3,0);

--Game 3
INSERT INTO GameTeamStats VALUES (3,1,4);
INSERT INTO GameTeamStats VALUES (3,4,3);

--Games for Team 2 at home
--Game 4
INSERT INTO GameTeamStats VALUES (4,2,3);
INSERT INTO GameTeamStats VALUES (4,1,0);

--Game 5
INSERT INTO GameTeamStats VALUES (5,2,4);
INSERT INTO GameTeamStats VALUES (5,3,5);

--Game 6
INSERT INTO GameTeamStats VALUES (6,2,3);
INSERT INTO GameTeamStats VALUES (6,4,3);

--Games for Team 3 at home
--Game 7
INSERT INTO GameTeamStats VALUES (7,3,0);
INSERT INTO GameTeamStats VALUES (7,1,9);

--Game 8
INSERT INTO GameTeamStats VALUES (8,3,1);
INSERT INTO GameTeamStats VALUES (8,2,2);

--Game 9
INSERT INTO GameTeamStats VALUES (9,3,2);
INSERT INTO GameTeamStats VALUES (9,4,3);

--Games for Team 4 at home
--Game 10
INSERT INTO GameTeamStats VALUES (10,4,1);
INSERT INTO GameTeamStats VALUES (10,1,0);

--Game 11
INSERT INTO GameTeamStats VALUES (11,4,2);
INSERT INTO GameTeamStats VALUES (11,2,2);

--Game 12
INSERT INTO GameTeamStats VALUES (12,4,2);
INSERT INTO GameTeamStats VALUES (12,3,3);

select * from GameTeamStats;
delete from GameTeamStats;