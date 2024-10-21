#!/bin/bash

export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "username/passsword@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

-- 4) Get players who have scored but never received a yellow card using MINUS operator.

SELECT p.PlayerID, p.FirstName, p.LastName
FROM Player p
JOIN GamePlayerStats gps ON p.PlayerID = gps.PlayerID
WHERE gps.PlayerGoals > 0
MINUS
SELECT p.PlayerID, p.FirstName, p.LastName
FROM Player p
JOIN GamePlayerStats gps ON p.PlayerID = gps.PlayerID
WHERE gps.PlayerYellowCards > 0;

exit;
EOF
