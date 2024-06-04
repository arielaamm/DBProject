
[General]
Version=1

[Preferences]
Username=
Password=2111
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##BOSS
Name=OFFICETECHNICIANS
Count=10..20

[Record]
Name=TECHNICIAN_ID
Type=NUMBER
Size=38
Data=Random(10000, 99999)
Master=

[Record]
Name=FIRST_NAME
Type=VARCHAR2
Size=100
Data=FirstName
Master=

[Record]
Name=LAST_NAME
Type=VARCHAR2
Size=100
Data=LastName
Master=

[Record]
Name=SUPERVISOR_ID
Type=NUMBER
Size=38
Data=Random(10000, 999999)
Master=

[Record]
Name=HIRE_DATE
Type=DATE
Size=
Data=Random(01/05/2018, 01/05/2020)
Master=

[Record]
Name=MANAGER_ID
Type=NUMBER
Size=38
Data=SQL(SELECT * FROM (SELECT MANAGER_ID FROM PROJECTMANAGERS
= ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1)
Master=

