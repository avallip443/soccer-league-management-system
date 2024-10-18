#!/bin/bash

export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

-- 2) League standings for 'joe027'
SELECT TeamName, Wins, Draws, Losses, GoalsFor, GoalsAgainst, GoalDifference, Points
FROM Team
WHERE LeagueID = (
    SELECT l.LeagueID
    FROM CompetitionAdmin c, League l
    WHERE c.Username = 'joe027' AND c.CompetitionAdminID = l.CompetitionAdminID
)
ORDER BY Points DESC, GoalDifference DESC, GoalsFor DESC;

exit;
EOF
