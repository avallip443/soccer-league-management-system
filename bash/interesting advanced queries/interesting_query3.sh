#!/bin/bash

export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "username/password@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

-- The Competition Admin wants to make sure all referees in the league (Mississauga League) have officiated an equal amount of games, uses COUNT and GROUP BY

CREATE VIEW EachRefereeOfficiatedTotal AS
SELECT c.Username AS AdminUsername,l.LeagueName,r.FirstName,r.LastName,COUNT(r.RefereeID) AS GamesOfficiated,l.LeagueID
FROM CompetitionAdmin c, League l, Referee r, Game g
WHERE c.CompetitionAdminID = l.CompetitionAdminID AND g.RefereeID = r.RefereeID 
AND g.CompetitionAdminID = l.CompetitionAdminID 
GROUP BY c.Username,l.LeagueName,r.FirstName,r.LastName,l.LeagueID
ORDER BY GamesOfficiated;

exit;
EOF
