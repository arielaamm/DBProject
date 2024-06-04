
[General]
Version=1

[Preferences]
Username=
Password=2153
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##BOSS
Name=ENGINEERS
Count=100..150

[Record]
Name=ENGINEER_ID
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
Name=SPECIALTY
Type=VARCHAR2
Size=100
Data=List('Propulsion', 'Aerodynamics', 'Structures', 'Avionics', 'Thermal', 'GNC', 'Materials', 'Systems', 'Operations', 'Mission Planning', 'Testing', 'Software', 'Safety', 'Integration', 'Orbital Mechanics')
Master=

[Record]
Name=PROJECT_ID
Type=NUMBER
Size=38
Data=SQL(SELECT * FROM (SELECT PROJECT_ID FROM PROJECTS ORDER BY DBMS_RANDOM.VALUE) WHERE ROWNUM = 1)
Master=

[Record]
Name=HIRE_DATE
Type=DATE
Size=
Data=Random(01/05/2015, 01/05/2020)
Master=

