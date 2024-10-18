#!/bin/bash

export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

DROP TABLE GamePlayerStats;
DROP TABLE GameTeamStats;
DROP TABLE Game;
DROP TABLE Referee;
DROP TABLE TeamManagement;
DROP TABLE Player;
DROP TABLE Team;
DROP TABLE League;
DROP TABLE CompetitionAdmin;

exit;
EOF
