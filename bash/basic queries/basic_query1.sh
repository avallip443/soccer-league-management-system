#!/bin/bash

export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF


-- 1) Players in Team managed by 'sindig1'
SELECT FirstName, LastName, PlayerPosition
FROM Player
WHERE TeamID = (
    SELECT TeamID
    FROM TeamManagement
    WHERE Username = 'sindig1'
);

exit;
EOF
