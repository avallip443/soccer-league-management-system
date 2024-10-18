#!/bin/sh
# export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.c)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

-- 4) Games in Mississauga League
SELECT LEAST(t1.TeamName, t2.TeamName) AS Team1, GREATEST(t1.TeamName, t2.TeamName) AS Team2, gts1.Goals AS Team1Goals, gts2.Goals AS Team2Goals, g.GameDate, g.RefereeID, g.MatchStatus
FROM Game g, GameTeamStats gts1, GameTeamStats gts2, Team t1, Team t2
WHERE gts1.TeamID = t1.TeamID AND gts2.TeamID = t2.TeamID 
AND g.GameID = gts1.GameID AND g.GameID = gts2.GameID AND gts1.TeamID != gts2.TeamID
ORDER BY g.GameDate;

exit;
EOF
