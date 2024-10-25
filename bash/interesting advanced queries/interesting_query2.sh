#!/bin/bash

export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

-- To see the players who scored higher than 0.5, used GROUP BY  

SELECT tm.Username,p.FirstName, p.LastName,p.PlayerPosition, t.TeamName, AVG(gps.PlayerGoals) AS GoalsPerGame
FROM Player p, GamePlayerStats gps, Team t, TeamManagement tm
WHERE p.PlayerID = gps.PlayerID AND p.TeamID = t.TeamID AND tm.TeamID = p.TeamID
GROUP BY tm.Username,p.FirstName, p.LastName,p.PlayerPosition, t.TeamName
HAVING AVG(gps.PlayerGoals) > 0.5
ORDER BY GoalsPerGame DESC;

exit;
EOF
