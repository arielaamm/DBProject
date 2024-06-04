
[General]
Version=1

[Preferences]
Username=
Password=2289
Database=
DateFormat=
CommitCount=100
CommitDelay=0
InitScript=

[Table]
Owner=C##BOSS
Name=PROJECTS
Count=10..20

[Record]
Name=PROJECT_ID
Type=NUMBER
Size=38
Data=Random(1000, 9999)
Master=

[Record]
Name=PROJECT_NAME
Type=VARCHAR2
Size=100
Data=Company
Master=

[Record]
Name=START_DATE
Type=DATE
Size=
Data=Random(01/05/2020, 01/05/2022)
Master=

[Record]
Name=END_DATE
Type=DATE
Size=
Data=Random(01/05/2023, 01/05/2024)
Master=

