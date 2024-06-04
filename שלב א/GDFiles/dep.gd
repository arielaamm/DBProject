
[General]
Version=1

[Preferences]
Username=
Password=2431
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=C##BOSS
Name=DEPARTMENTS
Count=10..20

[Record]
Name=DEPARTMENT_ID
Type=NUMBER
Size=38
Data=Random(10000, 99999)
Master=

[Record]
Name=DEPARTMENT_NAME
Type=VARCHAR2
Size=100
Data=Country + City
Master=

