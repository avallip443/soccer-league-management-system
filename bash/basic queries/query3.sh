#!/bin/sh
# export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.c)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

-- 3) Player with the most goals
SELECT p.PlayerID, p.FirstName, p.LastName, p.PlayerPosition, t.TeamName, SUM(gps.PlayerGoals) AS TotalGoals
FROM Player p, GamePlayerStats gps, Team t
WHERE p.PlayerID = gps.PlayerID AND p.TeamID = t.TeamID
GROUP BY p.PlayerID, p.FirstName, p.LastName, p.PlayerPosition, t.TeamName
ORDER BY TotalGoals DESC;

exit;
EOF
