-- 
-- Drop Table Script
-- Date: May 20 2024 21:00
-- Generated for dropping tables in the correct order considering foreign key constraints
--

-- Revoke permissions from 'public'
REVOKE ALL ON Projects FROM public
/
REVOKE ALL ON Departments FROM public
/
REVOKE ALL ON Engineers FROM public
/
REVOKE ALL ON SafetyOfficers FROM public
/
REVOKE ALL ON ProjectManagers FROM public
/
REVOKE ALL ON OfficeTechnicians FROM public
/

-- Drop Tables in reverse order to ensure smooth execution considering foreign key dependencies

-- Drop OfficeTechnicians table
DROP TABLE OfficeTechnicians
/

-- Drop ProjectManagers table
DROP TABLE ProjectManagers
/

-- Drop SafetyOfficers table
DROP TABLE SafetyOfficers
/

-- Drop Engineers table
DROP TABLE Engineers
/

-- Drop Departments table
DROP TABLE Departments
/

-- Drop Projects table
DROP TABLE Projects
/

exit;
