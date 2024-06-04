prompt PL/SQL Developer Export Tables for user C##BOSS@XE
prompt Created by arial on יום שלישי 21 מאי 2024
set feedback off
set define off

prompt Creating DEPARTMENTS...
create table DEPARTMENTS
(
  department_id   NUMBER(38) not null,
  department_name VARCHAR2(100) not null
)
;
alter table DEPARTMENTS
  add constraint PK_DEPARTMENTS primary key (DEPARTMENT_ID)
  using index 
  ;
grant select, insert, update, delete, references, alter, index, debug, read on DEPARTMENTS to PUBLIC;

prompt Creating PROJECTS...
create table PROJECTS
(
  project_id   NUMBER(38) not null,
  project_name VARCHAR2(100) not null,
  start_date   DATE not null,
  end_date     DATE not null
)
;
alter table PROJECTS
  add constraint PK_PROJECTS primary key (PROJECT_ID)
  using index 
  ;
grant select, insert, update, delete, references, alter, index, debug, read on PROJECTS to PUBLIC;

prompt Creating ENGINEERS...
create table ENGINEERS
(
  engineer_id NUMBER(38) not null,
  first_name  VARCHAR2(100) not null,
  last_name   VARCHAR2(100) not null,
  specialty   VARCHAR2(100) not null,
  project_id  NUMBER(38) not null,
  hire_date   DATE not null
)
;
alter table ENGINEERS
  add constraint PK_ENGINEERS primary key (ENGINEER_ID)
  using index 
  ;
alter table ENGINEERS
  add constraint FK_ENGINEERS foreign key (PROJECT_ID)
  references PROJECTS (PROJECT_ID);
grant select, insert, update, delete, references, alter, index, debug, read on ENGINEERS to PUBLIC;

prompt Creating PROJECTMANAGERS...
create table PROJECTMANAGERS
(
  manager_id    NUMBER(38) not null,
  first_name    VARCHAR2(100) not null,
  last_name     VARCHAR2(100) not null,
  project_id    NUMBER(38) not null,
  department_id NUMBER(38) not null,
  hire_date     DATE not null
)
;
alter table PROJECTMANAGERS
  add constraint PK_PROJECTMANAGERS primary key (MANAGER_ID)
  using index 
  ;
alter table PROJECTMANAGERS
  add constraint FK_PROJECTMANAGERS foreign key (DEPARTMENT_ID)
  references DEPARTMENTS (DEPARTMENT_ID);
alter table PROJECTMANAGERS
  add constraint FK_PROJECTMANAGERS2 foreign key (PROJECT_ID)
  references PROJECTS (PROJECT_ID);
grant select, insert, update, delete, references, alter, index, debug, read on PROJECTMANAGERS to PUBLIC;

prompt Creating OFFICETECHNICIANS...
create table OFFICETECHNICIANS
(
  technician_id NUMBER(38) not null,
  first_name    VARCHAR2(100) not null,
  last_name     VARCHAR2(100) not null,
  supervisor_id NUMBER(38) not null,
  hire_date     DATE not null,
  manager_id    NUMBER(38)
)
;
alter table OFFICETECHNICIANS
  add constraint PK_OFFICETECHNICIANS primary key (TECHNICIAN_ID)
  using index 
  ;
alter table OFFICETECHNICIANS
  add constraint FK_OFFICETECHNICIANS foreign key (MANAGER_ID)
  references PROJECTMANAGERS (MANAGER_ID);
grant select, insert, update, delete, references, alter, index, debug, read on OFFICETECHNICIANS to PUBLIC;

prompt Creating SAFETYOFFICERS...
create table SAFETYOFFICERS
(
  officer_id    NUMBER(38) not null,
  first_name    VARCHAR2(100) not null,
  last_name     VARCHAR2(100) not null,
  certification VARCHAR2(100) not null,
  department_id NUMBER(38) not null,
  hire_date     DATE not null
)
;
alter table SAFETYOFFICERS
  add constraint PK_SAFETYOFFICERS primary key (OFFICER_ID)
  using index 
  ;
alter table SAFETYOFFICERS
  add constraint FK_SAFETYOFFICERS foreign key (DEPARTMENT_ID)
  references DEPARTMENTS (DEPARTMENT_ID);
grant select, insert, update, delete, references, alter, index, debug, read on SAFETYOFFICERS to PUBLIC;

prompt Disabling triggers for DEPARTMENTS...
alter table DEPARTMENTS disable all triggers;
prompt Disabling triggers for PROJECTS...
alter table PROJECTS disable all triggers;
prompt Disabling triggers for ENGINEERS...
alter table ENGINEERS disable all triggers;
prompt Disabling triggers for PROJECTMANAGERS...
alter table PROJECTMANAGERS disable all triggers;
prompt Disabling triggers for OFFICETECHNICIANS...
alter table OFFICETECHNICIANS disable all triggers;
prompt Disabling triggers for SAFETYOFFICERS...
alter table SAFETYOFFICERS disable all triggers;
prompt Disabling foreign key constraints for ENGINEERS...
alter table ENGINEERS disable constraint FK_ENGINEERS;
prompt Disabling foreign key constraints for PROJECTMANAGERS...
alter table PROJECTMANAGERS disable constraint FK_PROJECTMANAGERS;
alter table PROJECTMANAGERS disable constraint FK_PROJECTMANAGERS2;
prompt Disabling foreign key constraints for OFFICETECHNICIANS...
alter table OFFICETECHNICIANS disable constraint FK_OFFICETECHNICIANS;
prompt Disabling foreign key constraints for SAFETYOFFICERS...
alter table SAFETYOFFICERS disable constraint FK_SAFETYOFFICERS;
prompt Deleting SAFETYOFFICERS...
delete from SAFETYOFFICERS;
commit;
prompt Deleting OFFICETECHNICIANS...
delete from OFFICETECHNICIANS;
commit;
prompt Deleting PROJECTMANAGERS...
delete from PROJECTMANAGERS;
commit;
prompt Deleting ENGINEERS...
delete from ENGINEERS;
commit;
prompt Deleting PROJECTS...
delete from PROJECTS;
commit;
prompt Deleting DEPARTMENTS...
delete from DEPARTMENTS;
commit;
prompt Loading DEPARTMENTS...
insert into DEPARTMENTS (department_id, department_name)
values (89950, 'GermanyMönchengladbach');
insert into DEPARTMENTS (department_id, department_name)
values (96623, 'BrazilCampinas');
insert into DEPARTMENTS (department_id, department_name)
values (55552, 'BelgiumWavre');
insert into DEPARTMENTS (department_id, department_name)
values (22541, 'USABatavia');
insert into DEPARTMENTS (department_id, department_name)
values (44988, 'CyprusNicosia');
insert into DEPARTMENTS (department_id, department_name)
values (29175, 'GermanyRegensburg');
insert into DEPARTMENTS (department_id, department_name)
values (60166, 'USAFort Lewis');
insert into DEPARTMENTS (department_id, department_name)
values (82417, 'USABillerica');
insert into DEPARTMENTS (department_id, department_name)
values (62661, 'USAHunt Valley');
insert into DEPARTMENTS (department_id, department_name)
values (99709, 'USAOklahoma city');
insert into DEPARTMENTS (department_id, department_name)
values (41969, 'CanadaGrand-mere');
insert into DEPARTMENTS (department_id, department_name)
values (70163, 'GermanyRothenburg');
insert into DEPARTMENTS (department_id, department_name)
values (88035, 'SpainBergara');
insert into DEPARTMENTS (department_id, department_name)
values (69970, 'USAWestport');
insert into DEPARTMENTS (department_id, department_name)
values (31359, 'BelgiumAntwerpen');
insert into DEPARTMENTS (department_id, department_name)
values (75755, 'ItalyBiella');
insert into DEPARTMENTS (department_id, department_name)
values (64162, 'USADearborn');
insert into DEPARTMENTS (department_id, department_name)
values (55491, 'GermanyGiessen');
insert into DEPARTMENTS (department_id, department_name)
values (90774, 'USAElkins Park');
insert into DEPARTMENTS (department_id, department_name)
values (53196, 'CanadaCambridge');
insert into DEPARTMENTS (department_id, department_name)
values (46678, 'USAGlen Cove');
insert into DEPARTMENTS (department_id, department_name)
values (21335, 'USABerwyn');
insert into DEPARTMENTS (department_id, department_name)
values (98393, 'USAWaltham');
insert into DEPARTMENTS (department_id, department_name)
values (78943, 'AustriaZipf');
insert into DEPARTMENTS (department_id, department_name)
values (44520, 'USANew York');
insert into DEPARTMENTS (department_id, department_name)
values (43108, 'FranceSaint Ouen');
insert into DEPARTMENTS (department_id, department_name)
values (47868, 'USAStafford');
insert into DEPARTMENTS (department_id, department_name)
values (85461, 'USAOklahoma city');
insert into DEPARTMENTS (department_id, department_name)
values (87814, 'United KingdomCobham');
insert into DEPARTMENTS (department_id, department_name)
values (49447, 'USAIndianapolis');
insert into DEPARTMENTS (department_id, department_name)
values (20103, 'ItalyZafferana Etnea');
insert into DEPARTMENTS (department_id, department_name)
values (67716, 'DenmarkKøbenhavn');
insert into DEPARTMENTS (department_id, department_name)
values (64388, 'GermanyMarburg');
insert into DEPARTMENTS (department_id, department_name)
values (75986, 'MexicoMexico City');
insert into DEPARTMENTS (department_id, department_name)
values (38756, 'USAHighlands Ranch');
insert into DEPARTMENTS (department_id, department_name)
values (34580, 'USACincinnati');
insert into DEPARTMENTS (department_id, department_name)
values (66724, 'USAHarrisburg');
insert into DEPARTMENTS (department_id, department_name)
values (47529, 'BrazilAmericana');
insert into DEPARTMENTS (department_id, department_name)
values (86330, 'USATallahassee');
insert into DEPARTMENTS (department_id, department_name)
values (90015, 'SwedenHelsingborg');
insert into DEPARTMENTS (department_id, department_name)
values (66705, 'USAChambersburg');
insert into DEPARTMENTS (department_id, department_name)
values (48779, 'USADraper');
insert into DEPARTMENTS (department_id, department_name)
values (20877, 'USANashua');
insert into DEPARTMENTS (department_id, department_name)
values (66659, 'United KingdomBurgess Hill');
insert into DEPARTMENTS (department_id, department_name)
values (22552, 'USANew Haven');
insert into DEPARTMENTS (department_id, department_name)
values (53996, 'SwitzerlandBern');
insert into DEPARTMENTS (department_id, department_name)
values (95282, 'EcuadorCuenca');
insert into DEPARTMENTS (department_id, department_name)
values (86902, 'USACedar Rapids');
insert into DEPARTMENTS (department_id, department_name)
values (65793, 'USACorona');
insert into DEPARTMENTS (department_id, department_name)
values (52499, 'BrazilParaju');
insert into DEPARTMENTS (department_id, department_name)
values (37585, 'ItalyGattico');
insert into DEPARTMENTS (department_id, department_name)
values (73707, 'USAOlympia');
insert into DEPARTMENTS (department_id, department_name)
values (98279, 'NetherlandsWageningen');
insert into DEPARTMENTS (department_id, department_name)
values (96427, 'USACromwell');
insert into DEPARTMENTS (department_id, department_name)
values (29078, 'USASolon');
insert into DEPARTMENTS (department_id, department_name)
values (96212, 'GermanyGummersbach');
insert into DEPARTMENTS (department_id, department_name)
values (67549, 'GermanyMünster');
insert into DEPARTMENTS (department_id, department_name)
values (72909, 'USAFort Collins');
insert into DEPARTMENTS (department_id, department_name)
values (69550, 'USAGlenshaw');
insert into DEPARTMENTS (department_id, department_name)
values (91527, 'FranceLe chesnay');
insert into DEPARTMENTS (department_id, department_name)
values (38181, 'USAAlbany');
insert into DEPARTMENTS (department_id, department_name)
values (13785, 'JapanTakamatsu');
insert into DEPARTMENTS (department_id, department_name)
values (78765, 'USAMt. Laurel');
insert into DEPARTMENTS (department_id, department_name)
values (10343, 'JapanWakayama');
insert into DEPARTMENTS (department_id, department_name)
values (44589, 'AustraliaMilsons Point');
insert into DEPARTMENTS (department_id, department_name)
values (36710, 'CanadaBoucherville');
insert into DEPARTMENTS (department_id, department_name)
values (48363, 'USAAurora');
insert into DEPARTMENTS (department_id, department_name)
values (83572, 'USAUniversity');
insert into DEPARTMENTS (department_id, department_name)
values (54623, 'ArgentinaBuenos Aires');
insert into DEPARTMENTS (department_id, department_name)
values (47230, 'USAOak park');
insert into DEPARTMENTS (department_id, department_name)
values (17180, 'USACoppell');
insert into DEPARTMENTS (department_id, department_name)
values (28978, 'USAHarrisburg');
insert into DEPARTMENTS (department_id, department_name)
values (50359, 'GreeceAthens');
insert into DEPARTMENTS (department_id, department_name)
values (38728, 'USAStreamwood');
insert into DEPARTMENTS (department_id, department_name)
values (99423, 'USADublin');
insert into DEPARTMENTS (department_id, department_name)
values (33287, 'GermanyHamburg');
insert into DEPARTMENTS (department_id, department_name)
values (29650, 'GermanyFuchstal-asch');
insert into DEPARTMENTS (department_id, department_name)
values (58754, 'CanadaSt-laurent');
insert into DEPARTMENTS (department_id, department_name)
values (79885, 'USAAltamonte Springs');
insert into DEPARTMENTS (department_id, department_name)
values (35980, 'AustraliaCanberra');
insert into DEPARTMENTS (department_id, department_name)
values (93961, 'SwitzerlandRheinfelden');
insert into DEPARTMENTS (department_id, department_name)
values (70559, 'SpainPalma de Mallorca');
insert into DEPARTMENTS (department_id, department_name)
values (45625, 'ItalyBiella');
insert into DEPARTMENTS (department_id, department_name)
values (64149, 'ItalyMantova');
insert into DEPARTMENTS (department_id, department_name)
values (50598, 'USAHercules');
insert into DEPARTMENTS (department_id, department_name)
values (78213, 'South AfricaCape town');
insert into DEPARTMENTS (department_id, department_name)
values (87335, 'USALos Angeles');
insert into DEPARTMENTS (department_id, department_name)
values (15110, 'BrazilPorto alegre');
insert into DEPARTMENTS (department_id, department_name)
values (81471, 'USAMobile');
insert into DEPARTMENTS (department_id, department_name)
values (96316, 'USANew Castle');
insert into DEPARTMENTS (department_id, department_name)
values (36381, 'JapanKumamoto');
insert into DEPARTMENTS (department_id, department_name)
values (53290, 'USADuluth');
insert into DEPARTMENTS (department_id, department_name)
values (65731, 'AustraliaEdwardstown');
insert into DEPARTMENTS (department_id, department_name)
values (74550, 'USACaguas');
insert into DEPARTMENTS (department_id, department_name)
values (84288, 'USABoston');
insert into DEPARTMENTS (department_id, department_name)
values (62376, 'South KoreaSuwon');
insert into DEPARTMENTS (department_id, department_name)
values (64577, 'USARochester');
insert into DEPARTMENTS (department_id, department_name)
values (37358, 'South AfricaHalfway house');
insert into DEPARTMENTS (department_id, department_name)
values (17462, 'JapanYamaguchi');
insert into DEPARTMENTS (department_id, department_name)
values (71744, 'SpainBergara');
commit;
prompt 100 records committed...
insert into DEPARTMENTS (department_id, department_name)
values (60812, 'USACalifornia');
insert into DEPARTMENTS (department_id, department_name)
values (21270, 'FinlandTurku');
insert into DEPARTMENTS (department_id, department_name)
values (32136, 'PortugalLisboa');
insert into DEPARTMENTS (department_id, department_name)
values (23985, 'USABelmont');
insert into DEPARTMENTS (department_id, department_name)
values (52168, 'USABerkeley');
insert into DEPARTMENTS (department_id, department_name)
values (20053, 'United Kingdomdurham');
insert into DEPARTMENTS (department_id, department_name)
values (44203, 'USADallas');
insert into DEPARTMENTS (department_id, department_name)
values (69402, 'FranceSt Jean de Soudain');
insert into DEPARTMENTS (department_id, department_name)
values (39643, 'GermanyLahr');
insert into DEPARTMENTS (department_id, department_name)
values (44041, 'USABurr Ridge');
insert into DEPARTMENTS (department_id, department_name)
values (35435, 'GermanyNuernberg');
insert into DEPARTMENTS (department_id, department_name)
values (85708, 'USAFremont');
insert into DEPARTMENTS (department_id, department_name)
values (33746, 'USAWest Windsor');
insert into DEPARTMENTS (department_id, department_name)
values (82910, 'United KingdomBristol');
insert into DEPARTMENTS (department_id, department_name)
values (96922, 'BrazilPompeia');
insert into DEPARTMENTS (department_id, department_name)
values (99931, 'USAGroton');
insert into DEPARTMENTS (department_id, department_name)
values (27255, 'SwedenTäby');
insert into DEPARTMENTS (department_id, department_name)
values (68594, 'USALongview');
insert into DEPARTMENTS (department_id, department_name)
values (82719, 'BrazilSantana do parnaíba');
insert into DEPARTMENTS (department_id, department_name)
values (71370, 'GermanyDreieich');
insert into DEPARTMENTS (department_id, department_name)
values (34000, 'USADublin');
insert into DEPARTMENTS (department_id, department_name)
values (17044, 'USAShawnee');
insert into DEPARTMENTS (department_id, department_name)
values (65641, 'FinlandOulu');
insert into DEPARTMENTS (department_id, department_name)
values (45469, 'BrazilGoiania');
insert into DEPARTMENTS (department_id, department_name)
values (90625, 'USAHouma');
insert into DEPARTMENTS (department_id, department_name)
values (21684, 'GermanyVisselhövede');
insert into DEPARTMENTS (department_id, department_name)
values (34262, 'JapanKobe');
insert into DEPARTMENTS (department_id, department_name)
values (55049, 'CanadaRichmond');
insert into DEPARTMENTS (department_id, department_name)
values (29909, 'SwedenKungens kurva');
insert into DEPARTMENTS (department_id, department_name)
values (1, 'Engineering');
insert into DEPARTMENTS (department_id, department_name)
values (201, 'Engineering');
insert into DEPARTMENTS (department_id, department_name)
values (202, 'Safety');
insert into DEPARTMENTS (department_id, department_name)
values (203, 'Administration');
insert into DEPARTMENTS (department_id, department_name)
values (204, 'Research');
insert into DEPARTMENTS (department_id, department_name)
values (205, 'Human Resources');
insert into DEPARTMENTS (department_id, department_name)
values (206, 'Finance');
insert into DEPARTMENTS (department_id, department_name)
values (207, 'Marketing');
insert into DEPARTMENTS (department_id, department_name)
values (208, 'Information Technology');
insert into DEPARTMENTS (department_id, department_name)
values (209, 'Operations');
insert into DEPARTMENTS (department_id, department_name)
values (210, 'Customer Service');
insert into DEPARTMENTS (department_id, department_name)
values (211, 'Sales');
insert into DEPARTMENTS (department_id, department_name)
values (212, 'Legal');
insert into DEPARTMENTS (department_id, department_name)
values (213, 'Supply Chain');
insert into DEPARTMENTS (department_id, department_name)
values (214, 'Quality Assurance');
insert into DEPARTMENTS (department_id, department_name)
values (215, 'Product Development');
insert into DEPARTMENTS (department_id, department_name)
values (216, 'Facilities');
insert into DEPARTMENTS (department_id, department_name)
values (217, 'Training');
insert into DEPARTMENTS (department_id, department_name)
values (218, 'Logistics');
insert into DEPARTMENTS (department_id, department_name)
values (219, 'Purchasing');
insert into DEPARTMENTS (department_id, department_name)
values (220, 'Legal Affairs');
insert into DEPARTMENTS (department_id, department_name)
values (221, 'Public Relations');
insert into DEPARTMENTS (department_id, department_name)
values (222, 'Audit');
insert into DEPARTMENTS (department_id, department_name)
values (223, 'Compliance');
insert into DEPARTMENTS (department_id, department_name)
values (224, 'Customer Relations');
insert into DEPARTMENTS (department_id, department_name)
values (225, 'Internal Affairs');
insert into DEPARTMENTS (department_id, department_name)
values (226, 'Strategic Planning');
insert into DEPARTMENTS (department_id, department_name)
values (227, 'Business Development');
insert into DEPARTMENTS (department_id, department_name)
values (228, 'Corporate Communications');
insert into DEPARTMENTS (department_id, department_name)
values (229, 'Risk Management');
insert into DEPARTMENTS (department_id, department_name)
values (230, 'Legal Services');
insert into DEPARTMENTS (department_id, department_name)
values (231, 'Corporate Affairs');
insert into DEPARTMENTS (department_id, department_name)
values (232, 'Business Operations');
insert into DEPARTMENTS (department_id, department_name)
values (233, 'Policy');
insert into DEPARTMENTS (department_id, department_name)
values (234, 'Strategic Initiatives');
insert into DEPARTMENTS (department_id, department_name)
values (235, 'Government Affairs');
insert into DEPARTMENTS (department_id, department_name)
values (236, 'Corporate Development');
insert into DEPARTMENTS (department_id, department_name)
values (237, 'Regulatory Affairs');
insert into DEPARTMENTS (department_id, department_name)
values (238, 'Strategic Partnerships');
insert into DEPARTMENTS (department_id, department_name)
values (239, 'Strategic Projects');
insert into DEPARTMENTS (department_id, department_name)
values (240, 'Operations Management');
insert into DEPARTMENTS (department_id, department_name)
values (241, 'Program Management');
insert into DEPARTMENTS (department_id, department_name)
values (242, 'Operations Support');
insert into DEPARTMENTS (department_id, department_name)
values (243, 'Technology Management');
insert into DEPARTMENTS (department_id, department_name)
values (244, 'Operational Excellence');
insert into DEPARTMENTS (department_id, department_name)
values (245, 'Technical Services');
insert into DEPARTMENTS (department_id, department_name)
values (2, 'Dabfeed');
insert into DEPARTMENTS (department_id, department_name)
values (3, 'Zooveo');
insert into DEPARTMENTS (department_id, department_name)
values (4, 'Brainverse');
insert into DEPARTMENTS (department_id, department_name)
values (5, 'Meetz');
insert into DEPARTMENTS (department_id, department_name)
values (6, 'Blogspan');
insert into DEPARTMENTS (department_id, department_name)
values (7, 'Mynte');
insert into DEPARTMENTS (department_id, department_name)
values (8, 'Miboo');
insert into DEPARTMENTS (department_id, department_name)
values (9, 'Feedspan');
insert into DEPARTMENTS (department_id, department_name)
values (10, 'Eare');
insert into DEPARTMENTS (department_id, department_name)
values (11, 'Nlounge');
insert into DEPARTMENTS (department_id, department_name)
values (12, 'Kamba');
insert into DEPARTMENTS (department_id, department_name)
values (13, 'Vitz');
insert into DEPARTMENTS (department_id, department_name)
values (14, 'Feedfish');
insert into DEPARTMENTS (department_id, department_name)
values (15, 'Yacero');
insert into DEPARTMENTS (department_id, department_name)
values (16, 'Kimia');
insert into DEPARTMENTS (department_id, department_name)
values (17, 'Skimia');
insert into DEPARTMENTS (department_id, department_name)
values (18, 'Fiveclub');
insert into DEPARTMENTS (department_id, department_name)
values (19, 'Skinte');
insert into DEPARTMENTS (department_id, department_name)
values (20, 'Zoovu');
insert into DEPARTMENTS (department_id, department_name)
values (21, 'Eadel');
insert into DEPARTMENTS (department_id, department_name)
values (22, 'Yodoo');
insert into DEPARTMENTS (department_id, department_name)
values (23, 'Cogidoo');
insert into DEPARTMENTS (department_id, department_name)
values (24, 'Cogidoo');
insert into DEPARTMENTS (department_id, department_name)
values (25, 'Pixoboo');
insert into DEPARTMENTS (department_id, department_name)
values (26, 'Ooba');
commit;
prompt 200 records committed...
insert into DEPARTMENTS (department_id, department_name)
values (27, 'Tagchat');
insert into DEPARTMENTS (department_id, department_name)
values (28, 'Zooxo');
insert into DEPARTMENTS (department_id, department_name)
values (29, 'Quatz');
insert into DEPARTMENTS (department_id, department_name)
values (30, 'Flipbug');
insert into DEPARTMENTS (department_id, department_name)
values (31, 'Plajo');
insert into DEPARTMENTS (department_id, department_name)
values (32, 'Leenti');
insert into DEPARTMENTS (department_id, department_name)
values (33, 'Rhycero');
insert into DEPARTMENTS (department_id, department_name)
values (34, 'Jabberbean');
insert into DEPARTMENTS (department_id, department_name)
values (35, 'Photobean');
insert into DEPARTMENTS (department_id, department_name)
values (36, 'Brainverse');
insert into DEPARTMENTS (department_id, department_name)
values (37, 'Oloo');
insert into DEPARTMENTS (department_id, department_name)
values (38, 'Jazzy');
insert into DEPARTMENTS (department_id, department_name)
values (39, 'DabZ');
insert into DEPARTMENTS (department_id, department_name)
values (40, 'Pixonyx');
insert into DEPARTMENTS (department_id, department_name)
values (41, 'Youbridge');
insert into DEPARTMENTS (department_id, department_name)
values (42, 'Rhyzio');
insert into DEPARTMENTS (department_id, department_name)
values (43, 'Avamba');
insert into DEPARTMENTS (department_id, department_name)
values (44, 'Rhybox');
insert into DEPARTMENTS (department_id, department_name)
values (45, 'Blogspan');
insert into DEPARTMENTS (department_id, department_name)
values (46, 'Tagpad');
insert into DEPARTMENTS (department_id, department_name)
values (47, 'Izio');
insert into DEPARTMENTS (department_id, department_name)
values (48, 'Twitternation');
insert into DEPARTMENTS (department_id, department_name)
values (49, 'Miboo');
insert into DEPARTMENTS (department_id, department_name)
values (50, 'Wikivu');
insert into DEPARTMENTS (department_id, department_name)
values (51, 'Jayo');
insert into DEPARTMENTS (department_id, department_name)
values (52, 'Myworks');
insert into DEPARTMENTS (department_id, department_name)
values (53, 'Oloo');
insert into DEPARTMENTS (department_id, department_name)
values (54, 'Riffpath');
insert into DEPARTMENTS (department_id, department_name)
values (55, 'Realblab');
insert into DEPARTMENTS (department_id, department_name)
values (56, 'Mybuzz');
insert into DEPARTMENTS (department_id, department_name)
values (57, 'Flipopia');
insert into DEPARTMENTS (department_id, department_name)
values (58, 'Flashdog');
insert into DEPARTMENTS (department_id, department_name)
values (59, 'Brainbox');
insert into DEPARTMENTS (department_id, department_name)
values (60, 'DabZ');
insert into DEPARTMENTS (department_id, department_name)
values (61, 'Trudoo');
insert into DEPARTMENTS (department_id, department_name)
values (62, 'Jabberbean');
insert into DEPARTMENTS (department_id, department_name)
values (63, 'Edgeify');
insert into DEPARTMENTS (department_id, department_name)
values (64, 'Mybuzz');
insert into DEPARTMENTS (department_id, department_name)
values (65, 'Skimia');
insert into DEPARTMENTS (department_id, department_name)
values (66, 'Livepath');
insert into DEPARTMENTS (department_id, department_name)
values (67, 'Jaxbean');
insert into DEPARTMENTS (department_id, department_name)
values (68, 'Jetpulse');
insert into DEPARTMENTS (department_id, department_name)
values (69, 'Rhybox');
insert into DEPARTMENTS (department_id, department_name)
values (70, 'Eamia');
insert into DEPARTMENTS (department_id, department_name)
values (71, 'Zooxo');
insert into DEPARTMENTS (department_id, department_name)
values (72, 'Pixonyx');
insert into DEPARTMENTS (department_id, department_name)
values (73, 'Mycat');
insert into DEPARTMENTS (department_id, department_name)
values (74, 'Riffwire');
insert into DEPARTMENTS (department_id, department_name)
values (75, 'Voomm');
insert into DEPARTMENTS (department_id, department_name)
values (76, 'Yabox');
insert into DEPARTMENTS (department_id, department_name)
values (77, 'Kare');
insert into DEPARTMENTS (department_id, department_name)
values (78, 'Miboo');
insert into DEPARTMENTS (department_id, department_name)
values (79, 'Vinder');
insert into DEPARTMENTS (department_id, department_name)
values (80, 'Avamba');
insert into DEPARTMENTS (department_id, department_name)
values (81, 'Jatri');
insert into DEPARTMENTS (department_id, department_name)
values (82, 'Blogspan');
insert into DEPARTMENTS (department_id, department_name)
values (83, 'Realpoint');
insert into DEPARTMENTS (department_id, department_name)
values (84, 'Jabbercube');
insert into DEPARTMENTS (department_id, department_name)
values (85, 'Blogspan');
insert into DEPARTMENTS (department_id, department_name)
values (86, 'Rhynyx');
insert into DEPARTMENTS (department_id, department_name)
values (87, 'Avamm');
insert into DEPARTMENTS (department_id, department_name)
values (88, 'Rooxo');
insert into DEPARTMENTS (department_id, department_name)
values (89, 'Meevee');
insert into DEPARTMENTS (department_id, department_name)
values (90, 'Oodoo');
insert into DEPARTMENTS (department_id, department_name)
values (91, 'Avamba');
insert into DEPARTMENTS (department_id, department_name)
values (92, 'Tanoodle');
insert into DEPARTMENTS (department_id, department_name)
values (93, 'Tagpad');
insert into DEPARTMENTS (department_id, department_name)
values (94, 'Rhyzio');
insert into DEPARTMENTS (department_id, department_name)
values (95, 'Dynava');
insert into DEPARTMENTS (department_id, department_name)
values (96, 'Youtags');
insert into DEPARTMENTS (department_id, department_name)
values (97, 'Edgepulse');
insert into DEPARTMENTS (department_id, department_name)
values (98, 'Youtags');
insert into DEPARTMENTS (department_id, department_name)
values (99, 'Oyoba');
insert into DEPARTMENTS (department_id, department_name)
values (100, 'Katz');
insert into DEPARTMENTS (department_id, department_name)
values (101, 'Voolia');
insert into DEPARTMENTS (department_id, department_name)
values (102, 'Feedfire');
insert into DEPARTMENTS (department_id, department_name)
values (103, 'Devpoint');
insert into DEPARTMENTS (department_id, department_name)
values (104, 'Roodel');
insert into DEPARTMENTS (department_id, department_name)
values (105, 'Voonder');
insert into DEPARTMENTS (department_id, department_name)
values (106, 'Skalith');
insert into DEPARTMENTS (department_id, department_name)
values (107, 'Yakidoo');
insert into DEPARTMENTS (department_id, department_name)
values (108, 'Linkbuzz');
insert into DEPARTMENTS (department_id, department_name)
values (109, 'Youtags');
insert into DEPARTMENTS (department_id, department_name)
values (110, 'Yabox');
insert into DEPARTMENTS (department_id, department_name)
values (111, 'Quimm');
insert into DEPARTMENTS (department_id, department_name)
values (112, 'Gabspot');
insert into DEPARTMENTS (department_id, department_name)
values (113, 'Quaxo');
insert into DEPARTMENTS (department_id, department_name)
values (114, 'Jabbersphere');
insert into DEPARTMENTS (department_id, department_name)
values (115, 'Voomm');
insert into DEPARTMENTS (department_id, department_name)
values (116, 'Leexo');
insert into DEPARTMENTS (department_id, department_name)
values (117, 'Brainverse');
insert into DEPARTMENTS (department_id, department_name)
values (118, 'Voonix');
insert into DEPARTMENTS (department_id, department_name)
values (119, 'Katz');
insert into DEPARTMENTS (department_id, department_name)
values (120, 'Trupe');
insert into DEPARTMENTS (department_id, department_name)
values (121, 'Jayo');
insert into DEPARTMENTS (department_id, department_name)
values (122, 'Kwilith');
insert into DEPARTMENTS (department_id, department_name)
values (123, 'Shuffletag');
insert into DEPARTMENTS (department_id, department_name)
values (124, 'Yodo');
insert into DEPARTMENTS (department_id, department_name)
values (125, 'Blognation');
insert into DEPARTMENTS (department_id, department_name)
values (126, 'Kwideo');
commit;
prompt 300 records committed...
insert into DEPARTMENTS (department_id, department_name)
values (127, 'Zoomcast');
insert into DEPARTMENTS (department_id, department_name)
values (128, 'Kimia');
insert into DEPARTMENTS (department_id, department_name)
values (129, 'Youspan');
insert into DEPARTMENTS (department_id, department_name)
values (130, 'Skipstorm');
insert into DEPARTMENTS (department_id, department_name)
values (131, 'Yacero');
insert into DEPARTMENTS (department_id, department_name)
values (132, 'Viva');
insert into DEPARTMENTS (department_id, department_name)
values (133, 'Abatz');
insert into DEPARTMENTS (department_id, department_name)
values (134, 'Ainyx');
insert into DEPARTMENTS (department_id, department_name)
values (135, 'Izio');
insert into DEPARTMENTS (department_id, department_name)
values (136, 'Topdrive');
insert into DEPARTMENTS (department_id, department_name)
values (137, 'Flipstorm');
insert into DEPARTMENTS (department_id, department_name)
values (138, 'Yodo');
insert into DEPARTMENTS (department_id, department_name)
values (139, 'Skinix');
insert into DEPARTMENTS (department_id, department_name)
values (140, 'Meeveo');
insert into DEPARTMENTS (department_id, department_name)
values (141, 'Pixonyx');
insert into DEPARTMENTS (department_id, department_name)
values (142, 'Skinder');
insert into DEPARTMENTS (department_id, department_name)
values (143, 'Jetwire');
insert into DEPARTMENTS (department_id, department_name)
values (144, 'Yozio');
insert into DEPARTMENTS (department_id, department_name)
values (145, 'Wordify');
insert into DEPARTMENTS (department_id, department_name)
values (146, 'Zoonder');
insert into DEPARTMENTS (department_id, department_name)
values (147, 'Flashspan');
insert into DEPARTMENTS (department_id, department_name)
values (148, 'Quamba');
insert into DEPARTMENTS (department_id, department_name)
values (149, 'Photospace');
insert into DEPARTMENTS (department_id, department_name)
values (150, 'Skaboo');
insert into DEPARTMENTS (department_id, department_name)
values (151, 'Centizu');
insert into DEPARTMENTS (department_id, department_name)
values (152, 'Jetwire');
insert into DEPARTMENTS (department_id, department_name)
values (153, 'Wordify');
insert into DEPARTMENTS (department_id, department_name)
values (154, 'Jaloo');
insert into DEPARTMENTS (department_id, department_name)
values (155, 'Photobean');
insert into DEPARTMENTS (department_id, department_name)
values (156, 'Wordify');
insert into DEPARTMENTS (department_id, department_name)
values (157, 'Oyonder');
insert into DEPARTMENTS (department_id, department_name)
values (158, 'Yombu');
insert into DEPARTMENTS (department_id, department_name)
values (159, 'Topiczoom');
insert into DEPARTMENTS (department_id, department_name)
values (160, 'Yodel');
insert into DEPARTMENTS (department_id, department_name)
values (161, 'Babbleset');
insert into DEPARTMENTS (department_id, department_name)
values (162, 'Roodel');
insert into DEPARTMENTS (department_id, department_name)
values (163, 'Quimm');
insert into DEPARTMENTS (department_id, department_name)
values (164, 'Kwinu');
insert into DEPARTMENTS (department_id, department_name)
values (165, 'Realbridge');
insert into DEPARTMENTS (department_id, department_name)
values (166, 'Youspan');
insert into DEPARTMENTS (department_id, department_name)
values (167, 'Brightdog');
insert into DEPARTMENTS (department_id, department_name)
values (168, 'Yambee');
insert into DEPARTMENTS (department_id, department_name)
values (169, 'Roomm');
insert into DEPARTMENTS (department_id, department_name)
values (170, 'Pixonyx');
insert into DEPARTMENTS (department_id, department_name)
values (171, 'Brainverse');
insert into DEPARTMENTS (department_id, department_name)
values (172, 'Mybuzz');
insert into DEPARTMENTS (department_id, department_name)
values (173, 'Flipopia');
insert into DEPARTMENTS (department_id, department_name)
values (174, 'Meevee');
insert into DEPARTMENTS (department_id, department_name)
values (175, 'Browsecat');
insert into DEPARTMENTS (department_id, department_name)
values (176, 'Demivee');
insert into DEPARTMENTS (department_id, department_name)
values (177, 'Ntags');
insert into DEPARTMENTS (department_id, department_name)
values (178, 'Meetz');
insert into DEPARTMENTS (department_id, department_name)
values (179, 'Twinder');
insert into DEPARTMENTS (department_id, department_name)
values (180, 'Aimbo');
insert into DEPARTMENTS (department_id, department_name)
values (181, 'Gigabox');
insert into DEPARTMENTS (department_id, department_name)
values (182, 'Tazz');
insert into DEPARTMENTS (department_id, department_name)
values (183, 'Oodoo');
insert into DEPARTMENTS (department_id, department_name)
values (184, 'Minyx');
insert into DEPARTMENTS (department_id, department_name)
values (185, 'Rhyzio');
insert into DEPARTMENTS (department_id, department_name)
values (186, 'Twitternation');
insert into DEPARTMENTS (department_id, department_name)
values (187, 'Camido');
insert into DEPARTMENTS (department_id, department_name)
values (188, 'Blogpad');
insert into DEPARTMENTS (department_id, department_name)
values (189, 'Nlounge');
insert into DEPARTMENTS (department_id, department_name)
values (190, 'Blogtag');
insert into DEPARTMENTS (department_id, department_name)
values (191, 'Skivee');
insert into DEPARTMENTS (department_id, department_name)
values (192, 'Wikibox');
insert into DEPARTMENTS (department_id, department_name)
values (193, 'Rhycero');
insert into DEPARTMENTS (department_id, department_name)
values (194, 'Cogibox');
insert into DEPARTMENTS (department_id, department_name)
values (195, 'Quaxo');
insert into DEPARTMENTS (department_id, department_name)
values (196, 'Wordtune');
insert into DEPARTMENTS (department_id, department_name)
values (197, 'Shuffletag');
insert into DEPARTMENTS (department_id, department_name)
values (198, 'Twimm');
insert into DEPARTMENTS (department_id, department_name)
values (199, 'Innotype');
insert into DEPARTMENTS (department_id, department_name)
values (200, 'Brightbean');
insert into DEPARTMENTS (department_id, department_name)
values (246, 'Shuffledrive');
insert into DEPARTMENTS (department_id, department_name)
values (247, 'Realcube');
insert into DEPARTMENTS (department_id, department_name)
values (248, 'Yodel');
insert into DEPARTMENTS (department_id, department_name)
values (249, 'Linkbuzz');
insert into DEPARTMENTS (department_id, department_name)
values (250, 'Dabjam');
insert into DEPARTMENTS (department_id, department_name)
values (251, 'Pixonyx');
insert into DEPARTMENTS (department_id, department_name)
values (252, 'Vitz');
insert into DEPARTMENTS (department_id, department_name)
values (253, 'Babblestorm');
insert into DEPARTMENTS (department_id, department_name)
values (254, 'Gigaclub');
insert into DEPARTMENTS (department_id, department_name)
values (255, 'Ailane');
insert into DEPARTMENTS (department_id, department_name)
values (256, 'Zooveo');
insert into DEPARTMENTS (department_id, department_name)
values (257, 'Yata');
insert into DEPARTMENTS (department_id, department_name)
values (258, 'Dabtype');
insert into DEPARTMENTS (department_id, department_name)
values (259, 'Roodel');
insert into DEPARTMENTS (department_id, department_name)
values (260, 'Avamba');
insert into DEPARTMENTS (department_id, department_name)
values (261, 'Kare');
insert into DEPARTMENTS (department_id, department_name)
values (262, 'Kare');
insert into DEPARTMENTS (department_id, department_name)
values (263, 'Mudo');
insert into DEPARTMENTS (department_id, department_name)
values (264, 'Rhybox');
insert into DEPARTMENTS (department_id, department_name)
values (265, 'Gevee');
insert into DEPARTMENTS (department_id, department_name)
values (266, 'Divape');
insert into DEPARTMENTS (department_id, department_name)
values (267, 'Teklist');
insert into DEPARTMENTS (department_id, department_name)
values (268, 'Aimbo');
insert into DEPARTMENTS (department_id, department_name)
values (269, 'Fivespan');
insert into DEPARTMENTS (department_id, department_name)
values (270, 'Flipopia');
insert into DEPARTMENTS (department_id, department_name)
values (271, 'Dynabox');
commit;
prompt 400 records committed...
insert into DEPARTMENTS (department_id, department_name)
values (272, 'Devshare');
insert into DEPARTMENTS (department_id, department_name)
values (273, 'Skajo');
insert into DEPARTMENTS (department_id, department_name)
values (274, 'Plambee');
insert into DEPARTMENTS (department_id, department_name)
values (275, 'Zoonoodle');
insert into DEPARTMENTS (department_id, department_name)
values (276, 'Ntag');
insert into DEPARTMENTS (department_id, department_name)
values (277, 'Eimbee');
insert into DEPARTMENTS (department_id, department_name)
values (278, 'Skimia');
insert into DEPARTMENTS (department_id, department_name)
values (279, 'Photospace');
insert into DEPARTMENTS (department_id, department_name)
values (280, 'Brightdog');
insert into DEPARTMENTS (department_id, department_name)
values (281, 'Demivee');
insert into DEPARTMENTS (department_id, department_name)
values (282, 'Twitterlist');
insert into DEPARTMENTS (department_id, department_name)
values (283, 'Zoomzone');
insert into DEPARTMENTS (department_id, department_name)
values (284, 'Edgepulse');
insert into DEPARTMENTS (department_id, department_name)
values (285, 'Kanoodle');
insert into DEPARTMENTS (department_id, department_name)
values (286, 'Photobean');
insert into DEPARTMENTS (department_id, department_name)
values (287, 'Vitz');
insert into DEPARTMENTS (department_id, department_name)
values (288, 'Zooxo');
insert into DEPARTMENTS (department_id, department_name)
values (289, 'Thoughtstorm');
insert into DEPARTMENTS (department_id, department_name)
values (290, 'Eire');
insert into DEPARTMENTS (department_id, department_name)
values (291, 'Edgeify');
insert into DEPARTMENTS (department_id, department_name)
values (292, 'Devshare');
insert into DEPARTMENTS (department_id, department_name)
values (293, 'Riffwire');
insert into DEPARTMENTS (department_id, department_name)
values (294, 'Photolist');
insert into DEPARTMENTS (department_id, department_name)
values (295, 'Centimia');
insert into DEPARTMENTS (department_id, department_name)
values (296, 'Skynoodle');
insert into DEPARTMENTS (department_id, department_name)
values (297, 'Rhynyx');
insert into DEPARTMENTS (department_id, department_name)
values (298, 'Katz');
insert into DEPARTMENTS (department_id, department_name)
values (299, 'Thoughtbeat');
insert into DEPARTMENTS (department_id, department_name)
values (300, 'Voolia');
insert into DEPARTMENTS (department_id, department_name)
values (301, 'Geba');
insert into DEPARTMENTS (department_id, department_name)
values (302, 'Meevee');
insert into DEPARTMENTS (department_id, department_name)
values (303, 'Gigashots');
insert into DEPARTMENTS (department_id, department_name)
values (304, 'Brightbean');
insert into DEPARTMENTS (department_id, department_name)
values (305, 'Vinte');
insert into DEPARTMENTS (department_id, department_name)
values (306, 'Buzzdog');
insert into DEPARTMENTS (department_id, department_name)
values (307, 'Photofeed');
insert into DEPARTMENTS (department_id, department_name)
values (308, 'Bubblemix');
insert into DEPARTMENTS (department_id, department_name)
values (309, 'Twitternation');
insert into DEPARTMENTS (department_id, department_name)
values (310, 'Plajo');
insert into DEPARTMENTS (department_id, department_name)
values (311, 'Topiclounge');
insert into DEPARTMENTS (department_id, department_name)
values (312, 'Trudoo');
insert into DEPARTMENTS (department_id, department_name)
values (313, 'Gabcube');
insert into DEPARTMENTS (department_id, department_name)
values (314, 'Kimia');
insert into DEPARTMENTS (department_id, department_name)
values (315, 'Livefish');
insert into DEPARTMENTS (department_id, department_name)
values (316, 'Oyoloo');
insert into DEPARTMENTS (department_id, department_name)
values (317, 'InnoZ');
insert into DEPARTMENTS (department_id, department_name)
values (318, 'Wikivu');
insert into DEPARTMENTS (department_id, department_name)
values (319, 'Topicblab');
insert into DEPARTMENTS (department_id, department_name)
values (320, 'Riffpath');
insert into DEPARTMENTS (department_id, department_name)
values (321, 'Twitterlist');
insert into DEPARTMENTS (department_id, department_name)
values (322, 'Oyoba');
insert into DEPARTMENTS (department_id, department_name)
values (323, 'Thoughtbeat');
insert into DEPARTMENTS (department_id, department_name)
values (324, 'Gigazoom');
insert into DEPARTMENTS (department_id, department_name)
values (325, 'Livepath');
insert into DEPARTMENTS (department_id, department_name)
values (326, 'Mynte');
insert into DEPARTMENTS (department_id, department_name)
values (327, 'Avamba');
insert into DEPARTMENTS (department_id, department_name)
values (328, 'Voolia');
insert into DEPARTMENTS (department_id, department_name)
values (329, 'Agimba');
insert into DEPARTMENTS (department_id, department_name)
values (330, 'Wordify');
insert into DEPARTMENTS (department_id, department_name)
values (331, 'Livetube');
insert into DEPARTMENTS (department_id, department_name)
values (332, 'Skippad');
insert into DEPARTMENTS (department_id, department_name)
values (333, 'Voolia');
insert into DEPARTMENTS (department_id, department_name)
values (334, 'Oyoba');
insert into DEPARTMENTS (department_id, department_name)
values (335, 'Tagfeed');
insert into DEPARTMENTS (department_id, department_name)
values (336, 'Browsezoom');
insert into DEPARTMENTS (department_id, department_name)
values (337, 'Vinte');
insert into DEPARTMENTS (department_id, department_name)
values (338, 'Yata');
insert into DEPARTMENTS (department_id, department_name)
values (339, 'Voonder');
insert into DEPARTMENTS (department_id, department_name)
values (340, 'Riffwire');
insert into DEPARTMENTS (department_id, department_name)
values (341, 'Centidel');
insert into DEPARTMENTS (department_id, department_name)
values (342, 'Devpulse');
insert into DEPARTMENTS (department_id, department_name)
values (343, 'Gigashots');
insert into DEPARTMENTS (department_id, department_name)
values (344, 'Brainlounge');
insert into DEPARTMENTS (department_id, department_name)
values (345, 'Miboo');
insert into DEPARTMENTS (department_id, department_name)
values (346, 'Dazzlesphere');
insert into DEPARTMENTS (department_id, department_name)
values (347, 'Kayveo');
insert into DEPARTMENTS (department_id, department_name)
values (348, 'Voonder');
insert into DEPARTMENTS (department_id, department_name)
values (349, 'Meedoo');
insert into DEPARTMENTS (department_id, department_name)
values (350, 'Oba');
insert into DEPARTMENTS (department_id, department_name)
values (351, 'Jaxspan');
insert into DEPARTMENTS (department_id, department_name)
values (352, 'Flipbug');
insert into DEPARTMENTS (department_id, department_name)
values (353, 'Thoughtsphere');
insert into DEPARTMENTS (department_id, department_name)
values (354, 'Quimm');
insert into DEPARTMENTS (department_id, department_name)
values (355, 'Muxo');
insert into DEPARTMENTS (department_id, department_name)
values (356, 'Riffwire');
insert into DEPARTMENTS (department_id, department_name)
values (357, 'Skaboo');
insert into DEPARTMENTS (department_id, department_name)
values (358, 'Blogtag');
insert into DEPARTMENTS (department_id, department_name)
values (359, 'Gabtune');
insert into DEPARTMENTS (department_id, department_name)
values (360, 'Agimba');
insert into DEPARTMENTS (department_id, department_name)
values (361, 'Jetwire');
insert into DEPARTMENTS (department_id, department_name)
values (362, 'Riffpedia');
insert into DEPARTMENTS (department_id, department_name)
values (363, 'Viva');
insert into DEPARTMENTS (department_id, department_name)
values (364, 'Fiveclub');
insert into DEPARTMENTS (department_id, department_name)
values (365, 'Meedoo');
insert into DEPARTMENTS (department_id, department_name)
values (366, 'Photolist');
insert into DEPARTMENTS (department_id, department_name)
values (367, 'Izio');
insert into DEPARTMENTS (department_id, department_name)
values (368, 'Quire');
insert into DEPARTMENTS (department_id, department_name)
values (369, 'Topicblab');
insert into DEPARTMENTS (department_id, department_name)
values (370, 'Zava');
insert into DEPARTMENTS (department_id, department_name)
values (371, 'Yakijo');
commit;
prompt 500 records committed...
insert into DEPARTMENTS (department_id, department_name)
values (372, 'Kwinu');
insert into DEPARTMENTS (department_id, department_name)
values (373, 'BlogXS');
insert into DEPARTMENTS (department_id, department_name)
values (374, 'Tambee');
insert into DEPARTMENTS (department_id, department_name)
values (375, 'Yacero');
insert into DEPARTMENTS (department_id, department_name)
values (376, 'Einti');
insert into DEPARTMENTS (department_id, department_name)
values (377, 'Miboo');
insert into DEPARTMENTS (department_id, department_name)
values (378, 'Flashset');
insert into DEPARTMENTS (department_id, department_name)
values (379, 'Eayo');
insert into DEPARTMENTS (department_id, department_name)
values (380, 'Fiveclub');
insert into DEPARTMENTS (department_id, department_name)
values (381, 'Thoughtstorm');
insert into DEPARTMENTS (department_id, department_name)
values (382, 'Realblab');
insert into DEPARTMENTS (department_id, department_name)
values (383, 'Camido');
insert into DEPARTMENTS (department_id, department_name)
values (384, 'Viva');
insert into DEPARTMENTS (department_id, department_name)
values (385, 'Zoomcast');
insert into DEPARTMENTS (department_id, department_name)
values (386, 'Livetube');
insert into DEPARTMENTS (department_id, department_name)
values (387, 'Lazzy');
insert into DEPARTMENTS (department_id, department_name)
values (388, 'Jabbersphere');
insert into DEPARTMENTS (department_id, department_name)
values (389, 'Jaxbean');
insert into DEPARTMENTS (department_id, department_name)
values (390, 'Meevee');
insert into DEPARTMENTS (department_id, department_name)
values (391, 'Flipbug');
insert into DEPARTMENTS (department_id, department_name)
values (392, 'Babbleset');
insert into DEPARTMENTS (department_id, department_name)
values (393, 'Dabshots');
insert into DEPARTMENTS (department_id, department_name)
values (394, 'Tazz');
insert into DEPARTMENTS (department_id, department_name)
values (395, 'Voonyx');
insert into DEPARTMENTS (department_id, department_name)
values (396, 'Trilith');
insert into DEPARTMENTS (department_id, department_name)
values (397, 'Kamba');
insert into DEPARTMENTS (department_id, department_name)
values (398, 'LiveZ');
insert into DEPARTMENTS (department_id, department_name)
values (399, 'Buzzshare');
insert into DEPARTMENTS (department_id, department_name)
values (400, 'Wikivu');
insert into DEPARTMENTS (department_id, department_name)
values (401, 'Wordify');
insert into DEPARTMENTS (department_id, department_name)
values (402, 'Dabshots');
insert into DEPARTMENTS (department_id, department_name)
values (403, 'Jaloo');
insert into DEPARTMENTS (department_id, department_name)
values (404, 'Kwimbee');
insert into DEPARTMENTS (department_id, department_name)
values (405, 'Feedbug');
insert into DEPARTMENTS (department_id, department_name)
values (406, 'Skipfire');
insert into DEPARTMENTS (department_id, department_name)
values (407, 'Oyope');
insert into DEPARTMENTS (department_id, department_name)
values (408, 'Kazio');
insert into DEPARTMENTS (department_id, department_name)
values (409, 'Meedoo');
insert into DEPARTMENTS (department_id, department_name)
values (410, 'Flipbug');
insert into DEPARTMENTS (department_id, department_name)
values (411, 'Babbleblab');
insert into DEPARTMENTS (department_id, department_name)
values (412, 'Zoonoodle');
insert into DEPARTMENTS (department_id, department_name)
values (413, 'Yotz');
insert into DEPARTMENTS (department_id, department_name)
values (414, 'Topicshots');
insert into DEPARTMENTS (department_id, department_name)
values (415, 'Riffpedia');
insert into DEPARTMENTS (department_id, department_name)
values (416, 'Thoughtsphere');
insert into DEPARTMENTS (department_id, department_name)
values (417, 'Yakidoo');
insert into DEPARTMENTS (department_id, department_name)
values (418, 'Wikibox');
insert into DEPARTMENTS (department_id, department_name)
values (419, 'Dablist');
insert into DEPARTMENTS (department_id, department_name)
values (420, 'Teklist');
insert into DEPARTMENTS (department_id, department_name)
values (421, 'Kare');
insert into DEPARTMENTS (department_id, department_name)
values (422, 'Dynabox');
insert into DEPARTMENTS (department_id, department_name)
values (423, 'Realfire');
insert into DEPARTMENTS (department_id, department_name)
values (424, 'Demivee');
insert into DEPARTMENTS (department_id, department_name)
values (425, 'Jabbertype');
insert into DEPARTMENTS (department_id, department_name)
values (426, 'Shufflester');
insert into DEPARTMENTS (department_id, department_name)
values (427, 'Mydeo');
insert into DEPARTMENTS (department_id, department_name)
values (428, 'Camimbo');
insert into DEPARTMENTS (department_id, department_name)
values (429, 'Linklinks');
insert into DEPARTMENTS (department_id, department_name)
values (430, 'Demivee');
insert into DEPARTMENTS (department_id, department_name)
values (431, 'Eabox');
insert into DEPARTMENTS (department_id, department_name)
values (432, 'Dynazzy');
insert into DEPARTMENTS (department_id, department_name)
values (433, 'Livepath');
insert into DEPARTMENTS (department_id, department_name)
values (434, 'Yamia');
insert into DEPARTMENTS (department_id, department_name)
values (435, 'Topdrive');
insert into DEPARTMENTS (department_id, department_name)
values (436, 'Yambee');
insert into DEPARTMENTS (department_id, department_name)
values (437, 'Wikizz');
insert into DEPARTMENTS (department_id, department_name)
values (438, 'Quimm');
insert into DEPARTMENTS (department_id, department_name)
values (439, 'Flashpoint');
insert into DEPARTMENTS (department_id, department_name)
values (440, 'Zoonder');
insert into DEPARTMENTS (department_id, department_name)
values (441, 'Quaxo');
insert into DEPARTMENTS (department_id, department_name)
values (442, 'Meetz');
insert into DEPARTMENTS (department_id, department_name)
values (443, 'Skinix');
insert into DEPARTMENTS (department_id, department_name)
values (444, 'Yodoo');
insert into DEPARTMENTS (department_id, department_name)
values (445, 'Mudo');
insert into DEPARTMENTS (department_id, department_name)
values (446, 'Kaymbo');
insert into DEPARTMENTS (department_id, department_name)
values (447, 'Rooxo');
insert into DEPARTMENTS (department_id, department_name)
values (448, 'Edgeclub');
insert into DEPARTMENTS (department_id, department_name)
values (449, 'Roombo');
insert into DEPARTMENTS (department_id, department_name)
values (450, 'Bubblemix');
insert into DEPARTMENTS (department_id, department_name)
values (451, 'Zoovu');
insert into DEPARTMENTS (department_id, department_name)
values (452, 'Realcube');
insert into DEPARTMENTS (department_id, department_name)
values (453, 'Mycat');
insert into DEPARTMENTS (department_id, department_name)
values (454, 'Flashdog');
insert into DEPARTMENTS (department_id, department_name)
values (455, 'Browsezoom');
insert into DEPARTMENTS (department_id, department_name)
values (456, 'Mydo');
insert into DEPARTMENTS (department_id, department_name)
values (457, 'Jaxspan');
insert into DEPARTMENTS (department_id, department_name)
values (458, 'Zoovu');
insert into DEPARTMENTS (department_id, department_name)
values (459, 'Pixoboo');
insert into DEPARTMENTS (department_id, department_name)
values (460, 'Tagtune');
insert into DEPARTMENTS (department_id, department_name)
values (461, 'Trunyx');
insert into DEPARTMENTS (department_id, department_name)
values (462, 'Skinte');
insert into DEPARTMENTS (department_id, department_name)
values (463, 'Oyoloo');
insert into DEPARTMENTS (department_id, department_name)
values (464, 'Twitterworks');
insert into DEPARTMENTS (department_id, department_name)
values (465, 'Zoombox');
insert into DEPARTMENTS (department_id, department_name)
values (466, 'Yakitri');
insert into DEPARTMENTS (department_id, department_name)
values (467, 'Jayo');
insert into DEPARTMENTS (department_id, department_name)
values (468, 'Minyx');
insert into DEPARTMENTS (department_id, department_name)
values (469, 'Demizz');
insert into DEPARTMENTS (department_id, department_name)
values (470, 'Abata');
insert into DEPARTMENTS (department_id, department_name)
values (471, 'Trilia');
commit;
prompt 600 records committed...
insert into DEPARTMENTS (department_id, department_name)
values (472, 'Muxo');
insert into DEPARTMENTS (department_id, department_name)
values (473, 'Npath');
insert into DEPARTMENTS (department_id, department_name)
values (474, 'Jabbersphere');
insert into DEPARTMENTS (department_id, department_name)
values (475, 'Mudo');
insert into DEPARTMENTS (department_id, department_name)
values (476, 'Aimbu');
insert into DEPARTMENTS (department_id, department_name)
values (477, 'Gabcube');
insert into DEPARTMENTS (department_id, department_name)
values (478, 'Agimba');
insert into DEPARTMENTS (department_id, department_name)
values (479, 'Buzzbean');
insert into DEPARTMENTS (department_id, department_name)
values (480, 'Skalith');
insert into DEPARTMENTS (department_id, department_name)
values (481, 'Realbridge');
insert into DEPARTMENTS (department_id, department_name)
values (482, 'Skynoodle');
insert into DEPARTMENTS (department_id, department_name)
values (483, 'Jaxworks');
insert into DEPARTMENTS (department_id, department_name)
values (484, 'Izio');
insert into DEPARTMENTS (department_id, department_name)
values (485, 'Bubblebox');
insert into DEPARTMENTS (department_id, department_name)
values (486, 'Nlounge');
insert into DEPARTMENTS (department_id, department_name)
values (487, 'Mudo');
insert into DEPARTMENTS (department_id, department_name)
values (488, 'Zoombeat');
insert into DEPARTMENTS (department_id, department_name)
values (489, 'Shufflebeat');
insert into DEPARTMENTS (department_id, department_name)
values (490, 'Tagcat');
insert into DEPARTMENTS (department_id, department_name)
values (491, 'Edgeclub');
insert into DEPARTMENTS (department_id, department_name)
values (492, 'Edgewire');
insert into DEPARTMENTS (department_id, department_name)
values (493, 'Gevee');
insert into DEPARTMENTS (department_id, department_name)
values (494, 'Quamba');
insert into DEPARTMENTS (department_id, department_name)
values (495, 'Devshare');
insert into DEPARTMENTS (department_id, department_name)
values (496, 'Zoonoodle');
insert into DEPARTMENTS (department_id, department_name)
values (497, 'Skidoo');
insert into DEPARTMENTS (department_id, department_name)
values (498, 'Youbridge');
insert into DEPARTMENTS (department_id, department_name)
values (499, 'Linkbuzz');
insert into DEPARTMENTS (department_id, department_name)
values (500, 'Brainverse');
commit;
prompt 629 records loaded
prompt Loading PROJECTS...
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2907, 'Analytical Management Services', to_date('03-08-2020', 'dd-mm-yyyy'), to_date('09-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7952, 'ScriptSave', to_date('21-03-2021', 'dd-mm-yyyy'), to_date('05-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (1217, 'Reckitt Benckiser', to_date('12-11-2020', 'dd-mm-yyyy'), to_date('18-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (1348, 'Black Mountain Management', to_date('12-01-2022', 'dd-mm-yyyy'), to_date('03-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6003, 'Deutsche Telekom', to_date('21-05-2020', 'dd-mm-yyyy'), to_date('07-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8678, 'EPIQ Systems', to_date('25-12-2021', 'dd-mm-yyyy'), to_date('06-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2151, 'Miracle Software Systems', to_date('01-03-2022', 'dd-mm-yyyy'), to_date('16-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3833, 'Mathis, Earnest & Vandeventer', to_date('19-02-2022', 'dd-mm-yyyy'), to_date('03-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5584, 'Solipsys', to_date('01-12-2021', 'dd-mm-yyyy'), to_date('19-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4777, 'ACS International Resources', to_date('31-08-2020', 'dd-mm-yyyy'), to_date('20-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5667, 'News Corp.', to_date('16-01-2022', 'dd-mm-yyyy'), to_date('28-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8356, 'Employer Services', to_date('29-08-2020', 'dd-mm-yyyy'), to_date('21-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4909, 'Medical Action Industries', to_date('27-03-2022', 'dd-mm-yyyy'), to_date('06-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4407, 'Campbell Soup Co.', to_date('13-07-2020', 'dd-mm-yyyy'), to_date('17-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2990, 'Harrison & Shriftman', to_date('10-09-2020', 'dd-mm-yyyy'), to_date('14-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6189, 'Nature''s Cure', to_date('19-01-2021', 'dd-mm-yyyy'), to_date('08-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6090, 'Tarragon Realty', to_date('30-12-2021', 'dd-mm-yyyy'), to_date('23-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7123, 'Timberlane Woodcrafters', to_date('14-01-2021', 'dd-mm-yyyy'), to_date('23-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7537, 'Travizon', to_date('01-08-2021', 'dd-mm-yyyy'), to_date('13-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7842, 'U.S. Government', to_date('18-08-2021', 'dd-mm-yyyy'), to_date('16-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2770, 'G.A. Beck Artistic Services', to_date('04-11-2020', 'dd-mm-yyyy'), to_date('15-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5561, 'Bestever', to_date('22-03-2021', 'dd-mm-yyyy'), to_date('10-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2605, 'Tropical Oasis', to_date('11-11-2020', 'dd-mm-yyyy'), to_date('07-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8751, 'Street Glow', to_date('26-12-2020', 'dd-mm-yyyy'), to_date('06-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8822, 'MQ Software', to_date('06-10-2020', 'dd-mm-yyyy'), to_date('05-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5131, 'Perfect Order', to_date('23-01-2021', 'dd-mm-yyyy'), to_date('24-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6058, 'ACS International Resources', to_date('15-09-2020', 'dd-mm-yyyy'), to_date('10-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8968, 'Verizon Communications', to_date('04-05-2021', 'dd-mm-yyyy'), to_date('28-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6024, 'Dataprise', to_date('23-06-2021', 'dd-mm-yyyy'), to_date('13-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7697, 'Estee Lauder Cos.', to_date('13-11-2020', 'dd-mm-yyyy'), to_date('10-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9015, 'Genex Technologies', to_date('20-09-2020', 'dd-mm-yyyy'), to_date('25-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5845, 'Active Services', to_date('01-12-2021', 'dd-mm-yyyy'), to_date('22-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8756, 'Blue Ocean Software', to_date('21-10-2021', 'dd-mm-yyyy'), to_date('01-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4271, 'Fetch Logistics', to_date('20-08-2020', 'dd-mm-yyyy'), to_date('31-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4538, 'National Home Health Care', to_date('17-04-2021', 'dd-mm-yyyy'), to_date('13-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4723, 'Bedford Bancshares', to_date('04-05-2020', 'dd-mm-yyyy'), to_date('01-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2684, 'Flake-Wilkerson Market Insights', to_date('18-01-2021', 'dd-mm-yyyy'), to_date('03-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3698, 'Marriott International', to_date('10-06-2021', 'dd-mm-yyyy'), to_date('03-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7317, 'Mercantile Bank', to_date('22-12-2020', 'dd-mm-yyyy'), to_date('28-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2623, 'TimeVision', to_date('23-12-2021', 'dd-mm-yyyy'), to_date('08-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9447, 'Home Depot', to_date('13-05-2020', 'dd-mm-yyyy'), to_date('08-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7343, 'Summit Energy', to_date('19-10-2020', 'dd-mm-yyyy'), to_date('09-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (1362, 'Tracer Technologies', to_date('14-11-2021', 'dd-mm-yyyy'), to_date('07-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7926, 'Adolph Coors Co.', to_date('05-05-2021', 'dd-mm-yyyy'), to_date('19-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7344, 'DaimlerChrysler', to_date('17-02-2022', 'dd-mm-yyyy'), to_date('02-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (1778, 'Myricom', to_date('21-01-2022', 'dd-mm-yyyy'), to_date('28-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4686, 'Berkshire Hathaway', to_date('27-12-2020', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6068, 'CyberThink', to_date('15-06-2021', 'dd-mm-yyyy'), to_date('28-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5026, 'InfoPros', to_date('05-05-2021', 'dd-mm-yyyy'), to_date('08-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5471, 'Elite Computers & Software', to_date('03-10-2021', 'dd-mm-yyyy'), to_date('05-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7995, 'Carteret Mortgage', to_date('20-08-2021', 'dd-mm-yyyy'), to_date('30-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6222, 'Intrasphere Technologies', to_date('19-03-2021', 'dd-mm-yyyy'), to_date('08-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7176, 'Network Hardware Resale', to_date('15-12-2020', 'dd-mm-yyyy'), to_date('25-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7475, 'Partnership in Building', to_date('02-01-2021', 'dd-mm-yyyy'), to_date('17-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3375, 'Harrison & Shriftman', to_date('11-10-2020', 'dd-mm-yyyy'), to_date('22-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6989, 'Security Mortgage Group', to_date('15-10-2020', 'dd-mm-yyyy'), to_date('18-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7204, 'Bestever', to_date('18-04-2021', 'dd-mm-yyyy'), to_date('10-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5111, 'Visionary Systems', to_date('12-11-2020', 'dd-mm-yyyy'), to_date('28-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3980, 'Strategic Products and Services', to_date('06-06-2020', 'dd-mm-yyyy'), to_date('16-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7084, 'Diamond Pharmacy Services', to_date('22-12-2020', 'dd-mm-yyyy'), to_date('30-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6929, 'TruSecure', to_date('29-05-2021', 'dd-mm-yyyy'), to_date('10-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5660, 'Heritage Microfilm', to_date('19-09-2021', 'dd-mm-yyyy'), to_date('22-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9716, 'Baesch Computer Consulting', to_date('06-01-2021', 'dd-mm-yyyy'), to_date('06-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7025, 'Service Link', to_date('01-08-2020', 'dd-mm-yyyy'), to_date('23-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9270, 'Coridian Technologies', to_date('11-06-2020', 'dd-mm-yyyy'), to_date('11-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (1045, 'Aquascape Designs', to_date('21-08-2020', 'dd-mm-yyyy'), to_date('13-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8935, 'StoneTech Professional', to_date('04-10-2020', 'dd-mm-yyyy'), to_date('13-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (1816, 'Scooter Store', to_date('21-10-2021', 'dd-mm-yyyy'), to_date('22-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (1931, 'Sears, Roebuck & Co.', to_date('11-01-2021', 'dd-mm-yyyy'), to_date('13-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5527, 'IVCi', to_date('13-10-2020', 'dd-mm-yyyy'), to_date('20-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7118, 'LogistiCare', to_date('14-01-2021', 'dd-mm-yyyy'), to_date('23-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9642, 'eCopy', to_date('05-08-2021', 'dd-mm-yyyy'), to_date('17-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4089, 'Balchem', to_date('25-08-2020', 'dd-mm-yyyy'), to_date('30-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3384, 'GRT', to_date('01-10-2020', 'dd-mm-yyyy'), to_date('11-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (1562, 'Creditors Interchange', to_date('12-10-2021', 'dd-mm-yyyy'), to_date('01-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (1548, 'Tastefully Simple', to_date('15-01-2021', 'dd-mm-yyyy'), to_date('31-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5086, 'First South Bancorp', to_date('06-01-2021', 'dd-mm-yyyy'), to_date('15-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4604, 'V-Span', to_date('16-12-2021', 'dd-mm-yyyy'), to_date('09-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (1069, 'Lloyd Group', to_date('29-10-2020', 'dd-mm-yyyy'), to_date('16-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2133, 'Iris Software', to_date('26-09-2020', 'dd-mm-yyyy'), to_date('30-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2108, 'Gateway', to_date('11-06-2021', 'dd-mm-yyyy'), to_date('13-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (1567, 'Pulaski Financial', to_date('09-01-2022', 'dd-mm-yyyy'), to_date('30-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9635, 'Tilia', to_date('24-04-2021', 'dd-mm-yyyy'), to_date('08-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (1237, 'Connected', to_date('03-03-2022', 'dd-mm-yyyy'), to_date('02-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (1879, 'ORI Services', to_date('23-03-2022', 'dd-mm-yyyy'), to_date('22-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6741, 'SEI/Aaron''s', to_date('21-02-2022', 'dd-mm-yyyy'), to_date('08-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (1135, 'U.S. dairy producers, processors', to_date('11-01-2021', 'dd-mm-yyyy'), to_date('07-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9623, 'Formatech', to_date('28-01-2021', 'dd-mm-yyyy'), to_date('16-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4347, 'Ositis Software', to_date('02-01-2022', 'dd-mm-yyyy'), to_date('22-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9361, 'Visionary Systems', to_date('11-06-2020', 'dd-mm-yyyy'), to_date('10-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2010, 'Johnson & Johnson', to_date('27-10-2021', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6670, 'Jewett-Cameron Trading', to_date('02-11-2020', 'dd-mm-yyyy'), to_date('23-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4372, 'New View Gifts & Accessories', to_date('28-02-2021', 'dd-mm-yyyy'), to_date('25-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4120, 'Data Warehouse', to_date('25-05-2021', 'dd-mm-yyyy'), to_date('30-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2959, 'Eastman Kodak Co.', to_date('10-12-2020', 'dd-mm-yyyy'), to_date('13-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5060, 'Advanced Internet Technologies', to_date('03-11-2021', 'dd-mm-yyyy'), to_date('15-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2409, 'PrintingForLess.com', to_date('05-03-2021', 'dd-mm-yyyy'), to_date('14-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (1860, 'Lindin Consulting', to_date('24-02-2021', 'dd-mm-yyyy'), to_date('02-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5620, 'NoBrainerBlinds.com', to_date('09-06-2020', 'dd-mm-yyyy'), to_date('23-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7463, 'Manhattan Associates', to_date('08-11-2020', 'dd-mm-yyyy'), to_date('25-10-2023', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6204, 'ProfitLine', to_date('31-12-2021', 'dd-mm-yyyy'), to_date('12-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4251, 'Hewlett-Packard Co.', to_date('09-12-2020', 'dd-mm-yyyy'), to_date('14-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6264, 'Signal Perfection', to_date('10-07-2020', 'dd-mm-yyyy'), to_date('08-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8225, 'Network Management Resources', to_date('30-05-2020', 'dd-mm-yyyy'), to_date('24-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5473, 'Capital Corp.', to_date('12-06-2021', 'dd-mm-yyyy'), to_date('01-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5488, 'Homebuilders Financial Network', to_date('10-06-2020', 'dd-mm-yyyy'), to_date('17-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6476, 'Signature Consultants', to_date('12-12-2020', 'dd-mm-yyyy'), to_date('15-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4057, 'Abdon Callais Offshore', to_date('05-03-2022', 'dd-mm-yyyy'), to_date('13-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9594, 'L’Oreal', to_date('22-07-2020', 'dd-mm-yyyy'), to_date('17-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2971, 'Yum Brands', to_date('23-02-2021', 'dd-mm-yyyy'), to_date('11-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5849, 'Bowman Consulting Group', to_date('20-05-2020', 'dd-mm-yyyy'), to_date('18-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4722, 'Freedom Medical', to_date('28-04-2022', 'dd-mm-yyyy'), to_date('01-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4295, 'Learning Voyage', to_date('21-12-2020', 'dd-mm-yyyy'), to_date('14-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7996, 'Novartis', to_date('05-10-2021', 'dd-mm-yyyy'), to_date('26-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3667, 'SCI', to_date('15-10-2021', 'dd-mm-yyyy'), to_date('14-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (1, 'Project Alpha', to_date('01-01-2024', 'dd-mm-yyyy'), to_date('31-12-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (101, 'Project Alpha', to_date('01-01-2024', 'dd-mm-yyyy'), to_date('31-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (102, 'Project Beta', to_date('01-02-2024', 'dd-mm-yyyy'), to_date('29-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (103, 'Project Gamma', to_date('01-03-2024', 'dd-mm-yyyy'), to_date('31-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (104, 'Project Delta', to_date('01-04-2024', 'dd-mm-yyyy'), to_date('30-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (105, 'Project Epsilon', to_date('01-05-2024', 'dd-mm-yyyy'), to_date('31-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (106, 'Project Zeta', to_date('01-06-2024', 'dd-mm-yyyy'), to_date('30-06-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (107, 'Project Eta', to_date('01-07-2024', 'dd-mm-yyyy'), to_date('31-07-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (108, 'Project Theta', to_date('01-08-2024', 'dd-mm-yyyy'), to_date('31-08-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (109, 'Project Iota', to_date('01-09-2024', 'dd-mm-yyyy'), to_date('30-09-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (110, 'Project Kappa', to_date('01-10-2024', 'dd-mm-yyyy'), to_date('31-10-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (111, 'Project Lambda', to_date('01-11-2024', 'dd-mm-yyyy'), to_date('30-11-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (112, 'Project Mu', to_date('01-12-2024', 'dd-mm-yyyy'), to_date('31-12-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (113, 'Project Nu', to_date('01-01-2025', 'dd-mm-yyyy'), to_date('31-01-2025', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (114, 'Project Xi', to_date('01-02-2025', 'dd-mm-yyyy'), to_date('28-02-2025', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (115, 'Project Omicron', to_date('01-03-2025', 'dd-mm-yyyy'), to_date('31-03-2025', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (116, 'Project Pi', to_date('01-04-2025', 'dd-mm-yyyy'), to_date('30-04-2025', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (117, 'Project Rho', to_date('01-05-2025', 'dd-mm-yyyy'), to_date('31-05-2025', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (118, 'Project Sigma', to_date('01-06-2025', 'dd-mm-yyyy'), to_date('30-06-2025', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (119, 'Project Tau', to_date('01-07-2025', 'dd-mm-yyyy'), to_date('31-07-2025', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (120, 'Project Upsilon', to_date('01-08-2025', 'dd-mm-yyyy'), to_date('31-08-2025', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (121, 'Project Phi', to_date('01-09-2025', 'dd-mm-yyyy'), to_date('30-09-2025', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (122, 'Project Chi', to_date('01-10-2025', 'dd-mm-yyyy'), to_date('31-10-2025', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (123, 'Project Psi', to_date('01-11-2025', 'dd-mm-yyyy'), to_date('30-11-2025', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (124, 'Project Omega', to_date('01-12-2025', 'dd-mm-yyyy'), to_date('31-12-2025', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (125, 'Project A', to_date('01-01-2026', 'dd-mm-yyyy'), to_date('31-01-2026', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (126, 'Project B', to_date('01-02-2026', 'dd-mm-yyyy'), to_date('28-02-2026', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (127, 'Project C', to_date('01-03-2026', 'dd-mm-yyyy'), to_date('31-03-2026', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (128, 'Project D', to_date('01-04-2026', 'dd-mm-yyyy'), to_date('30-04-2026', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (2, 'Matsoft', to_date('24-03-2024', 'dd-mm-yyyy'), to_date('14-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (3, 'Bytecard', to_date('01-10-2023', 'dd-mm-yyyy'), to_date('18-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (4, 'Alpha', to_date('03-03-2024', 'dd-mm-yyyy'), to_date('01-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (5, 'Cardify', to_date('14-06-2023', 'dd-mm-yyyy'), to_date('21-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (6, 'Flexidy', to_date('18-09-2023', 'dd-mm-yyyy'), to_date('19-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (7, 'Flexidy', to_date('26-07-2023', 'dd-mm-yyyy'), to_date('09-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (8, 'Redhold', to_date('28-01-2024', 'dd-mm-yyyy'), to_date('21-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (9, 'Overhold', to_date('10-04-2024', 'dd-mm-yyyy'), to_date('26-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (10, 'Subin', to_date('30-10-2023', 'dd-mm-yyyy'), to_date('13-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (11, 'Quo Lux', to_date('05-07-2023', 'dd-mm-yyyy'), to_date('18-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (12, 'Veribet', to_date('27-11-2023', 'dd-mm-yyyy'), to_date('21-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (13, 'Pannier', to_date('18-07-2023', 'dd-mm-yyyy'), to_date('07-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (14, 'Zaam-Dox', to_date('11-03-2024', 'dd-mm-yyyy'), to_date('15-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (15, 'It', to_date('09-06-2023', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (16, 'Tres-Zap', to_date('30-08-2023', 'dd-mm-yyyy'), to_date('25-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (17, 'Veribet', to_date('23-10-2023', 'dd-mm-yyyy'), to_date('24-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (18, 'Bytecard', to_date('21-11-2023', 'dd-mm-yyyy'), to_date('10-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (19, 'Cardguard', to_date('12-02-2024', 'dd-mm-yyyy'), to_date('10-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (20, 'Transcof', to_date('10-04-2024', 'dd-mm-yyyy'), to_date('25-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (21, 'Konklab', to_date('13-07-2023', 'dd-mm-yyyy'), to_date('06-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (22, 'Treeflex', to_date('14-01-2024', 'dd-mm-yyyy'), to_date('25-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (23, 'Stim', to_date('12-12-2023', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (24, 'Cardify', to_date('23-05-2023', 'dd-mm-yyyy'), to_date('18-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (25, 'Trippledex', to_date('02-05-2024', 'dd-mm-yyyy'), to_date('13-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (26, 'Y-find', to_date('15-10-2023', 'dd-mm-yyyy'), to_date('29-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (27, 'Hatity', to_date('16-01-2024', 'dd-mm-yyyy'), to_date('05-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (28, 'Tin', to_date('04-05-2024', 'dd-mm-yyyy'), to_date('14-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (29, 'Veribet', to_date('06-10-2023', 'dd-mm-yyyy'), to_date('07-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (30, 'Stronghold', to_date('28-03-2024', 'dd-mm-yyyy'), to_date('04-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (31, 'Fintone', to_date('04-08-2023', 'dd-mm-yyyy'), to_date('31-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (32, 'Cardify', to_date('13-11-2023', 'dd-mm-yyyy'), to_date('23-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (33, 'Wrapsafe', to_date('14-03-2024', 'dd-mm-yyyy'), to_date('10-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (34, 'Gembucket', to_date('15-11-2023', 'dd-mm-yyyy'), to_date('02-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (35, 'Sonair', to_date('31-08-2023', 'dd-mm-yyyy'), to_date('23-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (36, 'Konklab', to_date('12-06-2023', 'dd-mm-yyyy'), to_date('22-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (37, 'Zamit', to_date('27-01-2024', 'dd-mm-yyyy'), to_date('08-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (38, 'Span', to_date('15-10-2023', 'dd-mm-yyyy'), to_date('24-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (39, 'Regrant', to_date('28-02-2024', 'dd-mm-yyyy'), to_date('15-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (40, 'Bigtax', to_date('01-07-2023', 'dd-mm-yyyy'), to_date('11-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (41, 'Lotlux', to_date('04-06-2023', 'dd-mm-yyyy'), to_date('23-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (42, 'It', to_date('29-06-2023', 'dd-mm-yyyy'), to_date('20-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (43, 'Bamity', to_date('19-02-2024', 'dd-mm-yyyy'), to_date('02-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (44, 'Voltsillam', to_date('20-11-2023', 'dd-mm-yyyy'), to_date('04-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (45, 'Bitchip', to_date('24-07-2023', 'dd-mm-yyyy'), to_date('23-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (46, 'Konklab', to_date('06-10-2023', 'dd-mm-yyyy'), to_date('29-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (47, 'Cardguard', to_date('11-11-2023', 'dd-mm-yyyy'), to_date('26-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (48, 'It', to_date('04-08-2023', 'dd-mm-yyyy'), to_date('23-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (49, 'Ventosanzap', to_date('28-02-2024', 'dd-mm-yyyy'), to_date('23-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (50, 'Konklab', to_date('05-01-2024', 'dd-mm-yyyy'), to_date('03-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (51, 'Matsoft', to_date('29-08-2023', 'dd-mm-yyyy'), to_date('12-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (52, 'Tampflex', to_date('04-10-2023', 'dd-mm-yyyy'), to_date('19-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (53, 'Job', to_date('30-04-2024', 'dd-mm-yyyy'), to_date('26-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (54, 'It', to_date('16-09-2023', 'dd-mm-yyyy'), to_date('30-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (55, 'Zamit', to_date('03-11-2023', 'dd-mm-yyyy'), to_date('20-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (56, 'Bigtax', to_date('29-05-2023', 'dd-mm-yyyy'), to_date('14-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (57, 'Tampflex', to_date('01-11-2023', 'dd-mm-yyyy'), to_date('19-04-2024', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (58, 'Bytecard', to_date('12-04-2024', 'dd-mm-yyyy'), to_date('08-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (59, 'Sub-Ex', to_date('04-06-2023', 'dd-mm-yyyy'), to_date('29-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (60, 'Daltfresh', to_date('29-04-2024', 'dd-mm-yyyy'), to_date('16-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (61, 'Y-Solowarm', to_date('13-07-2023', 'dd-mm-yyyy'), to_date('26-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (62, 'Konklab', to_date('15-11-2023', 'dd-mm-yyyy'), to_date('09-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (63, 'Pannier', to_date('07-07-2023', 'dd-mm-yyyy'), to_date('12-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (64, 'Veribet', to_date('14-06-2023', 'dd-mm-yyyy'), to_date('24-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (65, 'Ronstring', to_date('30-10-2023', 'dd-mm-yyyy'), to_date('07-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (66, 'Keylex', to_date('28-11-2023', 'dd-mm-yyyy'), to_date('28-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (67, 'Sub-Ex', to_date('10-08-2023', 'dd-mm-yyyy'), to_date('13-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (68, 'Tin', to_date('24-10-2023', 'dd-mm-yyyy'), to_date('11-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (69, 'Matsoft', to_date('23-07-2023', 'dd-mm-yyyy'), to_date('06-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (70, 'Cookley', to_date('09-02-2024', 'dd-mm-yyyy'), to_date('02-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (71, 'Rank', to_date('09-10-2023', 'dd-mm-yyyy'), to_date('19-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (72, 'Alphazap', to_date('26-02-2024', 'dd-mm-yyyy'), to_date('15-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (73, 'Konklux', to_date('28-08-2023', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (74, 'Lotstring', to_date('17-03-2024', 'dd-mm-yyyy'), to_date('22-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (75, 'Toughjoyfax', to_date('05-07-2023', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (76, 'Namfix', to_date('10-07-2023', 'dd-mm-yyyy'), to_date('02-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (77, 'Hatity', to_date('23-05-2023', 'dd-mm-yyyy'), to_date('07-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (78, 'Kanlam', to_date('23-01-2024', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (79, 'Temp', to_date('15-11-2023', 'dd-mm-yyyy'), to_date('07-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (80, 'Solarbreeze', to_date('15-10-2023', 'dd-mm-yyyy'), to_date('16-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (81, 'Lotstring', to_date('15-11-2023', 'dd-mm-yyyy'), to_date('19-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (82, 'Bitwolf', to_date('15-01-2024', 'dd-mm-yyyy'), to_date('17-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (83, 'Hatity', to_date('02-02-2024', 'dd-mm-yyyy'), to_date('17-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (84, 'Latlux', to_date('29-03-2024', 'dd-mm-yyyy'), to_date('15-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (85, 'Tin', to_date('03-03-2024', 'dd-mm-yyyy'), to_date('21-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (86, 'Prodder', to_date('09-08-2023', 'dd-mm-yyyy'), to_date('25-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (87, 'Tres-Zap', to_date('02-07-2023', 'dd-mm-yyyy'), to_date('06-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (88, 'Gembucket', to_date('06-10-2023', 'dd-mm-yyyy'), to_date('31-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (89, 'Stronghold', to_date('21-11-2023', 'dd-mm-yyyy'), to_date('19-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (90, 'Home Ing', to_date('31-08-2023', 'dd-mm-yyyy'), to_date('26-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (91, 'Cookley', to_date('29-12-2023', 'dd-mm-yyyy'), to_date('15-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (92, 'Tempsoft', to_date('02-12-2023', 'dd-mm-yyyy'), to_date('03-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (93, 'Quo Lux', to_date('23-11-2023', 'dd-mm-yyyy'), to_date('24-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (94, 'Tresom', to_date('17-06-2023', 'dd-mm-yyyy'), to_date('21-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (95, 'Tempsoft', to_date('11-11-2023', 'dd-mm-yyyy'), to_date('13-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (96, 'Flowdesk', to_date('21-02-2024', 'dd-mm-yyyy'), to_date('19-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (97, 'Trippledex', to_date('02-02-2024', 'dd-mm-yyyy'), to_date('19-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (98, 'Opela', to_date('27-01-2024', 'dd-mm-yyyy'), to_date('28-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (99, 'Tempsoft', to_date('27-12-2023', 'dd-mm-yyyy'), to_date('17-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (100, 'Vagram', to_date('15-08-2023', 'dd-mm-yyyy'), to_date('17-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (129, 'Stringtough', to_date('12-05-2024', 'dd-mm-yyyy'), to_date('26-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (130, 'Voyatouch', to_date('03-11-2023', 'dd-mm-yyyy'), to_date('24-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (131, 'Y-Solowarm', to_date('18-03-2024', 'dd-mm-yyyy'), to_date('17-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (132, 'Lotlux', to_date('26-09-2023', 'dd-mm-yyyy'), to_date('25-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (133, 'Keylex', to_date('08-03-2024', 'dd-mm-yyyy'), to_date('07-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (134, 'Alpha', to_date('09-06-2023', 'dd-mm-yyyy'), to_date('12-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (135, 'Bamity', to_date('14-05-2024', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (136, 'Pannier', to_date('19-07-2023', 'dd-mm-yyyy'), to_date('01-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (137, 'Cookley', to_date('30-05-2023', 'dd-mm-yyyy'), to_date('19-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (138, 'Cardguard', to_date('08-10-2023', 'dd-mm-yyyy'), to_date('29-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (139, 'Opela', to_date('12-01-2024', 'dd-mm-yyyy'), to_date('03-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (140, 'Biodex', to_date('16-02-2024', 'dd-mm-yyyy'), to_date('07-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (141, 'Tampflex', to_date('08-09-2023', 'dd-mm-yyyy'), to_date('17-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (142, 'Cookley', to_date('06-03-2024', 'dd-mm-yyyy'), to_date('17-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (143, 'Cardify', to_date('10-01-2024', 'dd-mm-yyyy'), to_date('09-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (144, 'Rank', to_date('22-01-2024', 'dd-mm-yyyy'), to_date('01-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (145, 'Solarbreeze', to_date('13-03-2024', 'dd-mm-yyyy'), to_date('10-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (146, 'Alphazap', to_date('27-07-2023', 'dd-mm-yyyy'), to_date('15-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (147, 'Quo Lux', to_date('21-06-2023', 'dd-mm-yyyy'), to_date('28-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (148, 'Solarbreeze', to_date('13-12-2023', 'dd-mm-yyyy'), to_date('06-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (149, 'Voyatouch', to_date('01-02-2024', 'dd-mm-yyyy'), to_date('21-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (150, 'Quo Lux', to_date('02-08-2023', 'dd-mm-yyyy'), to_date('09-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (151, 'Konklux', to_date('06-07-2023', 'dd-mm-yyyy'), to_date('14-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (152, 'Subin', to_date('07-01-2024', 'dd-mm-yyyy'), to_date('12-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (153, 'Pannier', to_date('29-08-2023', 'dd-mm-yyyy'), to_date('11-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (154, 'Cookley', to_date('24-07-2023', 'dd-mm-yyyy'), to_date('10-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (155, 'Rank', to_date('31-08-2023', 'dd-mm-yyyy'), to_date('10-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (156, 'Flexidy', to_date('16-04-2024', 'dd-mm-yyyy'), to_date('23-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (157, 'Cardguard', to_date('25-08-2023', 'dd-mm-yyyy'), to_date('17-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (158, 'Zoolab', to_date('29-07-2023', 'dd-mm-yyyy'), to_date('13-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (159, 'Bytecard', to_date('28-09-2023', 'dd-mm-yyyy'), to_date('21-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (160, 'Bitwolf', to_date('03-06-2023', 'dd-mm-yyyy'), to_date('07-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (161, 'Aerified', to_date('22-06-2023', 'dd-mm-yyyy'), to_date('29-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (162, 'Sonair', to_date('08-08-2023', 'dd-mm-yyyy'), to_date('11-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (163, 'Treeflex', to_date('17-04-2024', 'dd-mm-yyyy'), to_date('14-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (164, 'Rank', to_date('23-06-2023', 'dd-mm-yyyy'), to_date('05-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (165, 'Redhold', to_date('20-05-2024', 'dd-mm-yyyy'), to_date('21-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (166, 'It', to_date('16-01-2024', 'dd-mm-yyyy'), to_date('12-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (167, 'Rank', to_date('28-04-2024', 'dd-mm-yyyy'), to_date('24-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (168, 'Mat Lam Tam', to_date('02-05-2024', 'dd-mm-yyyy'), to_date('01-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (169, 'Otcom', to_date('05-05-2024', 'dd-mm-yyyy'), to_date('05-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (170, 'Lotlux', to_date('30-03-2024', 'dd-mm-yyyy'), to_date('05-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (171, 'Biodex', to_date('03-12-2023', 'dd-mm-yyyy'), to_date('02-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (172, 'Fintone', to_date('27-05-2023', 'dd-mm-yyyy'), to_date('30-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (173, 'Gembucket', to_date('02-11-2023', 'dd-mm-yyyy'), to_date('29-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (174, 'Y-Solowarm', to_date('10-06-2023', 'dd-mm-yyyy'), to_date('12-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (175, 'Y-find', to_date('14-11-2023', 'dd-mm-yyyy'), to_date('20-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (176, 'Wrapsafe', to_date('24-10-2023', 'dd-mm-yyyy'), to_date('18-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (177, 'Zoolab', to_date('23-10-2023', 'dd-mm-yyyy'), to_date('15-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (178, 'Gembucket', to_date('07-08-2023', 'dd-mm-yyyy'), to_date('01-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (179, 'Andalax', to_date('17-02-2024', 'dd-mm-yyyy'), to_date('09-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (180, 'Sonsing', to_date('05-09-2023', 'dd-mm-yyyy'), to_date('27-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (181, 'Stim', to_date('14-12-2023', 'dd-mm-yyyy'), to_date('25-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (182, 'Fintone', to_date('31-05-2023', 'dd-mm-yyyy'), to_date('23-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (183, 'Rank', to_date('27-06-2023', 'dd-mm-yyyy'), to_date('28-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (184, 'Sub-Ex', to_date('16-05-2024', 'dd-mm-yyyy'), to_date('09-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (185, 'Alpha', to_date('06-03-2024', 'dd-mm-yyyy'), to_date('11-06-2023', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (186, 'Trippledex', to_date('13-12-2023', 'dd-mm-yyyy'), to_date('10-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (187, 'Holdlamis', to_date('05-02-2024', 'dd-mm-yyyy'), to_date('24-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (188, 'Zamit', to_date('17-03-2024', 'dd-mm-yyyy'), to_date('26-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (189, 'Hatity', to_date('31-07-2023', 'dd-mm-yyyy'), to_date('10-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (190, 'Wrapsafe', to_date('10-11-2023', 'dd-mm-yyyy'), to_date('03-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (191, 'Overhold', to_date('30-12-2023', 'dd-mm-yyyy'), to_date('13-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (192, 'Cookley', to_date('07-03-2024', 'dd-mm-yyyy'), to_date('08-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (193, 'Solarbreeze', to_date('09-06-2023', 'dd-mm-yyyy'), to_date('01-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (194, 'Bitchip', to_date('22-07-2023', 'dd-mm-yyyy'), to_date('11-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (195, 'Zontrax', to_date('10-03-2024', 'dd-mm-yyyy'), to_date('04-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (196, 'Tresom', to_date('01-04-2024', 'dd-mm-yyyy'), to_date('03-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (197, 'Bigtax', to_date('11-08-2023', 'dd-mm-yyyy'), to_date('02-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (198, 'Voyatouch', to_date('15-08-2023', 'dd-mm-yyyy'), to_date('04-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (199, 'Bytecard', to_date('28-08-2023', 'dd-mm-yyyy'), to_date('12-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (200, 'Tresom', to_date('21-03-2024', 'dd-mm-yyyy'), to_date('12-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (201, 'Redhold', to_date('10-07-2023', 'dd-mm-yyyy'), to_date('24-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (202, 'Quo Lux', to_date('03-08-2023', 'dd-mm-yyyy'), to_date('25-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (203, 'Temp', to_date('31-07-2023', 'dd-mm-yyyy'), to_date('09-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (204, 'Viva', to_date('06-02-2024', 'dd-mm-yyyy'), to_date('19-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (205, 'Bitwolf', to_date('10-12-2023', 'dd-mm-yyyy'), to_date('03-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (206, 'Treeflex', to_date('09-01-2024', 'dd-mm-yyyy'), to_date('22-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (207, 'Rank', to_date('27-12-2023', 'dd-mm-yyyy'), to_date('23-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (208, 'Greenlam', to_date('02-01-2024', 'dd-mm-yyyy'), to_date('01-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (209, 'Namfix', to_date('27-10-2023', 'dd-mm-yyyy'), to_date('18-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (210, 'Stim', to_date('30-04-2024', 'dd-mm-yyyy'), to_date('26-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (211, 'Latlux', to_date('05-12-2023', 'dd-mm-yyyy'), to_date('13-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (212, 'Job', to_date('22-05-2023', 'dd-mm-yyyy'), to_date('17-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (213, 'Zaam-Dox', to_date('20-09-2023', 'dd-mm-yyyy'), to_date('03-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (214, 'Stronghold', to_date('04-02-2024', 'dd-mm-yyyy'), to_date('17-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (215, 'Domainer', to_date('19-10-2023', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (216, 'Stim', to_date('30-05-2023', 'dd-mm-yyyy'), to_date('08-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (217, 'Redhold', to_date('02-07-2023', 'dd-mm-yyyy'), to_date('03-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (218, 'Duobam', to_date('17-02-2024', 'dd-mm-yyyy'), to_date('26-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (219, 'Bitchip', to_date('26-07-2023', 'dd-mm-yyyy'), to_date('11-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (220, 'Job', to_date('31-08-2023', 'dd-mm-yyyy'), to_date('16-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (221, 'Y-find', to_date('12-04-2024', 'dd-mm-yyyy'), to_date('01-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (222, 'Quo Lux', to_date('08-06-2023', 'dd-mm-yyyy'), to_date('29-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (223, 'Solarbreeze', to_date('22-07-2023', 'dd-mm-yyyy'), to_date('13-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (224, 'Y-find', to_date('26-06-2023', 'dd-mm-yyyy'), to_date('01-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (225, 'Bigtax', to_date('21-08-2023', 'dd-mm-yyyy'), to_date('18-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (226, 'Ventosanzap', to_date('25-12-2023', 'dd-mm-yyyy'), to_date('02-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (227, 'Alphazap', to_date('29-08-2023', 'dd-mm-yyyy'), to_date('27-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (228, 'Zontrax', to_date('25-06-2023', 'dd-mm-yyyy'), to_date('27-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (229, 'Cardguard', to_date('05-08-2023', 'dd-mm-yyyy'), to_date('25-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (230, 'Y-find', to_date('29-03-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (231, 'Asoka', to_date('04-03-2024', 'dd-mm-yyyy'), to_date('19-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (232, 'Holdlamis', to_date('01-01-2024', 'dd-mm-yyyy'), to_date('17-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (233, 'Asoka', to_date('06-08-2023', 'dd-mm-yyyy'), to_date('29-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (234, 'Trippledex', to_date('11-07-2023', 'dd-mm-yyyy'), to_date('28-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (235, 'Zoolab', to_date('10-08-2023', 'dd-mm-yyyy'), to_date('29-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (236, 'Keylex', to_date('29-07-2023', 'dd-mm-yyyy'), to_date('17-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (237, 'Wrapsafe', to_date('28-10-2023', 'dd-mm-yyyy'), to_date('17-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (238, 'Bitchip', to_date('12-02-2024', 'dd-mm-yyyy'), to_date('11-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (239, 'Biodex', to_date('24-06-2023', 'dd-mm-yyyy'), to_date('14-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (240, 'Latlux', to_date('25-03-2024', 'dd-mm-yyyy'), to_date('13-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (241, 'Keylex', to_date('29-01-2024', 'dd-mm-yyyy'), to_date('13-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (242, 'Solarbreeze', to_date('21-12-2023', 'dd-mm-yyyy'), to_date('01-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (243, 'Ventosanzap', to_date('08-07-2023', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (244, 'Veribet', to_date('27-09-2023', 'dd-mm-yyyy'), to_date('18-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (245, 'Fixflex', to_date('11-07-2023', 'dd-mm-yyyy'), to_date('04-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (246, 'Opela', to_date('16-07-2023', 'dd-mm-yyyy'), to_date('28-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (247, 'Bytecard', to_date('29-12-2023', 'dd-mm-yyyy'), to_date('01-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (248, 'Kanlam', to_date('29-07-2023', 'dd-mm-yyyy'), to_date('02-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (249, 'Solarbreeze', to_date('18-12-2023', 'dd-mm-yyyy'), to_date('05-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (250, 'Alpha', to_date('23-02-2024', 'dd-mm-yyyy'), to_date('02-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (251, 'Cardguard', to_date('11-03-2024', 'dd-mm-yyyy'), to_date('27-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (252, 'Duobam', to_date('09-10-2023', 'dd-mm-yyyy'), to_date('17-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (253, 'Asoka', to_date('18-07-2023', 'dd-mm-yyyy'), to_date('09-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (254, 'Tempsoft', to_date('15-04-2024', 'dd-mm-yyyy'), to_date('21-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (255, 'Fix San', to_date('07-01-2024', 'dd-mm-yyyy'), to_date('10-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (256, 'Overhold', to_date('26-12-2023', 'dd-mm-yyyy'), to_date('19-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (257, 'Hatity', to_date('08-03-2024', 'dd-mm-yyyy'), to_date('09-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (258, 'Asoka', to_date('02-07-2023', 'dd-mm-yyyy'), to_date('04-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (259, 'Keylex', to_date('29-04-2024', 'dd-mm-yyyy'), to_date('31-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (260, 'Greenlam', to_date('17-02-2024', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (261, 'Job', to_date('26-07-2023', 'dd-mm-yyyy'), to_date('30-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (262, 'Rank', to_date('27-10-2023', 'dd-mm-yyyy'), to_date('29-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (263, 'Zontrax', to_date('18-07-2023', 'dd-mm-yyyy'), to_date('11-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (264, 'Domainer', to_date('11-01-2024', 'dd-mm-yyyy'), to_date('25-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (265, 'Flexidy', to_date('15-07-2023', 'dd-mm-yyyy'), to_date('28-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (266, 'Span', to_date('09-09-2023', 'dd-mm-yyyy'), to_date('16-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (267, 'Wrapsafe', to_date('14-10-2023', 'dd-mm-yyyy'), to_date('11-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (268, 'Zamit', to_date('27-11-2023', 'dd-mm-yyyy'), to_date('24-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (269, 'Duobam', to_date('23-03-2024', 'dd-mm-yyyy'), to_date('19-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (270, 'Regrant', to_date('08-03-2024', 'dd-mm-yyyy'), to_date('10-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (271, 'Sonsing', to_date('16-08-2023', 'dd-mm-yyyy'), to_date('19-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (272, 'Zontrax', to_date('30-11-2023', 'dd-mm-yyyy'), to_date('19-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (273, 'Flexidy', to_date('06-07-2023', 'dd-mm-yyyy'), to_date('07-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (274, 'Bitchip', to_date('17-11-2023', 'dd-mm-yyyy'), to_date('22-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (275, 'Andalax', to_date('16-02-2024', 'dd-mm-yyyy'), to_date('07-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (276, 'Lotlux', to_date('13-03-2024', 'dd-mm-yyyy'), to_date('13-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (277, 'Tres-Zap', to_date('29-03-2024', 'dd-mm-yyyy'), to_date('04-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (278, 'Home Ing', to_date('30-04-2024', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (279, 'Namfix', to_date('15-02-2024', 'dd-mm-yyyy'), to_date('23-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (280, 'Hatity', to_date('26-03-2024', 'dd-mm-yyyy'), to_date('29-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (281, 'Cookley', to_date('17-02-2024', 'dd-mm-yyyy'), to_date('26-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (282, 'Voyatouch', to_date('16-12-2023', 'dd-mm-yyyy'), to_date('25-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (283, 'Voyatouch', to_date('08-10-2023', 'dd-mm-yyyy'), to_date('22-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (284, 'Otcom', to_date('03-04-2024', 'dd-mm-yyyy'), to_date('26-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (285, 'Zamit', to_date('02-05-2024', 'dd-mm-yyyy'), to_date('14-11-2023', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (286, 'Toughjoyfax', to_date('27-03-2024', 'dd-mm-yyyy'), to_date('09-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (287, 'It', to_date('09-02-2024', 'dd-mm-yyyy'), to_date('26-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (288, 'Bigtax', to_date('11-02-2024', 'dd-mm-yyyy'), to_date('16-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (289, 'Zoolab', to_date('11-04-2024', 'dd-mm-yyyy'), to_date('29-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (290, 'Zoolab', to_date('15-04-2024', 'dd-mm-yyyy'), to_date('06-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (291, 'Cardify', to_date('19-01-2024', 'dd-mm-yyyy'), to_date('31-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (292, 'Subin', to_date('25-12-2023', 'dd-mm-yyyy'), to_date('10-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (293, 'Subin', to_date('20-09-2023', 'dd-mm-yyyy'), to_date('02-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (294, 'Redhold', to_date('04-08-2023', 'dd-mm-yyyy'), to_date('07-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (295, 'Holdlamis', to_date('03-06-2023', 'dd-mm-yyyy'), to_date('30-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (296, 'Zamit', to_date('15-11-2023', 'dd-mm-yyyy'), to_date('23-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (297, 'Lotlux', to_date('24-04-2024', 'dd-mm-yyyy'), to_date('03-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (298, 'Greenlam', to_date('02-01-2024', 'dd-mm-yyyy'), to_date('23-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (299, 'Stim', to_date('25-09-2023', 'dd-mm-yyyy'), to_date('16-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (300, 'Stronghold', to_date('10-12-2023', 'dd-mm-yyyy'), to_date('29-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (301, 'Overhold', to_date('04-04-2024', 'dd-mm-yyyy'), to_date('25-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (302, 'Biodex', to_date('14-09-2023', 'dd-mm-yyyy'), to_date('11-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (303, 'Konklab', to_date('20-09-2023', 'dd-mm-yyyy'), to_date('10-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (304, 'Quo Lux', to_date('14-05-2024', 'dd-mm-yyyy'), to_date('22-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (305, 'Span', to_date('04-03-2024', 'dd-mm-yyyy'), to_date('27-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (306, 'Fix San', to_date('31-03-2024', 'dd-mm-yyyy'), to_date('06-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (307, 'Vagram', to_date('27-05-2023', 'dd-mm-yyyy'), to_date('07-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (308, 'Prodder', to_date('04-12-2023', 'dd-mm-yyyy'), to_date('09-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (309, 'Stim', to_date('27-07-2023', 'dd-mm-yyyy'), to_date('10-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (310, 'Alphazap', to_date('17-09-2023', 'dd-mm-yyyy'), to_date('25-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (311, 'Subin', to_date('09-02-2024', 'dd-mm-yyyy'), to_date('18-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (312, 'Duobam', to_date('22-10-2023', 'dd-mm-yyyy'), to_date('08-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (313, 'Solarbreeze', to_date('30-04-2024', 'dd-mm-yyyy'), to_date('22-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (314, 'Sonair', to_date('28-02-2024', 'dd-mm-yyyy'), to_date('08-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (315, 'Voyatouch', to_date('20-11-2023', 'dd-mm-yyyy'), to_date('14-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (316, 'Y-find', to_date('17-05-2024', 'dd-mm-yyyy'), to_date('06-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (317, 'Job', to_date('21-09-2023', 'dd-mm-yyyy'), to_date('24-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (318, 'Job', to_date('20-11-2023', 'dd-mm-yyyy'), to_date('15-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (319, 'Overhold', to_date('13-01-2024', 'dd-mm-yyyy'), to_date('30-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (320, 'Otcom', to_date('26-07-2023', 'dd-mm-yyyy'), to_date('09-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (321, 'Solarbreeze', to_date('06-10-2023', 'dd-mm-yyyy'), to_date('28-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (322, 'It', to_date('26-04-2024', 'dd-mm-yyyy'), to_date('10-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (323, 'Toughjoyfax', to_date('22-01-2024', 'dd-mm-yyyy'), to_date('17-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (324, 'Bamity', to_date('05-11-2023', 'dd-mm-yyyy'), to_date('05-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (325, 'Bigtax', to_date('06-06-2023', 'dd-mm-yyyy'), to_date('08-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (326, 'Subin', to_date('31-03-2024', 'dd-mm-yyyy'), to_date('18-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (327, 'Ronstring', to_date('10-12-2023', 'dd-mm-yyyy'), to_date('04-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (328, 'Trippledex', to_date('11-08-2023', 'dd-mm-yyyy'), to_date('27-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (329, 'Duobam', to_date('16-05-2024', 'dd-mm-yyyy'), to_date('02-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (330, 'Ventosanzap', to_date('06-05-2024', 'dd-mm-yyyy'), to_date('24-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (331, 'Quo Lux', to_date('15-02-2024', 'dd-mm-yyyy'), to_date('18-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (332, 'Holdlamis', to_date('08-11-2023', 'dd-mm-yyyy'), to_date('02-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (333, 'Daltfresh', to_date('03-08-2023', 'dd-mm-yyyy'), to_date('09-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (334, 'Temp', to_date('28-04-2024', 'dd-mm-yyyy'), to_date('25-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (335, 'Daltfresh', to_date('02-03-2024', 'dd-mm-yyyy'), to_date('06-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (336, 'Bigtax', to_date('07-02-2024', 'dd-mm-yyyy'), to_date('15-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (337, 'Duobam', to_date('31-05-2023', 'dd-mm-yyyy'), to_date('17-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (338, 'Subin', to_date('05-05-2024', 'dd-mm-yyyy'), to_date('04-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (339, 'Fintone', to_date('11-05-2024', 'dd-mm-yyyy'), to_date('09-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (340, 'Daltfresh', to_date('20-07-2023', 'dd-mm-yyyy'), to_date('26-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (341, 'Aerified', to_date('07-09-2023', 'dd-mm-yyyy'), to_date('22-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (342, 'Lotlux', to_date('04-10-2023', 'dd-mm-yyyy'), to_date('30-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (343, 'Konklux', to_date('09-03-2024', 'dd-mm-yyyy'), to_date('30-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (344, 'Asoka', to_date('20-06-2023', 'dd-mm-yyyy'), to_date('26-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (345, 'Tres-Zap', to_date('01-07-2023', 'dd-mm-yyyy'), to_date('10-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (346, 'Cookley', to_date('10-05-2024', 'dd-mm-yyyy'), to_date('15-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (347, 'Gembucket', to_date('22-05-2023', 'dd-mm-yyyy'), to_date('25-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (348, 'Otcom', to_date('29-11-2023', 'dd-mm-yyyy'), to_date('04-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (349, 'Namfix', to_date('29-03-2024', 'dd-mm-yyyy'), to_date('21-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (350, 'Lotlux', to_date('15-12-2023', 'dd-mm-yyyy'), to_date('25-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (351, 'Konklab', to_date('27-07-2023', 'dd-mm-yyyy'), to_date('23-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (352, 'Sub-Ex', to_date('14-05-2024', 'dd-mm-yyyy'), to_date('23-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (353, 'Voltsillam', to_date('17-10-2023', 'dd-mm-yyyy'), to_date('21-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (354, 'Sonsing', to_date('21-06-2023', 'dd-mm-yyyy'), to_date('17-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (355, 'Zontrax', to_date('20-03-2024', 'dd-mm-yyyy'), to_date('18-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (356, 'Toughjoyfax', to_date('04-09-2023', 'dd-mm-yyyy'), to_date('09-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (357, 'Treeflex', to_date('29-01-2024', 'dd-mm-yyyy'), to_date('19-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (358, 'It', to_date('04-11-2023', 'dd-mm-yyyy'), to_date('10-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (359, 'Keylex', to_date('24-01-2024', 'dd-mm-yyyy'), to_date('10-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (360, 'Bitchip', to_date('01-04-2024', 'dd-mm-yyyy'), to_date('23-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (361, 'Ventosanzap', to_date('29-12-2023', 'dd-mm-yyyy'), to_date('20-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (362, 'Trippledex', to_date('10-02-2024', 'dd-mm-yyyy'), to_date('13-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (363, 'Tres-Zap', to_date('18-07-2023', 'dd-mm-yyyy'), to_date('26-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (364, 'Treeflex', to_date('04-02-2024', 'dd-mm-yyyy'), to_date('04-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (365, 'Veribet', to_date('22-03-2024', 'dd-mm-yyyy'), to_date('22-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (366, 'Stronghold', to_date('26-02-2024', 'dd-mm-yyyy'), to_date('09-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (367, 'Flowdesk', to_date('25-06-2023', 'dd-mm-yyyy'), to_date('10-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (368, 'Bitchip', to_date('15-12-2023', 'dd-mm-yyyy'), to_date('17-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (369, 'Flowdesk', to_date('27-09-2023', 'dd-mm-yyyy'), to_date('14-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (370, 'Domainer', to_date('27-07-2023', 'dd-mm-yyyy'), to_date('19-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (371, 'Cardify', to_date('26-02-2024', 'dd-mm-yyyy'), to_date('06-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (372, 'Rank', to_date('06-05-2024', 'dd-mm-yyyy'), to_date('10-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (373, 'Redhold', to_date('19-05-2024', 'dd-mm-yyyy'), to_date('31-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (374, 'Otcom', to_date('05-12-2023', 'dd-mm-yyyy'), to_date('30-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (375, 'Toughjoyfax', to_date('06-08-2023', 'dd-mm-yyyy'), to_date('02-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (376, 'Andalax', to_date('11-06-2023', 'dd-mm-yyyy'), to_date('21-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (377, 'Hatity', to_date('29-09-2023', 'dd-mm-yyyy'), to_date('20-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (378, 'Flexidy', to_date('29-10-2023', 'dd-mm-yyyy'), to_date('13-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (379, 'Cardify', to_date('05-07-2023', 'dd-mm-yyyy'), to_date('18-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (380, 'Zamit', to_date('07-12-2023', 'dd-mm-yyyy'), to_date('09-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (381, 'Lotlux', to_date('30-08-2023', 'dd-mm-yyyy'), to_date('31-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (382, 'Fix San', to_date('13-09-2023', 'dd-mm-yyyy'), to_date('09-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (383, 'Hatity', to_date('23-04-2024', 'dd-mm-yyyy'), to_date('26-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (384, 'Rank', to_date('09-12-2023', 'dd-mm-yyyy'), to_date('07-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (385, 'Sonsing', to_date('13-08-2023', 'dd-mm-yyyy'), to_date('03-03-2024', 'dd-mm-yyyy'));
commit;
prompt 500 records committed...
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (386, 'Duobam', to_date('29-08-2023', 'dd-mm-yyyy'), to_date('16-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (387, 'Quo Lux', to_date('11-02-2024', 'dd-mm-yyyy'), to_date('21-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (388, 'Asoka', to_date('05-04-2024', 'dd-mm-yyyy'), to_date('08-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (389, 'Biodex', to_date('05-12-2023', 'dd-mm-yyyy'), to_date('10-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (390, 'Wrapsafe', to_date('03-11-2023', 'dd-mm-yyyy'), to_date('29-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (391, 'Alpha', to_date('03-11-2023', 'dd-mm-yyyy'), to_date('27-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (392, 'Konklux', to_date('25-08-2023', 'dd-mm-yyyy'), to_date('26-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (393, 'Namfix', to_date('14-10-2023', 'dd-mm-yyyy'), to_date('24-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (394, 'Stringtough', to_date('09-06-2023', 'dd-mm-yyyy'), to_date('03-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (395, 'Wrapsafe', to_date('15-09-2023', 'dd-mm-yyyy'), to_date('01-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (396, 'Cookley', to_date('09-05-2024', 'dd-mm-yyyy'), to_date('16-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (397, 'Overhold', to_date('29-11-2023', 'dd-mm-yyyy'), to_date('10-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (398, 'Prodder', to_date('20-02-2024', 'dd-mm-yyyy'), to_date('19-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (399, 'Andalax', to_date('25-02-2024', 'dd-mm-yyyy'), to_date('03-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (400, 'Trippledex', to_date('19-01-2024', 'dd-mm-yyyy'), to_date('18-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (401, 'Subin', to_date('30-07-2023', 'dd-mm-yyyy'), to_date('14-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (402, 'Alpha', to_date('03-12-2023', 'dd-mm-yyyy'), to_date('27-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (403, 'Y-find', to_date('31-07-2023', 'dd-mm-yyyy'), to_date('14-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (404, 'Duobam', to_date('12-12-2023', 'dd-mm-yyyy'), to_date('15-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (405, 'Stronghold', to_date('27-08-2023', 'dd-mm-yyyy'), to_date('01-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (406, 'Lotlux', to_date('29-07-2023', 'dd-mm-yyyy'), to_date('30-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (407, 'Stronghold', to_date('04-05-2024', 'dd-mm-yyyy'), to_date('09-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (408, 'Trippledex', to_date('20-11-2023', 'dd-mm-yyyy'), to_date('19-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (409, 'Transcof', to_date('31-05-2023', 'dd-mm-yyyy'), to_date('12-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (410, 'Aerified', to_date('29-11-2023', 'dd-mm-yyyy'), to_date('08-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (411, 'Matsoft', to_date('15-12-2023', 'dd-mm-yyyy'), to_date('31-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (412, 'Lotlux', to_date('13-02-2024', 'dd-mm-yyyy'), to_date('14-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (413, 'Tres-Zap', to_date('04-02-2024', 'dd-mm-yyyy'), to_date('06-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (414, 'Lotlux', to_date('25-06-2023', 'dd-mm-yyyy'), to_date('27-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (415, 'Tres-Zap', to_date('02-11-2023', 'dd-mm-yyyy'), to_date('26-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (416, 'Tresom', to_date('06-09-2023', 'dd-mm-yyyy'), to_date('07-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (417, 'Stim', to_date('27-11-2023', 'dd-mm-yyyy'), to_date('23-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (418, 'Y-find', to_date('11-05-2024', 'dd-mm-yyyy'), to_date('29-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (419, 'Sub-Ex', to_date('21-06-2023', 'dd-mm-yyyy'), to_date('22-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (420, 'Kanlam', to_date('15-11-2023', 'dd-mm-yyyy'), to_date('03-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (421, 'Gembucket', to_date('30-05-2023', 'dd-mm-yyyy'), to_date('24-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (422, 'Ventosanzap', to_date('08-11-2023', 'dd-mm-yyyy'), to_date('12-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (423, 'Konklux', to_date('05-11-2023', 'dd-mm-yyyy'), to_date('18-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (424, 'Prodder', to_date('09-05-2024', 'dd-mm-yyyy'), to_date('20-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (425, 'Quo Lux', to_date('08-09-2023', 'dd-mm-yyyy'), to_date('30-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (426, 'Opela', to_date('07-08-2023', 'dd-mm-yyyy'), to_date('29-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (427, 'Tin', to_date('02-11-2023', 'dd-mm-yyyy'), to_date('04-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (428, 'Opela', to_date('15-10-2023', 'dd-mm-yyyy'), to_date('06-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (429, 'Bamity', to_date('08-07-2023', 'dd-mm-yyyy'), to_date('05-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (430, 'Flowdesk', to_date('12-03-2024', 'dd-mm-yyyy'), to_date('07-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (431, 'Bitwolf', to_date('13-12-2023', 'dd-mm-yyyy'), to_date('23-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (432, 'Latlux', to_date('18-09-2023', 'dd-mm-yyyy'), to_date('25-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (433, 'Zoolab', to_date('04-04-2024', 'dd-mm-yyyy'), to_date('13-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (434, 'Duobam', to_date('23-11-2023', 'dd-mm-yyyy'), to_date('03-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (435, 'Y-find', to_date('20-07-2023', 'dd-mm-yyyy'), to_date('16-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (436, 'Veribet', to_date('23-04-2024', 'dd-mm-yyyy'), to_date('28-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (437, 'Subin', to_date('01-07-2023', 'dd-mm-yyyy'), to_date('05-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (438, 'Bigtax', to_date('09-08-2023', 'dd-mm-yyyy'), to_date('29-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (439, 'Alpha', to_date('27-01-2024', 'dd-mm-yyyy'), to_date('25-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (440, 'Alpha', to_date('20-07-2023', 'dd-mm-yyyy'), to_date('19-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (441, 'Zamit', to_date('09-11-2023', 'dd-mm-yyyy'), to_date('03-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (442, 'Span', to_date('15-01-2024', 'dd-mm-yyyy'), to_date('30-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (443, 'Wrapsafe', to_date('22-12-2023', 'dd-mm-yyyy'), to_date('29-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (444, 'Overhold', to_date('12-01-2024', 'dd-mm-yyyy'), to_date('25-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (445, 'Vagram', to_date('26-06-2023', 'dd-mm-yyyy'), to_date('30-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (446, 'Quo Lux', to_date('17-08-2023', 'dd-mm-yyyy'), to_date('20-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (447, 'Sonsing', to_date('18-06-2023', 'dd-mm-yyyy'), to_date('16-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (448, 'Lotlux', to_date('18-05-2024', 'dd-mm-yyyy'), to_date('19-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (449, 'Temp', to_date('13-12-2023', 'dd-mm-yyyy'), to_date('26-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (450, 'Transcof', to_date('11-12-2023', 'dd-mm-yyyy'), to_date('06-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (451, 'Quo Lux', to_date('12-08-2023', 'dd-mm-yyyy'), to_date('30-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (452, 'Zaam-Dox', to_date('14-06-2023', 'dd-mm-yyyy'), to_date('28-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (453, 'Quo Lux', to_date('05-01-2024', 'dd-mm-yyyy'), to_date('06-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (454, 'Lotstring', to_date('01-07-2023', 'dd-mm-yyyy'), to_date('09-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (455, 'Ventosanzap', to_date('08-03-2024', 'dd-mm-yyyy'), to_date('22-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (456, 'Daltfresh', to_date('19-09-2023', 'dd-mm-yyyy'), to_date('05-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (457, 'Duobam', to_date('29-05-2023', 'dd-mm-yyyy'), to_date('22-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (458, 'Span', to_date('30-03-2024', 'dd-mm-yyyy'), to_date('18-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (459, 'Zoolab', to_date('15-04-2024', 'dd-mm-yyyy'), to_date('30-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (460, 'Bitchip', to_date('20-02-2024', 'dd-mm-yyyy'), to_date('21-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (461, 'Ventosanzap', to_date('18-01-2024', 'dd-mm-yyyy'), to_date('19-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (462, 'Aerified', to_date('18-02-2024', 'dd-mm-yyyy'), to_date('07-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (463, 'Tresom', to_date('28-06-2023', 'dd-mm-yyyy'), to_date('06-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (464, 'Duobam', to_date('29-06-2023', 'dd-mm-yyyy'), to_date('27-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (465, 'Stringtough', to_date('30-09-2023', 'dd-mm-yyyy'), to_date('02-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (466, 'Gembucket', to_date('08-02-2024', 'dd-mm-yyyy'), to_date('09-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (467, 'It', to_date('18-02-2024', 'dd-mm-yyyy'), to_date('16-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (468, 'Zoolab', to_date('10-08-2023', 'dd-mm-yyyy'), to_date('31-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (469, 'Bytecard', to_date('20-04-2024', 'dd-mm-yyyy'), to_date('10-12-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (470, 'Holdlamis', to_date('29-07-2023', 'dd-mm-yyyy'), to_date('02-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (471, 'Daltfresh', to_date('22-01-2024', 'dd-mm-yyyy'), to_date('15-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (472, 'Bitwolf', to_date('05-06-2023', 'dd-mm-yyyy'), to_date('24-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (473, 'Zaam-Dox', to_date('23-02-2024', 'dd-mm-yyyy'), to_date('08-10-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (474, 'Tres-Zap', to_date('24-10-2023', 'dd-mm-yyyy'), to_date('16-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (475, 'Fixflex', to_date('19-02-2024', 'dd-mm-yyyy'), to_date('22-11-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (476, 'Alpha', to_date('05-11-2023', 'dd-mm-yyyy'), to_date('22-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (477, 'Flowdesk', to_date('12-01-2024', 'dd-mm-yyyy'), to_date('30-07-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (478, 'Bigtax', to_date('25-07-2023', 'dd-mm-yyyy'), to_date('18-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (479, 'Zathin', to_date('17-04-2024', 'dd-mm-yyyy'), to_date('24-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (480, 'Flowdesk', to_date('18-08-2023', 'dd-mm-yyyy'), to_date('07-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (481, 'Span', to_date('13-08-2023', 'dd-mm-yyyy'), to_date('03-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (482, 'Tempsoft', to_date('26-11-2023', 'dd-mm-yyyy'), to_date('23-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (483, 'It', to_date('26-08-2023', 'dd-mm-yyyy'), to_date('03-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (484, 'Namfix', to_date('09-03-2024', 'dd-mm-yyyy'), to_date('25-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (485, 'Tin', to_date('27-01-2024', 'dd-mm-yyyy'), to_date('03-07-2023', 'dd-mm-yyyy'));
commit;
prompt 600 records committed...
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (486, 'Namfix', to_date('16-07-2023', 'dd-mm-yyyy'), to_date('26-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (487, 'Konklux', to_date('18-10-2023', 'dd-mm-yyyy'), to_date('23-08-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (488, 'Redhold', to_date('15-04-2024', 'dd-mm-yyyy'), to_date('14-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (489, 'Hatity', to_date('15-01-2024', 'dd-mm-yyyy'), to_date('27-02-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (490, 'Y-Solowarm', to_date('20-05-2024', 'dd-mm-yyyy'), to_date('25-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (491, 'Sub-Ex', to_date('28-05-2023', 'dd-mm-yyyy'), to_date('17-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (492, 'Quo Lux', to_date('08-07-2023', 'dd-mm-yyyy'), to_date('21-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (493, 'Wrapsafe', to_date('15-03-2024', 'dd-mm-yyyy'), to_date('08-09-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (494, 'Regrant', to_date('11-06-2023', 'dd-mm-yyyy'), to_date('12-05-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (495, 'Temp', to_date('21-11-2023', 'dd-mm-yyyy'), to_date('28-05-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (496, 'Lotlux', to_date('21-11-2023', 'dd-mm-yyyy'), to_date('06-01-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (497, 'Bigtax', to_date('19-10-2023', 'dd-mm-yyyy'), to_date('24-04-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (498, 'Tresom', to_date('22-10-2023', 'dd-mm-yyyy'), to_date('30-06-2023', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (499, 'Vagram', to_date('30-06-2023', 'dd-mm-yyyy'), to_date('26-03-2024', 'dd-mm-yyyy'));
insert into PROJECTS (project_id, project_name, start_date, end_date)
values (500, 'Y-Solowarm', to_date('14-01-2024', 'dd-mm-yyyy'), to_date('09-03-2024', 'dd-mm-yyyy'));
commit;
prompt 615 records loaded
prompt Loading ENGINEERS...
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (18907, 'Vendetta', 'Gooding', 'GNC', 6222, to_date('19-05-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (38250, 'Jeroen', 'Davies', 'Materials', 1860, to_date('15-12-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (54536, 'Night', 'England', 'Avionics', 7118, to_date('13-09-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (22750, 'Brooke', 'Nakai', 'Integration', 6741, to_date('27-02-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (48723, 'Robbie', 'Crewson', 'Aerodynamics', 1069, to_date('05-09-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (91090, 'Joaquim', 'Wagner', 'Mission Planning', 2010, to_date('11-12-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (15151, 'Terence', 'Tillis', 'GNC', 7463, to_date('29-12-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (53761, 'Raul', 'Chesnutt', 'Mission Planning', 5667, to_date('14-01-2020', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (89683, 'Lily', 'Houston', 'Structures', 2623, to_date('03-01-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (74414, 'Hex', 'Weiland', 'Orbital Mechanics', 2907, to_date('01-06-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (28752, 'Chet', 'Barry', 'Avionics', 8225, to_date('25-01-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (20876, 'Franco', 'Sewell', 'Operations', 2959, to_date('16-12-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (15050, 'Darius', 'Spiner', 'Systems', 6741, to_date('14-04-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (80951, 'Jessica', 'Turturro', 'Materials', 7344, to_date('01-12-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (60769, 'Chris', 'Horton', 'Mission Planning', 6024, to_date('27-12-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (56510, 'Mitchell', 'Ponty', 'Safety', 5584, to_date('10-12-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (14115, 'Jann', 'Heatherly', 'Structures', 1045, to_date('29-07-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (99433, 'Albert', 'Detmer', 'Thermal', 1931, to_date('14-09-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (28239, 'Emilio', 'Anderson', 'Thermal', 9361, to_date('02-07-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (82789, 'Mac', 'Johansson', 'Orbital Mechanics', 7176, to_date('01-10-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (52223, 'Chi', 'Tyler', 'Integration', 2959, to_date('18-05-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (65397, 'Lionel', 'Bacon', 'Orbital Mechanics', 6222, to_date('30-09-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (45690, 'Gwyneth', 'Tambor', 'Thermal', 1562, to_date('20-05-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (18593, 'Sharon', 'Bailey', 'Safety', 2907, to_date('02-11-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (45377, 'Mark', 'McClinton', 'Software', 8935, to_date('13-01-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (20087, 'Pablo', 'Moorer', 'Aerodynamics', 8968, to_date('13-05-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (45669, 'Cameron', 'Lindley', 'Operations', 5849, to_date('06-03-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (71962, 'Mili', 'Himmelman', 'Systems', 9716, to_date('22-03-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (18030, 'Bridgette', 'Gallagher', 'Mission Planning', 4120, to_date('09-08-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (23633, 'Michelle', 'Remar', 'Software', 5111, to_date('30-06-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (81435, 'Johnny', 'Dzundza', 'Orbital Mechanics', 1045, to_date('15-08-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (61995, 'Vanessa', 'Burns', 'GNC', 1562, to_date('29-04-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (33055, 'Fiona', 'Fogerty', 'Systems', 2623, to_date('30-11-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (88338, 'Fred', 'Kahn', 'Safety', 7176, to_date('29-12-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (76087, 'Gord', 'Mahood', 'Avionics', 6204, to_date('24-09-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (27886, 'Nora', 'Sellers', 'GNC', 1069, to_date('23-08-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (25473, 'Denzel', 'McDiarmid', 'Propulsion', 5111, to_date('20-12-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (51231, 'Geoffrey', 'Baldwin', 'Thermal', 1562, to_date('20-02-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (42884, 'Maura', 'Weir', 'Systems', 5527, to_date('19-05-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (70582, 'Madeleine', 'Reeve', 'Structures', 7176, to_date('02-08-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (95406, 'Pam', 'Griffin', 'Systems', 2605, to_date('08-10-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (25732, 'Angela', 'Studi', 'Integration', 5561, to_date('01-03-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (38455, 'Charlton', 'Blackwell', 'Structures', 7123, to_date('11-07-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (78163, 'Busta', 'Remar', 'Materials', 6189, to_date('24-10-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (38235, 'Katrin', 'Grant', 'Integration', 2623, to_date('17-12-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (24769, 'Jaime', 'Child', 'Structures', 5471, to_date('23-11-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (33133, 'Earl', 'Hagerty', 'Orbital Mechanics', 3980, to_date('09-09-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (98537, 'Paul', 'Cruz', 'Materials', 6264, to_date('12-10-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (62413, 'Debra', 'Blige', 'GNC', 4347, to_date('01-11-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (70199, 'Clive', 'McAnally', 'GNC', 4271, to_date('22-09-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (85132, 'Christopher', 'Kirshner', 'Software', 6989, to_date('25-04-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (75544, 'Peter', 'Boone', 'Aerodynamics', 4909, to_date('16-05-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (77924, 'Chris', 'Apple', 'Safety', 7204, to_date('19-08-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (55869, 'Balthazar', 'Rivers', 'Integration', 9361, to_date('27-07-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (57768, 'Taye', 'Keitel', 'Structures', 4722, to_date('28-01-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (27059, 'Karon', 'Sartain', 'Avionics', 6264, to_date('18-11-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (90838, 'Frances', 'Colon', 'Structures', 7926, to_date('20-03-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (94161, 'Andrae', 'Sorvino', 'Integration', 7842, to_date('22-06-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (31468, 'Thomas', 'Crowell', 'GNC', 4604, to_date('23-04-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (56193, 'Kiefer', 'Pryce', 'Aerodynamics', 1778, to_date('23-08-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (31944, 'Angie', 'Emmett', 'Aerodynamics', 1860, to_date('09-06-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (28371, 'Bruce', 'Himmelman', 'Aerodynamics', 4295, to_date('12-01-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (64767, 'Jude', 'Senior', 'Orbital Mechanics', 3384, to_date('31-01-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (59184, 'Nicolas', 'Hartnett', 'Thermal', 6476, to_date('31-01-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (69914, 'Nicky', 'Perrineau', 'Structures', 5620, to_date('27-11-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (55760, 'Ty', 'Tyson', 'Safety', 4604, to_date('13-11-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (51016, 'Hope', 'Rydell', 'Aerodynamics', 5026, to_date('17-08-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (96070, 'Gladys', 'Schock', 'Operations', 9361, to_date('30-01-2020', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (51992, 'Pablo', 'Todd', 'GNC', 7123, to_date('26-11-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (18622, 'Hazel', 'Crystal', 'Thermal', 1069, to_date('10-09-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (80030, 'Rich', 'Easton', 'Testing', 2151, to_date('04-02-2020', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (72737, 'Thora', 'McGregor', 'Safety', 5060, to_date('05-10-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (67646, 'Ceili', 'Wiest', 'Operations', 8935, to_date('17-08-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (73214, 'Junior', 'Midler', 'Avionics', 3375, to_date('28-10-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (26373, 'Udo', 'McGoohan', 'Aerodynamics', 9447, to_date('16-12-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (15445, 'Rachid', 'Love', 'Materials', 1069, to_date('03-04-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (13179, 'Kimberly', 'Johnson', 'Structures', 9623, to_date('12-02-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (68893, 'Carolyn', 'Vinton', 'Integration', 1778, to_date('03-02-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (78528, 'Harriet', 'Cherry', 'GNC', 8678, to_date('02-06-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (81406, 'Bonnie', 'Vaughan', 'Systems', 4407, to_date('19-12-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (17748, 'Tom', 'Neill', 'Software', 6189, to_date('11-06-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (32297, 'Meredith', 'Ferrer', 'Testing', 7995, to_date('25-07-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (75643, 'Marisa', 'Ammons', 'Safety', 9635, to_date('19-08-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (11535, 'Annette', 'Wayans', 'Orbital Mechanics', 8751, to_date('24-05-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (13775, 'Christine', 'Branagh', 'Systems', 6003, to_date('09-01-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (33925, 'Kathleen', 'Hughes', 'Materials', 7475, to_date('06-07-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (41085, 'Merrilee', 'Bachman', 'Integration', 5086, to_date('03-10-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (93939, 'Minnie', 'Nivola', 'Avionics', 5488, to_date('20-07-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (87203, 'Jean-Claude', 'Ronstadt', 'Software', 6204, to_date('25-03-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (76947, 'Aidan', 'Cox', 'Integration', 4538, to_date('09-07-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (94529, 'Marley', 'Fariq', 'Aerodynamics', 6222, to_date('12-12-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (59265, 'Trey', 'Knight', 'Integration', 3375, to_date('09-07-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (25582, 'Jeff', 'Khan', 'GNC', 4686, to_date('13-07-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (40598, 'Bo', 'Cusack', 'Integration', 7952, to_date('11-09-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (16776, 'Hugh', 'Boorem', 'Operations', 4372, to_date('10-12-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (91472, 'Isaiah', 'Kahn', 'GNC', 6989, to_date('08-10-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (14442, 'Derrick', 'Arthur', 'Propulsion', 4604, to_date('06-12-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (92995, 'Cliff', 'Vaughan', 'Systems', 9716, to_date('30-04-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (24048, 'Edgar', 'Stuermer', 'Software', 9642, to_date('24-10-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (60154, 'Tony', 'Elwes', 'Mission Planning', 1816, to_date('09-02-2018', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (44927, 'Larry', 'Place', 'Mission Planning', 4271, to_date('02-06-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (30720, 'Joy', 'Lunch', 'Systems', 5471, to_date('28-07-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (10955, 'Kyra', 'Van Helden', 'Safety', 9642, to_date('31-12-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (32975, 'Mel', 'Baez', 'Operations', 1816, to_date('15-07-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (28158, 'Dionne', 'Snow', 'Safety', 5060, to_date('21-08-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (75017, 'Brothers', 'Larter', 'Materials', 1879, to_date('03-11-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (33869, 'Carol', 'Hanley', 'GNC', 5026, to_date('27-09-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (19330, 'Benicio', 'Heron', 'Testing', 7343, to_date('04-05-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (24289, 'Garth', 'Gellar', 'Safety', 1135, to_date('31-01-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (96945, 'William', 'Peterson', 'Operations', 8968, to_date('06-02-2020', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (58910, 'Cyndi', 'Cleary', 'Aerodynamics', 1045, to_date('05-07-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (68826, 'Cate', 'Gold', 'Aerodynamics', 9015, to_date('26-02-2020', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (16736, 'Keith', 'Santa Rosa', 'Thermal', 1217, to_date('22-06-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (26321, 'Kyle', 'Holland', 'Materials', 5620, to_date('29-03-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (81279, 'Kyle', 'Ali', 'Integration', 1931, to_date('03-02-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (70662, 'Gran', 'Saucedo', 'Structures', 1562, to_date('20-11-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (34536, 'Dorry', 'Houston', 'Testing', 6929, to_date('03-02-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (81820, 'Geoff', 'Milsap', 'Materials', 1217, to_date('20-02-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (35137, 'Chi', 'Foley', 'Operations', 9716, to_date('25-04-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (62514, 'Lance', 'Schiff', 'Software', 7123, to_date('02-09-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (98311, 'Terrence', 'Stowe', 'Thermal', 7084, to_date('19-04-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (22048, 'Keanu', 'Epps', 'Thermal', 4686, to_date('15-03-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (15772, 'Illeana', 'Parker', 'Mission Planning', 5845, to_date('15-09-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (80023, 'Percy', 'Bullock', 'Integration', 5845, to_date('20-04-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (27805, 'Elijah', 'Ontiveros', 'Software', 6670, to_date('05-07-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (59951, 'Jena', 'Scheider', 'Aerodynamics', 9716, to_date('22-05-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (98246, 'Kim', 'Kershaw', 'Structures', 5849, to_date('30-06-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (40460, 'Gwyneth', 'Crewson', 'Software', 7995, to_date('10-10-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (71457, 'Michelle', 'Vince', 'Testing', 4120, to_date('24-03-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (75402, 'Val', 'Morales', 'Thermal', 2770, to_date('09-02-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (49267, 'Gino', 'McLachlan', 'GNC', 4251, to_date('10-10-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (86682, 'Maggie', 'Deschanel', 'Operations', 7176, to_date('06-12-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (10993, 'Jamie', 'McIntyre', 'Avionics', 2605, to_date('03-02-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (83295, 'Emerson', 'Moorer', 'Testing', 1567, to_date('28-05-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (61485, 'Rhea', 'Holeman', 'Operations', 3833, to_date('13-09-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (39965, 'Lea', 'Jeffreys', 'Aerodynamics', 4909, to_date('02-04-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (86488, 'Kelly', 'Collette', 'Operations', 7842, to_date('08-12-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (77010, 'Emma', 'Balaban', 'Safety', 1778, to_date('10-05-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (61942, 'Breckin', 'Jeffreys', 'Operations', 1816, to_date('29-01-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (52806, 'Scott', 'Serbedzija', 'Operations', 5086, to_date('26-05-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (89879, 'Fisher', 'Soul', 'Thermal', 3384, to_date('11-04-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (89578, 'Ritchie', 'Schwarzenegger', 'Propulsion', 5660, to_date('27-08-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (28892, 'Cheryl', 'Franks', 'Structures', 7842, to_date('30-09-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (75289, 'Lea', 'Delta', 'Integration', 6741, to_date('28-12-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (17396, 'Ahmad', 'Mraz', 'Testing', 6204, to_date('01-11-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (77397, 'Carlos', 'Orbit', 'Orbital Mechanics', 8935, to_date('06-09-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (83704, 'Eliza', 'Campbell', 'Operations', 7025, to_date('04-07-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (91108, 'Lloyd', 'Horizon', 'Systems', 5620, to_date('06-09-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (23873, 'Gil', 'Keener', 'Orbital Mechanics', 9270, to_date('11-12-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (63839, 'Suzanne', 'Harnes', 'Propulsion', 9635, to_date('27-08-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (47077, 'Darren', 'Baez', 'Aerodynamics', 7952, to_date('01-08-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (41845, 'Ani', 'Fonda', 'Propulsion', 7123, to_date('08-08-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (54412, 'Ed', 'Smurfit', 'Aerodynamics', 2971, to_date('23-12-2015', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (12595, 'Angela', 'Whitwam', 'Propulsion', 8968, to_date('03-08-2016', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (61277, 'Jeremy', 'Balaban', 'Systems', 2133, to_date('22-11-2017', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (90597, 'Dorry', 'Merchant', 'Propulsion', 1562, to_date('12-09-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (91381, 'Sara', 'Eckhart', 'Mission Planning', 9716, to_date('25-01-2019', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (93098, 'Jaime', 'Santa Rosa', 'Software', 6189, to_date('05-03-2018', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (1, 'John', 'Doe', 'Software', 1, to_date('01-01-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (301, 'John', 'Doe', 'Electrical', 101, to_date('01-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (302, 'Jane', 'Smith', 'Mechanical', 102, to_date('01-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (303, 'Michael', 'Johnson', 'Civil', 103, to_date('01-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (304, 'Emily', 'Brown', 'Software', 104, to_date('01-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (305, 'David', 'Martinez', 'Electrical', 105, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (306, 'Sophia', 'Garcia', 'Mechanical', 106, to_date('01-06-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (307, 'James', 'Brown', 'Civil', 107, to_date('01-07-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (308, 'Olivia', 'Martinez', 'Software', 108, to_date('01-08-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (309, 'William', 'Lopez', 'Electrical', 109, to_date('01-09-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (310, 'Emma', 'Hernandez', 'Mechanical', 110, to_date('01-10-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (311, 'Daniel', 'Gonzalez', 'Civil', 111, to_date('01-11-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (312, 'Ava', 'Wilson', 'Software', 112, to_date('01-12-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (313, 'Matthew', 'Anderson', 'Electrical', 113, to_date('01-01-2025', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (314, 'Ella', 'Taylor', 'Mechanical', 114, to_date('01-02-2025', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (315, 'Jacob', 'Thomas', 'Civil', 115, to_date('01-03-2025', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (316, 'Sofia', 'Hernandez', 'Software', 116, to_date('01-04-2025', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (317, 'Alexander', 'Walker', 'Electrical', 117, to_date('01-05-2025', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (318, 'Madison', 'King', 'Mechanical', 118, to_date('01-06-2025', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (319, 'Liam', 'Perez', 'Civil', 119, to_date('01-07-2025', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (320, 'Chloe', 'Lee', 'Software', 120, to_date('01-08-2025', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (321, 'Benjamin', 'Scott', 'Electrical', 121, to_date('01-09-2025', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (322, 'Hailey', 'Green', 'Mechanical', 122, to_date('01-10-2025', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (323, 'Mason', 'Adams', 'Civil', 123, to_date('01-11-2025', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (324, 'Amelia', 'Baker', 'Software', 124, to_date('01-12-2025', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (325, 'Logan', 'Rivera', 'Electrical', 125, to_date('01-01-2026', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (326, 'Grace', 'Gonzalez', 'Mechanical', 126, to_date('01-02-2026', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (327, 'Elijah', 'Harris', 'Civil', 127, to_date('01-03-2026', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (328, 'Avery', 'Clark', 'Software', 128, to_date('01-04-2026', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (2, 'Erasmus', 'Brunelli', 'magic tricks', 2, to_date('30-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (3, 'Nonna', 'Curgenven', 'medieval history', 3, to_date('17-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (4, 'Filide', 'Tipton', 'vintage cars', 4, to_date('24-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (5, 'Gregoor', 'Margett', 'vintage cars', 5, to_date('20-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (6, 'Alika', 'Schout', 'extreme sports', 6, to_date('05-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (7, 'Tyson', 'Geal', 'magic tricks', 7, to_date('15-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (8, 'Retha', 'Whewell', 'magic tricks', 8, to_date('26-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (9, 'Aime', 'Havoc', 'cryptozoology', 9, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (10, 'Cordy', 'Gillan', 'medieval history', 10, to_date('30-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (11, 'Danyette', 'Redsell', 'fashion design', 11, to_date('30-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (12, 'Diego', 'Townson', 'space exploration', 12, to_date('12-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (13, 'Noel', 'Marginson', 'urban gardening', 13, to_date('19-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (14, 'Ford', 'Fitt', 'cryptozoology', 14, to_date('12-12-2023', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (15, 'Gaultiero', 'Lethieulier', 'fashion design', 15, to_date('28-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (16, 'Dannie', 'Aizkovitch', 'cryptozoology', 16, to_date('24-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (17, 'Palmer', 'Bayman', 'extreme sports', 17, to_date('12-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (18, 'Haskell', 'Cayton', 'fashion design', 18, to_date('29-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (19, 'Annamarie', 'Blancowe', 'medieval history', 19, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (20, 'Jobie', 'Owbrick', 'extreme sports', 20, to_date('20-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (21, 'Kass', 'Ockenden', 'space exploration', 21, to_date('14-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (22, 'Avrit', 'Churn', 'robotics', 22, to_date('29-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (23, 'Garald', 'Weald', 'magic tricks', 23, to_date('27-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (24, 'Vachel', 'Scrivinor', 'urban gardening', 24, to_date('22-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (25, 'Jeremias', 'Lipgens', 'gourmet cooking', 25, to_date('01-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (26, 'Barbabra', 'Le Galle', 'cryptozoology', 26, to_date('14-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (27, 'Goober', 'Davioud', 'medieval history', 27, to_date('12-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (28, 'Teddi', 'Douthwaite', 'gourmet cooking', 28, to_date('19-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (29, 'Fowler', 'Sendley', 'gourmet cooking', 29, to_date('16-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (30, 'Leta', 'Sheridan', 'fashion design', 30, to_date('23-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (31, 'Rhea', 'Broadhead', 'vintage cars', 31, to_date('06-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (32, 'Stacy', 'Colvill', 'gourmet cooking', 32, to_date('13-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (33, 'Tom', 'Orrill', 'space exploration', 33, to_date('29-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (34, 'Edith', 'Sirett', 'space exploration', 34, to_date('10-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (35, 'Yuri', 'Latchmore', 'urban gardening', 35, to_date('08-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (36, 'Kenneth', 'Rhydderch', 'vintage cars', 36, to_date('12-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (37, 'Lenka', 'Humbey', 'robotics', 37, to_date('02-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (38, 'Lanny', 'Matusovsky', 'space exploration', 38, to_date('27-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (39, 'Daloris', 'Waterdrinker', 'extreme sports', 39, to_date('17-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (40, 'Chaim', 'Deniset', 'robotics', 40, to_date('13-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (41, 'Mil', 'Arnell', 'extreme sports', 41, to_date('11-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (42, 'Bree', 'Pogg', 'cryptozoology', 42, to_date('02-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (43, 'Sandro', 'Chattey', 'gourmet cooking', 43, to_date('14-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (44, 'Gillie', 'Curro', 'magic tricks', 44, to_date('14-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (45, 'Alick', 'Rasper', 'vintage cars', 45, to_date('23-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (46, 'Devondra', 'Grayer', 'gourmet cooking', 46, to_date('18-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (47, 'Piper', 'Gallone', 'medieval history', 47, to_date('12-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (48, 'Benedetta', 'Dybald', 'vintage cars', 48, to_date('04-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (49, 'Quintana', 'Spalls', 'vintage cars', 49, to_date('01-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (50, 'Huntington', 'Kilford', 'fashion design', 50, to_date('02-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (51, 'Alessandra', 'Gillan', 'space exploration', 51, to_date('21-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (52, 'Cynthie', 'Weekes', 'cryptozoology', 52, to_date('01-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (53, 'Carine', 'Perigoe', 'medieval history', 53, to_date('25-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (54, 'Benni', 'Villar', 'extreme sports', 54, to_date('08-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (55, 'Cordey', 'Piniur', 'vintage cars', 55, to_date('16-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (56, 'Frank', 'Clougher', 'magic tricks', 56, to_date('27-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (57, 'Darb', 'Peschke', 'cryptozoology', 57, to_date('02-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (58, 'Rickard', 'Paty', 'gourmet cooking', 58, to_date('16-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (59, 'Krissie', 'Dumbellow', 'urban gardening', 59, to_date('09-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (60, 'Stinky', 'Cottom', 'magic tricks', 60, to_date('11-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (61, 'Coraline', 'Prigmore', 'gourmet cooking', 61, to_date('10-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (62, 'Gabi', 'Crates', 'medieval history', 62, to_date('07-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (63, 'Katine', 'Callam', 'gourmet cooking', 63, to_date('14-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (64, 'Filberte', 'Battisson', 'magic tricks', 64, to_date('08-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (65, 'Devlen', 'Hulburt', 'cryptozoology', 65, to_date('16-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (66, 'Phelia', 'Yedall', 'robotics', 66, to_date('19-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (67, 'Valentin', 'Matuszak', 'robotics', 67, to_date('30-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (68, 'Brittne', 'Bowman', 'vintage cars', 68, to_date('13-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (69, 'Raychel', 'Rontree', 'magic tricks', 69, to_date('01-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (70, 'Janie', 'Etuck', 'vintage cars', 70, to_date('27-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (71, 'Erik', 'D''Antonio', 'fashion design', 71, to_date('31-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (72, 'Renaud', 'Trolley', 'robotics', 72, to_date('28-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (73, 'Duffy', 'Mushrow', 'extreme sports', 73, to_date('05-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (74, 'Willi', 'Killock', 'urban gardening', 74, to_date('23-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (75, 'Henderson', 'Busch', 'space exploration', 75, to_date('15-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (76, 'Diandra', 'Cauley', 'vintage cars', 76, to_date('25-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (77, 'Edithe', 'Dresse', 'medieval history', 77, to_date('25-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (78, 'Rogerio', 'Fuggle', 'robotics', 78, to_date('14-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (79, 'Werner', 'Newlands', 'cryptozoology', 79, to_date('29-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (80, 'Thibaud', 'Orlton', 'magic tricks', 80, to_date('21-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (81, 'Thibaut', 'Capponer', 'gourmet cooking', 81, to_date('08-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (82, 'Lillis', 'Sinkinson', 'cryptozoology', 82, to_date('29-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (83, 'Layney', 'Morais', 'fashion design', 83, to_date('24-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (84, 'Esme', 'Danielsky', 'extreme sports', 84, to_date('05-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (85, 'Stephanus', 'Ledner', 'extreme sports', 85, to_date('18-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (86, 'Yancey', 'Tagg', 'extreme sports', 86, to_date('07-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (87, 'Enrico', 'O''Hartnett', 'medieval history', 87, to_date('17-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (88, 'Cordie', 'Somerville', 'urban gardening', 88, to_date('15-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (89, 'Rosmunda', 'Killock', 'fashion design', 89, to_date('13-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (90, 'Barnebas', 'Rutherfoord', 'extreme sports', 90, to_date('30-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (91, 'Mariejeanne', 'O''Doghesty', 'robotics', 91, to_date('05-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (92, 'Renee', 'Vern', 'gourmet cooking', 92, to_date('23-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (93, 'Clint', 'Emsden', 'space exploration', 93, to_date('20-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (94, 'Danna', 'Mearing', 'cryptozoology', 94, to_date('22-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (95, 'Ivan', 'Ritzman', 'urban gardening', 95, to_date('15-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (96, 'Ely', 'Malser', 'space exploration', 96, to_date('04-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (97, 'Sawyer', 'Karpfen', 'gourmet cooking', 97, to_date('21-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (98, 'Fayina', 'Lynde', 'cryptozoology', 98, to_date('09-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (99, 'Suzanne', 'Storrie', 'extreme sports', 99, to_date('01-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (100, 'Yank', 'Battin', 'medieval history', 100, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (101, 'Ulric', 'Dorton', 'space exploration', 101, to_date('25-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (102, 'Sonnnie', 'Rosettini', 'fashion design', 102, to_date('16-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (103, 'Alanson', 'Gavrieli', 'medieval history', 103, to_date('19-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (104, 'Pamela', 'Jiri', 'gourmet cooking', 104, to_date('16-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (105, 'Niles', 'Esel', 'medieval history', 105, to_date('14-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (106, 'Cathleen', 'Viant', 'space exploration', 106, to_date('11-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (107, 'Jon', 'Tallach', 'fashion design', 107, to_date('21-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (108, 'Ginevra', 'Gillespie', 'medieval history', 108, to_date('22-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (109, 'Danni', 'Lambdin', 'vintage cars', 109, to_date('14-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (110, 'Reggy', 'Sodeau', 'fashion design', 110, to_date('17-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (111, 'Jacklyn', 'Jerrim', 'magic tricks', 111, to_date('18-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (112, 'Pearline', 'Gircke', 'space exploration', 112, to_date('04-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (113, 'Rodie', 'Suscens', 'fashion design', 113, to_date('08-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (114, 'Kent', 'Lamble', 'gourmet cooking', 114, to_date('21-11-2023', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (115, 'Garald', 'McGiffin', 'cryptozoology', 115, to_date('11-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (116, 'Veronique', 'Kilbourn', 'robotics', 116, to_date('24-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (117, 'Salvidor', 'Fairpool', 'extreme sports', 117, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (118, 'Brooks', 'Langthorne', 'gourmet cooking', 118, to_date('11-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (119, 'Bartolomeo', 'Muncaster', 'robotics', 119, to_date('04-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (120, 'Norman', 'Castlake', 'extreme sports', 120, to_date('29-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (121, 'Janice', 'Bastie', 'gourmet cooking', 121, to_date('05-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (122, 'Montague', 'Heineken', 'robotics', 122, to_date('24-05-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (123, 'Cirillo', 'Ebbotts', 'vintage cars', 123, to_date('22-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (124, 'Ashil', 'Beazey', 'magic tricks', 124, to_date('21-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (125, 'Pavla', 'Lyston', 'urban gardening', 125, to_date('29-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (126, 'Vin', 'Bratch', 'vintage cars', 126, to_date('03-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (127, 'Tiff', 'Tureville', 'extreme sports', 127, to_date('15-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (128, 'Inga', 'Chipps', 'robotics', 128, to_date('23-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (129, 'Niki', 'Spreull', 'gourmet cooking', 129, to_date('12-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (130, 'Sully', 'Stebbings', 'cryptozoology', 130, to_date('17-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (131, 'Inglebert', 'Lightwing', 'vintage cars', 131, to_date('14-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (132, 'Elly', 'Nyssen', 'robotics', 132, to_date('27-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (133, 'Fritz', 'Greenlies', 'gourmet cooking', 133, to_date('24-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (134, 'Hanan', 'Avieson', 'cryptozoology', 134, to_date('09-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (135, 'Vanna', 'Pettican', 'medieval history', 135, to_date('13-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (136, 'Tildie', 'Sydes', 'urban gardening', 136, to_date('09-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (137, 'Joice', 'Jales', 'magic tricks', 137, to_date('01-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (138, 'Veronike', 'Ruckledge', 'medieval history', 138, to_date('05-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (139, 'Padgett', 'Fort', 'cryptozoology', 139, to_date('26-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (140, 'Chic', 'Bonafacino', 'vintage cars', 140, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (141, 'Eddy', 'Bonnick', 'medieval history', 141, to_date('04-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (142, 'Sarene', 'Thomel', 'urban gardening', 142, to_date('15-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (143, 'Eliza', 'Camili', 'space exploration', 143, to_date('06-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (144, 'Griz', 'Hartmann', 'medieval history', 144, to_date('20-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (145, 'Marne', 'Eayrs', 'space exploration', 145, to_date('17-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (146, 'Cooper', 'Dunkley', 'fashion design', 146, to_date('11-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (147, 'Elvera', 'Whitta', 'magic tricks', 147, to_date('18-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (148, 'Valry', 'Withams', 'magic tricks', 148, to_date('29-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (149, 'Sherill', 'Elvey', 'vintage cars', 149, to_date('04-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (150, 'Fernando', 'Liebrecht', 'vintage cars', 150, to_date('23-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (151, 'Glory', 'Nelsen', 'extreme sports', 151, to_date('23-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (152, 'Elise', 'Yakubovics', 'fashion design', 152, to_date('16-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (153, 'Adel', 'Bess', 'extreme sports', 153, to_date('03-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (154, 'Sargent', 'Gregol', 'robotics', 154, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (155, 'Cass', 'Espine', 'vintage cars', 155, to_date('19-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (156, 'Carolynn', 'Galego', 'space exploration', 156, to_date('28-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (157, 'Bondy', 'Oldknowe', 'gourmet cooking', 157, to_date('11-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (158, 'Brucie', 'Brusin', 'urban gardening', 158, to_date('31-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (159, 'Malissa', 'Fley', 'space exploration', 159, to_date('31-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (160, 'Jacob', 'Thurlborn', 'extreme sports', 160, to_date('22-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (161, 'Beatrisa', 'Ottley', 'cryptozoology', 161, to_date('21-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (162, 'Philip', 'Travers', 'urban gardening', 162, to_date('30-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (163, 'Fredericka', 'Daton', 'vintage cars', 163, to_date('27-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (164, 'Rhoda', 'Pote', 'medieval history', 164, to_date('12-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (165, 'Wendell', 'Henrych', 'fashion design', 165, to_date('09-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (166, 'Betsy', 'Elsworth', 'vintage cars', 166, to_date('31-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (167, 'Dawn', 'McCloid', 'robotics', 167, to_date('20-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (168, 'Gibbie', 'Redier', 'vintage cars', 168, to_date('21-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (169, 'Harlie', 'Jorge', 'gourmet cooking', 169, to_date('01-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (170, 'Christin', 'Sturgess', 'urban gardening', 170, to_date('07-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (171, 'Dulce', 'Gamblin', 'robotics', 171, to_date('19-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (172, 'Dottie', 'Saffen', 'urban gardening', 172, to_date('14-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (173, 'Lizabeth', 'Gudgen', 'urban gardening', 173, to_date('22-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (174, 'Brade', 'Kaasman', 'urban gardening', 174, to_date('08-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (175, 'Jacklin', 'Bolf', 'space exploration', 175, to_date('17-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (176, 'Stanwood', 'Althrop', 'cryptozoology', 176, to_date('10-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (177, 'Rae', 'Bothams', 'space exploration', 177, to_date('31-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (178, 'Dionisio', 'Red', 'vintage cars', 178, to_date('06-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (179, 'Anette', 'Deners', 'robotics', 179, to_date('07-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (180, 'Jodie', 'Kensett', 'space exploration', 180, to_date('14-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (181, 'Peggi', 'Mussard', 'fashion design', 181, to_date('01-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (182, 'Fielding', 'Ravenshear', 'cryptozoology', 182, to_date('15-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (183, 'Ange', 'Jell', 'urban gardening', 183, to_date('22-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (184, 'Dean', 'Sparrowe', 'extreme sports', 184, to_date('16-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (185, 'Hebert', 'Cuseick', 'urban gardening', 185, to_date('29-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (186, 'Ermina', 'Vasiliev', 'medieval history', 186, to_date('03-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (187, 'Vallie', 'Kairns', 'magic tricks', 187, to_date('03-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (188, 'Gregor', 'Cousins', 'vintage cars', 188, to_date('01-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (189, 'Horacio', 'Rewcastle', 'cryptozoology', 189, to_date('30-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (190, 'Edik', 'Sommerlie', 'medieval history', 190, to_date('28-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (191, 'Rick', 'Jerzycowski', 'medieval history', 191, to_date('02-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (192, 'Milli', 'Castro', 'urban gardening', 192, to_date('27-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (193, 'Georgetta', 'Cruttenden', 'gourmet cooking', 193, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (194, 'Tildie', 'Presnell', 'urban gardening', 194, to_date('14-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (195, 'Margalit', 'Bynold', 'urban gardening', 195, to_date('11-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (196, 'Onida', 'Wines', 'robotics', 196, to_date('01-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (197, 'Mikel', 'Guillet', 'robotics', 197, to_date('29-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (198, 'Jourdain', 'Hayfield', 'magic tricks', 198, to_date('23-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (199, 'Cleo', 'O''Hanley', 'fashion design', 199, to_date('03-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (200, 'Delainey', 'Lettington', 'robotics', 200, to_date('27-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (201, 'Yuri', 'Duprey', 'space exploration', 201, to_date('12-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (202, 'Raviv', 'Dzeniskevich', 'space exploration', 202, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (203, 'Terrance', 'Lorence', 'gourmet cooking', 203, to_date('28-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (204, 'Arline', 'Blaydon', 'space exploration', 204, to_date('16-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (205, 'Julius', 'Sichardt', 'medieval history', 205, to_date('19-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (206, 'Fedora', 'De Bernardi', 'medieval history', 206, to_date('29-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (207, 'Lannie', 'Moorfield', 'robotics', 207, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (208, 'Mike', 'Blair', 'magic tricks', 208, to_date('05-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (209, 'Tally', 'Javes', 'urban gardening', 209, to_date('15-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (210, 'Jacob', 'Appleford', 'fashion design', 210, to_date('10-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (211, 'Joelly', 'Hulcoop', 'gourmet cooking', 211, to_date('02-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (212, 'Scotty', 'Avramov', 'robotics', 212, to_date('17-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (213, 'Frederic', 'Littlejohns', 'gourmet cooking', 213, to_date('11-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (214, 'Dorisa', 'Watting', 'vintage cars', 214, to_date('14-07-2023', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (215, 'Colby', 'Asprey', 'space exploration', 215, to_date('15-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (216, 'Caitrin', 'Elman', 'extreme sports', 216, to_date('31-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (217, 'Bird', 'Cawdron', 'magic tricks', 217, to_date('11-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (218, 'Sampson', 'Hornung', 'cryptozoology', 218, to_date('11-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (219, 'Brigham', 'Quayle', 'vintage cars', 219, to_date('29-05-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (220, 'Renato', 'Longea', 'vintage cars', 220, to_date('14-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (221, 'Fabiano', 'Adolf', 'extreme sports', 221, to_date('12-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (222, 'Evangeline', 'Allom', 'cryptozoology', 222, to_date('21-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (223, 'Gill', 'Pledger', 'vintage cars', 223, to_date('05-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (224, 'Liam', 'McGlade', 'extreme sports', 224, to_date('25-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (225, 'Theodore', 'Kenrick', 'robotics', 225, to_date('17-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (226, 'Leonie', 'Van der Spohr', 'urban gardening', 226, to_date('31-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (227, 'Kaitlyn', 'Hiland', 'cryptozoology', 227, to_date('18-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (228, 'Jackquelin', 'Stenson', 'medieval history', 228, to_date('14-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (229, 'Odille', 'Liccardi', 'space exploration', 229, to_date('16-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (230, 'Lorinda', 'Muggeridge', 'extreme sports', 230, to_date('27-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (231, 'Catha', 'Scragg', 'urban gardening', 231, to_date('23-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (232, 'Leodora', 'Hains', 'robotics', 232, to_date('04-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (233, 'Laurence', 'Sheivels', 'magic tricks', 233, to_date('06-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (234, 'Shelia', 'Bedbrough', 'space exploration', 234, to_date('22-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (235, 'Perri', 'Weldrake', 'magic tricks', 235, to_date('17-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (236, 'Emmit', 'MacColm', 'fashion design', 236, to_date('28-05-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (237, 'Concordia', 'Scown', 'urban gardening', 237, to_date('01-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (238, 'Jaquith', 'De Cristofalo', 'urban gardening', 238, to_date('28-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (239, 'Pippo', 'Ebbage', 'gourmet cooking', 239, to_date('06-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (240, 'Lani', 'Tomczak', 'medieval history', 240, to_date('09-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (241, 'Delmar', 'Blackstock', 'gourmet cooking', 241, to_date('10-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (242, 'Nerta', 'Gillie', 'medieval history', 242, to_date('04-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (243, 'Gawen', 'Abbess', 'robotics', 243, to_date('15-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (244, 'Arron', 'Flahive', 'gourmet cooking', 244, to_date('25-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (245, 'Flin', 'Hooks', 'robotics', 245, to_date('16-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (246, 'Glenda', 'Riches', 'gourmet cooking', 246, to_date('28-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (247, 'Kylie', 'Brason', 'space exploration', 247, to_date('11-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (248, 'Lanna', 'D''Ugo', 'urban gardening', 248, to_date('03-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (249, 'Gaelan', 'Tocknell', 'space exploration', 249, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (250, 'Claribel', 'Jarvie', 'medieval history', 250, to_date('25-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (251, 'Rae', 'Raffan', 'cryptozoology', 251, to_date('15-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (252, 'Blakeley', 'Malone', 'vintage cars', 252, to_date('29-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (253, 'Berke', 'Stent', 'cryptozoology', 253, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (254, 'Gwenneth', 'Shavel', 'fashion design', 254, to_date('04-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (255, 'Raffarty', 'Clampton', 'robotics', 255, to_date('03-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (256, 'Renato', 'O'' Sullivan', 'space exploration', 256, to_date('11-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (257, 'Alexander', 'Fearnley', 'vintage cars', 257, to_date('26-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (258, 'Peggie', 'Glossop', 'vintage cars', 258, to_date('14-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (259, 'Melosa', 'Lappine', 'medieval history', 259, to_date('03-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (260, 'Odie', 'Antcliffe', 'fashion design', 260, to_date('01-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (261, 'Angelo', 'Cholerton', 'medieval history', 261, to_date('30-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (262, 'Andrus', 'Cotgrove', 'medieval history', 262, to_date('22-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (263, 'Beulah', 'Weddell', 'robotics', 263, to_date('01-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (264, 'Fredi', 'Labrom', 'gourmet cooking', 264, to_date('07-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (265, 'Elvis', 'Attoe', 'gourmet cooking', 265, to_date('30-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (266, 'Babara', 'Clarycott', 'vintage cars', 266, to_date('20-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (267, 'Monique', 'Flippen', 'fashion design', 267, to_date('22-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (268, 'Northrup', 'Beaver', 'space exploration', 268, to_date('14-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (269, 'Trula', 'O''dell', 'space exploration', 269, to_date('04-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (270, 'Meredith', 'Koppel', 'gourmet cooking', 270, to_date('08-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (271, 'Alonzo', 'Vanin', 'urban gardening', 271, to_date('16-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (272, 'Tova', 'Matiashvili', 'gourmet cooking', 272, to_date('29-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (273, 'Roma', 'Schroeder', 'vintage cars', 273, to_date('28-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (274, 'Gibbie', 'Stutely', 'magic tricks', 274, to_date('25-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (275, 'Ilyse', 'Shufflebotham', 'medieval history', 275, to_date('27-05-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (276, 'Farrah', 'Dundendale', 'gourmet cooking', 276, to_date('09-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (277, 'Merell', 'Pash', 'cryptozoology', 277, to_date('16-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (278, 'Sheelah', 'Reeders', 'medieval history', 278, to_date('10-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (279, 'Minerva', 'Serjent', 'space exploration', 279, to_date('25-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (280, 'Fran', 'Spires', 'cryptozoology', 280, to_date('13-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (281, 'Aleksandr', 'Lashford', 'gourmet cooking', 281, to_date('25-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (282, 'Nike', 'Lovejoy', 'extreme sports', 282, to_date('18-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (283, 'Zara', 'Ashling', 'gourmet cooking', 283, to_date('05-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (284, 'John', 'Buntain', 'extreme sports', 284, to_date('17-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (285, 'Betsey', 'Slad', 'magic tricks', 285, to_date('13-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (286, 'Eduino', 'Awty', 'space exploration', 286, to_date('29-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (287, 'Tore', 'Matthews', 'vintage cars', 287, to_date('05-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (288, 'Wenda', 'Kennard', 'space exploration', 288, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (289, 'Lynelle', 'Tiddy', 'fashion design', 289, to_date('18-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (290, 'Eliza', 'Dunridge', 'robotics', 290, to_date('19-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (291, 'Selle', 'Matelyunas', 'vintage cars', 291, to_date('24-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (292, 'Tommy', 'Bransom', 'space exploration', 292, to_date('11-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (293, 'Ham', 'Haydock', 'space exploration', 293, to_date('10-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (294, 'Ernesto', 'MacMeeking', 'magic tricks', 294, to_date('01-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (295, 'Florence', 'Dimitriou', 'gourmet cooking', 295, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (296, 'Nanette', 'Ouldcott', 'extreme sports', 296, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (297, 'Thomasina', 'Aglione', 'fashion design', 297, to_date('05-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (298, 'Gerome', 'Shuxsmith', 'robotics', 298, to_date('11-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (299, 'Drusie', 'Woodings', 'medieval history', 299, to_date('21-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (300, 'Ardis', 'Sives', 'robotics', 300, to_date('07-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (329, 'Silva', 'Gwinnell', 'vintage cars', 329, to_date('14-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (330, 'Benita', 'Snowling', 'space exploration', 330, to_date('09-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (331, 'Bellina', 'Jales', 'fashion design', 331, to_date('03-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (332, 'Loree', 'Feely', 'urban gardening', 332, to_date('20-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (333, 'Chiquita', 'Isherwood', 'medieval history', 333, to_date('17-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (334, 'Ephrem', 'Tasch', 'magic tricks', 334, to_date('08-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (335, 'Alejoa', 'McKeeman', 'robotics', 335, to_date('13-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (336, 'Beverlie', 'Adamec', 'fashion design', 336, to_date('24-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (337, 'Sada', 'Fierman', 'magic tricks', 337, to_date('07-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (338, 'Mariellen', 'Valentim', 'vintage cars', 338, to_date('03-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (339, 'Gustave', 'Dunkerk', 'vintage cars', 339, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (340, 'Job', 'Dufton', 'robotics', 340, to_date('23-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (341, 'Nady', 'Rosser', 'medieval history', 341, to_date('17-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (342, 'Dionisio', 'Sindell', 'urban gardening', 342, to_date('22-12-2023', 'dd-mm-yyyy'));
commit;
prompt 500 records committed...
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (343, 'Leona', 'Tzuker', 'robotics', 343, to_date('31-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (344, 'Celka', 'Parr', 'medieval history', 344, to_date('10-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (345, 'Yorgos', 'Simson', 'gourmet cooking', 345, to_date('28-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (346, 'Sallie', 'Pountain', 'extreme sports', 346, to_date('21-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (347, 'Laurel', 'Godspeede', 'urban gardening', 347, to_date('02-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (348, 'Alasdair', 'Carrack', 'cryptozoology', 348, to_date('03-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (349, 'Jewel', 'Cloney', 'medieval history', 349, to_date('20-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (350, 'Rena', 'Ritchard', 'extreme sports', 350, to_date('17-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (351, 'Minta', 'Jamison', 'magic tricks', 351, to_date('27-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (352, 'Bevan', 'Littlefield', 'medieval history', 352, to_date('17-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (353, 'Joelly', 'Vedishchev', 'extreme sports', 353, to_date('13-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (354, 'Mitchell', 'Worthy', 'fashion design', 354, to_date('17-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (355, 'Noemi', 'Beavon', 'vintage cars', 355, to_date('15-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (356, 'Brody', 'Sirrell', 'medieval history', 356, to_date('28-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (357, 'Marin', 'Bly', 'cryptozoology', 357, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (358, 'Noble', 'Carine', 'urban gardening', 358, to_date('22-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (359, 'Codee', 'Finley', 'fashion design', 359, to_date('16-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (360, 'Gael', 'Regorz', 'vintage cars', 360, to_date('29-05-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (361, 'Gaylord', 'Shine', 'robotics', 361, to_date('11-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (362, 'Casey', 'Humerstone', 'medieval history', 362, to_date('14-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (363, 'Prissie', 'Antoney', 'extreme sports', 363, to_date('23-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (364, 'Annette', 'Tripett', 'extreme sports', 364, to_date('29-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (365, 'Abby', 'Cutmere', 'magic tricks', 365, to_date('30-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (366, 'Dorolice', 'Finlator', 'extreme sports', 366, to_date('16-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (367, 'Kerr', 'Cornill', 'gourmet cooking', 367, to_date('18-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (368, 'Melvyn', 'De Andreis', 'urban gardening', 368, to_date('16-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (369, 'Yevette', 'Lambirth', 'vintage cars', 369, to_date('24-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (370, 'Kaleb', 'Binfield', 'medieval history', 370, to_date('27-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (371, 'Lurleen', 'Chappell', 'robotics', 371, to_date('17-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (372, 'Rey', 'Karolowski', 'fashion design', 372, to_date('25-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (373, 'Gery', 'Greystock', 'magic tricks', 373, to_date('09-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (374, 'Lurline', 'Hasley', 'urban gardening', 374, to_date('07-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (375, 'Vivianna', 'Blanchette', 'vintage cars', 375, to_date('29-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (376, 'Cletis', 'Aspinal', 'robotics', 376, to_date('15-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (377, 'Darcy', 'Crose', 'space exploration', 377, to_date('16-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (378, 'Elenore', 'Toal', 'medieval history', 378, to_date('20-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (379, 'Adeline', 'Maryan', 'cryptozoology', 379, to_date('09-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (380, 'Jake', 'Bassingham', 'fashion design', 380, to_date('19-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (381, 'Wynn', 'Bourne', 'urban gardening', 381, to_date('22-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (382, 'King', 'Gossling', 'vintage cars', 382, to_date('26-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (383, 'Lamar', 'Pitchford', 'medieval history', 383, to_date('10-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (384, 'Gerhard', 'Balcon', 'cryptozoology', 384, to_date('30-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (385, 'Bob', 'Borthram', 'vintage cars', 385, to_date('10-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (386, 'Kermie', 'Giocannoni', 'robotics', 386, to_date('19-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (387, 'Maurise', 'Starrs', 'magic tricks', 387, to_date('28-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (388, 'Tobie', 'Dimitrie', 'extreme sports', 388, to_date('23-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (389, 'Kaela', 'Laybourne', 'gourmet cooking', 389, to_date('17-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (390, 'Christy', 'Adnams', 'vintage cars', 390, to_date('18-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (391, 'Jessie', 'Hazelden', 'cryptozoology', 391, to_date('13-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (392, 'Zsazsa', 'Meagh', 'space exploration', 392, to_date('03-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (393, 'Hiram', 'Lamping', 'urban gardening', 393, to_date('30-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (394, 'Augie', 'Ferry', 'gourmet cooking', 394, to_date('15-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (395, 'Thibaud', 'Kensett', 'urban gardening', 395, to_date('22-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (396, 'Meg', 'McAuliffe', 'fashion design', 396, to_date('04-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (397, 'Michaela', 'Diggins', 'medieval history', 397, to_date('27-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (398, 'Nettie', 'Barnsley', 'vintage cars', 398, to_date('01-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (399, 'Putnam', 'Nend', 'space exploration', 399, to_date('11-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (400, 'Lanny', 'Talks', 'gourmet cooking', 400, to_date('15-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (401, 'Gene', 'Lightollers', 'magic tricks', 401, to_date('01-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (402, 'Evita', 'Trusslove', 'urban gardening', 402, to_date('10-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (403, 'Shaw', 'Snadden', 'space exploration', 403, to_date('23-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (404, 'Elke', 'Phaup', 'urban gardening', 404, to_date('07-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (405, 'Erda', 'Rodrigues', 'space exploration', 405, to_date('25-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (406, 'Even', 'Siburn', 'urban gardening', 406, to_date('05-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (407, 'Sigmund', 'Killingback', 'urban gardening', 407, to_date('18-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (408, 'Christye', 'Wibrew', 'space exploration', 408, to_date('04-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (409, 'Stacie', 'Caveau', 'extreme sports', 409, to_date('18-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (410, 'Idaline', 'Smithen', 'vintage cars', 410, to_date('28-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (411, 'Tarah', 'Bosence', 'cryptozoology', 411, to_date('15-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (412, 'Nevsa', 'Piddlesden', 'urban gardening', 412, to_date('16-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (413, 'Leone', 'Rickerd', 'cryptozoology', 413, to_date('23-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (414, 'Skipton', 'Redferne', 'medieval history', 414, to_date('03-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (415, 'Meriel', 'Stroband', 'urban gardening', 415, to_date('22-05-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (416, 'Alick', 'Leele', 'robotics', 416, to_date('26-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (417, 'Eydie', 'Patten', 'magic tricks', 417, to_date('03-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (418, 'Broddie', 'Welbeck', 'cryptozoology', 418, to_date('04-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (419, 'Dominik', 'Bollam', 'magic tricks', 419, to_date('20-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (420, 'Rosabel', 'Gianasi', 'extreme sports', 420, to_date('20-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (421, 'Waylon', 'MacBrearty', 'robotics', 421, to_date('29-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (422, 'Ilaire', 'Patroni', 'medieval history', 422, to_date('05-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (423, 'Juliet', 'Algie', 'magic tricks', 423, to_date('14-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (424, 'Ingunna', 'O''Dougherty', 'magic tricks', 424, to_date('28-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (425, 'Dorise', 'Adel', 'medieval history', 425, to_date('18-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (426, 'Stafani', 'McCreery', 'urban gardening', 426, to_date('15-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (427, 'Estevan', 'Don', 'urban gardening', 427, to_date('04-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (428, 'Maggy', 'Habbershon', 'medieval history', 428, to_date('17-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (429, 'Karita', 'Van Oord', 'gourmet cooking', 429, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (430, 'Blaire', 'Feldman', 'fashion design', 430, to_date('09-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (431, 'Raimund', 'Halpine', 'extreme sports', 431, to_date('10-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (432, 'Chelsy', 'Shade', 'gourmet cooking', 432, to_date('17-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (433, 'Terrance', 'Poone', 'urban gardening', 433, to_date('19-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (434, 'Devlin', 'Gear', 'vintage cars', 434, to_date('22-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (435, 'Crin', 'Dondon', 'robotics', 435, to_date('11-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (436, 'Sherwynd', 'Sample', 'robotics', 436, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (437, 'Fina', 'Toulamain', 'cryptozoology', 437, to_date('04-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (438, 'Eadith', 'Gullam', 'vintage cars', 438, to_date('11-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (439, 'Rhonda', 'Jewett', 'extreme sports', 439, to_date('02-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (440, 'Cullen', 'Ffrench', 'robotics', 440, to_date('01-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (441, 'Nalani', 'Persicke', 'space exploration', 441, to_date('25-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (442, 'Irene', 'Crooke', 'urban gardening', 442, to_date('20-07-2023', 'dd-mm-yyyy'));
commit;
prompt 600 records committed...
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (443, 'Alanson', 'Lobbe', 'robotics', 443, to_date('29-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (444, 'Tod', 'Venus', 'cryptozoology', 444, to_date('27-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (445, 'Arman', 'Legrice', 'magic tricks', 445, to_date('18-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (446, 'Horacio', 'Dupoy', 'gourmet cooking', 446, to_date('25-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (447, 'Bat', 'Brittan', 'urban gardening', 447, to_date('30-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (448, 'Anne-marie', 'Murrthum', 'vintage cars', 448, to_date('13-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (449, 'Yvonne', 'Crossdale', 'space exploration', 449, to_date('30-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (450, 'Caresa', 'Borges', 'urban gardening', 450, to_date('21-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (451, 'Vic', 'MacMaster', 'extreme sports', 451, to_date('20-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (452, 'Cirillo', 'Farr', 'extreme sports', 452, to_date('17-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (453, 'Clementia', 'Curado', 'vintage cars', 453, to_date('18-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (454, 'Tiffanie', 'McWilliams', 'cryptozoology', 454, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (455, 'Syman', 'Hamshar', 'gourmet cooking', 455, to_date('26-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (456, 'Wallache', 'Robjohns', 'space exploration', 456, to_date('02-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (457, 'Lief', 'Cone', 'fashion design', 457, to_date('24-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (458, 'Daphne', 'Adlam', 'fashion design', 458, to_date('04-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (459, 'Trefor', 'Regler', 'magic tricks', 459, to_date('01-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (460, 'Eric', 'Milroy', 'medieval history', 460, to_date('13-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (461, 'Modestine', 'Lillistone', 'medieval history', 461, to_date('22-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (462, 'Jackson', 'Vaughan', 'extreme sports', 462, to_date('06-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (463, 'Loretta', 'Hercock', 'medieval history', 463, to_date('30-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (464, 'Serene', 'Milmo', 'magic tricks', 464, to_date('15-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (465, 'Holly-anne', 'Marte', 'vintage cars', 465, to_date('24-05-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (466, 'Victor', 'Leber', 'robotics', 466, to_date('03-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (467, 'Glory', 'Brennans', 'urban gardening', 467, to_date('17-05-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (468, 'Carroll', 'Lygoe', 'robotics', 468, to_date('14-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (469, 'Nickolas', 'Lyle', 'robotics', 469, to_date('11-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (470, 'Gaultiero', 'Beardsworth', 'cryptozoology', 470, to_date('30-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (471, 'Perceval', 'Erswell', 'space exploration', 471, to_date('02-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (472, 'Belia', 'Dowles', 'cryptozoology', 472, to_date('26-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (473, 'Wallace', 'Yelden', 'medieval history', 473, to_date('24-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (474, 'Lilias', 'Teck', 'urban gardening', 474, to_date('14-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (475, 'Herschel', 'Slatford', 'extreme sports', 475, to_date('01-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (476, 'Vivian', 'Tomicki', 'cryptozoology', 476, to_date('01-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (477, 'Geoffrey', 'Matzl', 'gourmet cooking', 477, to_date('30-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (478, 'Cazzie', 'MacMarcuis', 'space exploration', 478, to_date('03-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (479, 'Helli', 'Blasli', 'gourmet cooking', 479, to_date('01-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (480, 'Farrell', 'Whitelock', 'urban gardening', 480, to_date('23-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (481, 'Wildon', 'Durward', 'extreme sports', 481, to_date('16-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (482, 'Corby', 'Bellis', 'fashion design', 482, to_date('11-02-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (483, 'Salli', 'Filshin', 'vintage cars', 483, to_date('20-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (484, 'Salli', 'Grogan', 'vintage cars', 484, to_date('21-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (485, 'Colman', 'Richardon', 'space exploration', 485, to_date('22-01-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (486, 'Michell', 'Cranmere', 'magic tricks', 486, to_date('05-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (487, 'Gray', 'Halling', 'space exploration', 487, to_date('28-09-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (488, 'Patsy', 'Coventon', 'gourmet cooking', 488, to_date('03-07-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (489, 'Portia', 'Worcester', 'cryptozoology', 489, to_date('24-11-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (490, 'Darya', 'Priestman', 'vintage cars', 490, to_date('28-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (491, 'Donnie', 'Balls', 'cryptozoology', 491, to_date('14-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (492, 'Ronnie', 'Quarton', 'cryptozoology', 492, to_date('15-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (493, 'Lanni', 'Dewfall', 'space exploration', 493, to_date('10-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (494, 'Aurore', 'Moodie', 'vintage cars', 494, to_date('01-04-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (495, 'Jere', 'Glasscott', 'cryptozoology', 495, to_date('29-12-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (496, 'Cordi', 'Padginton', 'gourmet cooking', 496, to_date('29-03-2024', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (497, 'Norton', 'Tenwick', 'extreme sports', 497, to_date('18-10-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (498, 'Rina', 'Impson', 'magic tricks', 498, to_date('20-08-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (499, 'Nolan', 'Lissandri', 'vintage cars', 499, to_date('08-06-2023', 'dd-mm-yyyy'));
insert into ENGINEERS (engineer_id, first_name, last_name, specialty, project_id, hire_date)
values (500, 'Charley', 'Pollack', 'extreme sports', 500, to_date('03-07-2023', 'dd-mm-yyyy'));
commit;
prompt 658 records loaded
prompt Loading PROJECTMANAGERS...
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (436292, 'Etta', 'Mraz', 4407, 83572, to_date('27-09-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (468303, 'Willie', 'Gosdin', 8751, 64388, to_date('26-08-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (345605, 'Malcolm', 'Vai', 5845, 96427, to_date('29-03-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (644288, 'Owen', 'Hobson', 8356, 21270, to_date('08-02-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (311995, 'Jonathan', 'Firth', 5527, 39643, to_date('17-09-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (172019, 'Marianne', 'Guinness', 1217, 96623, to_date('17-11-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (875083, 'Nelly', 'Flatts', 9623, 28978, to_date('10-03-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (604591, 'Shannyn', 'Connery', 4604, 53196, to_date('14-02-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (68615, 'Kazem', 'Sherman', 2971, 50359, to_date('15-04-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (779429, 'Angie', 'Sinise', 2133, 72909, to_date('03-08-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (688837, 'Domingo', 'Niven', 7176, 72909, to_date('27-08-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (405104, 'Chubby', 'Whitford', 7317, 73707, to_date('24-05-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (794752, 'Hilton', 'Mac', 5845, 33746, to_date('10-01-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (740019, 'Chuck', 'Warwick', 2409, 99709, to_date('25-05-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (110246, 'Spike', 'Wen', 2971, 46678, to_date('14-12-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (382983, 'Loretta', 'Myles', 2409, 62661, to_date('21-03-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (548095, 'Rhett', 'DiFranco', 1069, 34000, to_date('07-02-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (35646, 'Meryl', 'McGowan', 5584, 27255, to_date('17-11-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (855842, 'Don', 'Hyde', 9594, 64149, to_date('18-03-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (396819, 'Maxine', 'Weber', 5060, 69402, to_date('17-01-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (233551, 'Powers', 'Moorer', 8935, 99423, to_date('04-09-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (118664, 'Lauren', 'Rydell', 2605, 70559, to_date('10-12-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (33437, 'Owen', 'Strathairn', 4722, 98393, to_date('26-09-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (754763, 'Brooke', 'Belle', 7123, 36710, to_date('02-11-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (571368, 'James', 'Plummer', 5584, 87814, to_date('17-04-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (880053, 'Annie', 'Cara', 6929, 53290, to_date('19-03-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (970247, 'Buffy', 'Cherry', 2623, 71370, to_date('20-05-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (172652, 'Penelope', 'Soda', 7952, 20053, to_date('25-06-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (55262, 'Mia', 'Frampton', 1045, 69402, to_date('25-03-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (587540, 'CeCe', 'Crow', 1362, 35980, to_date('29-05-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (281019, 'Embeth', 'Mirren', 2010, 10343, to_date('15-12-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (662133, 'Uma', 'Kinski', 9447, 22552, to_date('10-02-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (830541, 'Rawlins', 'Jovovich', 5845, 60812, to_date('21-11-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (773723, 'Eric', 'Bentley', 5849, 45469, to_date('13-09-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (676151, 'Tcheky', 'Mandrell', 2959, 44988, to_date('18-07-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (538791, 'Jill', 'Reiner', 8756, 20103, to_date('15-07-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (712227, 'Denzel', 'Satriani', 3698, 71370, to_date('02-03-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (234201, 'Chazz', 'Neeson', 5131, 96316, to_date('10-02-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (999825, 'Charlie', 'Negbaur', 8756, 37358, to_date('10-12-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (300267, 'Whoopi', 'McAnally', 5026, 44203, to_date('29-07-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (53187, 'Fionnula', 'Brown', 5111, 36710, to_date('28-10-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (905694, 'Dionne', 'Copeland', 7084, 64388, to_date('10-11-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (128122, 'First', 'Frakes', 2684, 36710, to_date('23-12-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (584392, 'Alfie', 'Hobson', 1778, 34000, to_date('14-06-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (692254, 'Paula', 'Napolitano', 7475, 69970, to_date('12-11-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (874171, 'Meg', 'Phoenix', 4372, 32136, to_date('06-10-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (867155, 'Kitty', 'Ferrer', 4271, 29909, to_date('05-12-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (127305, 'Hugh', 'Palminteri', 5561, 96623, to_date('02-03-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (942351, 'Kirk', 'Nightingale', 3980, 99709, to_date('04-12-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (252974, 'Maureen', 'Hershey', 5527, 35980, to_date('09-08-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (981193, 'Kieran', 'Wheel', 1362, 83572, to_date('14-11-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (651581, 'Ashley', 'Davis', 5527, 55049, to_date('14-11-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (478619, 'Juliet', 'Rourke', 9270, 20053, to_date('15-08-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (130943, 'Johnette', 'Carmen', 6264, 65731, to_date('29-06-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (60781, 'Crystal', 'Shawn', 2010, 58754, to_date('23-01-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (864357, 'Nicky', 'Ramis', 1135, 96316, to_date('28-03-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (276543, 'Arturo', 'Lavigne', 1348, 48363, to_date('10-12-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (530541, 'Wes', 'Rudd', 5849, 45469, to_date('04-04-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (450869, 'Heather', 'Visnjic', 4251, 55552, to_date('27-04-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (355452, 'Junior', 'Curtis', 7344, 55552, to_date('05-11-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (570071, 'Spencer', 'Matthau', 5660, 34262, to_date('17-08-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (345978, 'Geraldine', 'Salt', 8751, 96427, to_date('26-10-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (258939, 'Kasey', 'Gosdin', 6068, 28978, to_date('22-05-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (525500, 'Pete', 'Goodman', 6058, 38181, to_date('18-07-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (789745, 'Lindsey', 'Joli', 5620, 48779, to_date('11-07-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (251339, 'Mindy', 'Lewis', 4057, 85461, to_date('22-07-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (223124, 'Eileen', 'Margolyes', 5667, 21684, to_date('28-04-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (564068, 'Lydia', 'Basinger', 5131, 69550, to_date('31-10-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (490824, 'Harris', 'Rhodes', 6003, 20103, to_date('26-12-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (658705, 'Rene', 'Ponce', 7204, 20877, to_date('06-09-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (680338, 'Harold', 'Tomlin', 7343, 88035, to_date('09-11-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (357783, 'Nicolas', 'Rockwell', 2684, 67716, to_date('29-03-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (281407, 'Ryan', 'Paquin', 7842, 20053, to_date('23-03-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (666283, 'Sigourney', 'Warren', 3980, 62376, to_date('18-08-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (514398, 'Cherry', 'Beckinsale', 6264, 71370, to_date('14-10-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (428459, 'Tramaine', 'Barry', 9270, 96212, to_date('12-09-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (770561, 'King', 'Jenkins', 4604, 90015, to_date('15-09-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (966524, 'Chi', 'Begley', 9447, 44988, to_date('02-06-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (64153, 'Freddie', 'Haysbert', 5845, 53196, to_date('02-05-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (881220, 'Bernard', 'Stiller', 2623, 38756, to_date('27-11-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (526446, 'Natalie', 'Renfro', 5026, 32136, to_date('04-07-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (814256, 'Marisa', 'Mahoney', 2151, 53196, to_date('12-01-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (71603, 'Lonnie', 'Levin', 4407, 64149, to_date('11-07-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (352626, 'Jim', 'Clayton', 6090, 33287, to_date('17-09-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (964436, 'Victoria', 'Colton', 2990, 27255, to_date('14-09-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (934802, 'Merrilee', 'Buscemi', 1217, 86330, to_date('12-10-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (630029, 'Jaime', 'Mitchell', 7025, 20103, to_date('31-07-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (898797, 'Nastassja', 'Conlee', 7176, 45469, to_date('02-07-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (345249, 'Anne', 'Murphy', 1567, 20877, to_date('27-09-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (492110, 'Praga', 'Weaver', 6003, 79885, to_date('15-09-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (132117, 'Mos', 'Wariner', 1217, 79885, to_date('05-04-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (13539, 'Greg', 'Wills', 7084, 15110, to_date('20-07-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (643069, 'Hookah', 'Short', 7926, 87335, to_date('18-10-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (986875, 'Eddie', 'Galecki', 5660, 52499, to_date('02-12-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (158081, 'Giancarlo', 'Dupree', 5086, 44041, to_date('09-04-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (466467, 'Nick', 'Snipes', 9015, 21684, to_date('31-05-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (553672, 'Tamala', 'Palin', 3667, 96922, to_date('11-03-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (254665, 'Vince', 'Tomei', 1548, 71744, to_date('03-01-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (463788, 'Charlie', 'Diaz', 2108, 68594, to_date('13-08-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (341134, 'Doug', 'Quinones', 2108, 91527, to_date('18-04-2020', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (382551, 'Mac', 'Pride', 5471, 91527, to_date('19-09-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (324048, 'Samuel', 'Ellis', 4909, 64388, to_date('23-05-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (898889, 'Gates', 'Underwood', 9594, 88035, to_date('26-12-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (893153, 'Maceo', 'Paymer', 2684, 74550, to_date('04-06-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (993040, 'Gena', 'Moorer', 7475, 64577, to_date('18-01-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (424712, 'Petula', 'Franks', 4089, 75755, to_date('13-09-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (354934, 'Edward', 'Cockburn', 8751, 69402, to_date('14-02-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (548319, 'Alicia', 'Finney', 5561, 44520, to_date('08-06-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (774441, 'Jesus', 'Lucien', 5086, 44520, to_date('04-02-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (885594, 'Ben', 'Paxton', 7475, 85708, to_date('29-02-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (663505, 'Cuba', 'Bergen', 2623, 68594, to_date('17-03-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (780744, 'Dabney', 'Chaplin', 4372, 47529, to_date('24-09-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (530146, 'Juice', 'Metcalf', 5473, 60166, to_date('24-05-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (103006, 'Jeroen', 'Deejay', 2151, 66659, to_date('15-12-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (594338, 'Suzi', 'Haynes', 3980, 13785, to_date('22-03-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (110969, 'Swoosie', 'Crouse', 4538, 44203, to_date('13-11-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (445765, 'Solomon', 'Gosdin', 9716, 23985, to_date('21-06-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (418757, 'Jason', 'Hopkins', 4909, 50598, to_date('09-08-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (743449, 'Gladys', 'Beckham', 6929, 47868, to_date('01-05-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (974100, 'Meredith', 'Finn', 2409, 38728, to_date('05-12-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (27251, 'Lynette', 'Choice', 6476, 52499, to_date('22-03-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (138277, 'Dan', 'Sepulveda', 5488, 99931, to_date('07-05-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (501256, 'Jon', 'Kretschmann', 7344, 48363, to_date('04-04-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (747927, 'Jean-Claude', 'McBride', 3375, 13785, to_date('23-11-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (19022, 'Talvin', 'Ness', 3375, 28978, to_date('17-04-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (398747, 'Dom', 'Kirkwood', 4295, 89950, to_date('02-07-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (960709, 'Praga', 'Channing', 5584, 65731, to_date('26-08-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (601051, 'Howie', 'Swank', 5620, 10343, to_date('08-01-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (362087, 'Vonda', 'Conners', 4295, 88035, to_date('08-06-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (157219, 'Alicia', 'Hingle', 6068, 55049, to_date('08-11-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (895410, 'Aidan', 'Teng', 5086, 58754, to_date('23-06-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (481007, 'Keith', 'Detmer', 2133, 46678, to_date('20-03-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (132174, 'Mary', 'Dunaway', 2151, 81471, to_date('28-11-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (88744, 'Morris', 'Adler', 1860, 21270, to_date('11-01-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (657743, 'Walter', 'Knight', 4909, 96922, to_date('16-05-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (42392, 'Eddie', 'Drive', 4723, 70559, to_date('03-06-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (447853, 'Xander', 'Witherspoon', 1562, 67716, to_date('01-11-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (544496, 'Olga', 'Kenoly', 4057, 38756, to_date('13-11-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (1, 'Michael', 'Jones', 1, 1, to_date('01-01-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (501, 'Emma', 'Wilson', 101, 201, to_date('01-01-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (502, 'Liam', 'Garcia', 102, 202, to_date('01-02-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (503, 'Olivia', 'Martinez', 103, 203, to_date('01-03-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (504, 'William', 'Hernandez', 104, 204, to_date('01-04-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (505, 'James', 'Lopez', 105, 205, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (506, 'Sophia', 'Gonzalez', 106, 206, to_date('01-06-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (507, 'Michael', 'Wilson', 107, 207, to_date('01-07-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (508, 'Olivia', 'Garcia', 108, 208, to_date('01-08-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (509, 'William', 'Martinez', 109, 209, to_date('01-09-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (510, 'Sophia', 'Hernandez', 110, 210, to_date('01-10-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (511, 'Michael', 'Lopez', 111, 211, to_date('01-11-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (512, 'Sophia', 'Gonzalez', 112, 212, to_date('01-12-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (513, 'Michael', 'Wilson', 113, 213, to_date('01-01-2025', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (514, 'Emma', 'Garcia', 114, 214, to_date('01-02-2025', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (515, 'Liam', 'Martinez', 115, 215, to_date('01-03-2025', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (516, 'Olivia', 'Hernandez', 116, 216, to_date('01-04-2025', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (517, 'William', 'Lopez', 117, 217, to_date('01-05-2025', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (518, 'James', 'Gonzalez', 118, 218, to_date('01-06-2025', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (519, 'Sophia', 'Wilson', 119, 219, to_date('01-07-2025', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (520, 'Michael', 'Garcia', 120, 220, to_date('01-08-2025', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (521, 'Olivia', 'Martinez', 121, 221, to_date('01-09-2025', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (522, 'William', 'Hernandez', 122, 222, to_date('01-10-2025', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (523, 'Sophia', 'Lopez', 123, 223, to_date('01-11-2025', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (524, 'Michael', 'Gonzalez', 124, 224, to_date('01-12-2025', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (525, 'Olivia', 'Wilson', 125, 225, to_date('01-01-2026', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (526, 'William', 'Garcia', 126, 226, to_date('01-02-2026', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (2, 'Benetta', 'Aylesbury', 2, 2, to_date('12-05-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (3, 'Bertie', 'Robart', 3, 3, to_date('29-09-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (4, 'Eryn', 'Mc Ilory', 4, 4, to_date('06-09-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (5, 'Garald', 'De Vaux', 5, 5, to_date('15-04-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (6, 'Gennifer', 'Skim', 6, 6, to_date('20-02-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (7, 'Vivienne', 'Makepeace', 7, 7, to_date('18-07-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (8, 'Daryl', 'MacDougall', 8, 8, to_date('27-06-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (9, 'Niels', 'Le Noury', 9, 9, to_date('22-05-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (10, 'Germayne', 'Sprey', 10, 10, to_date('25-07-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (11, 'Renado', 'De Gregorio', 11, 11, to_date('30-03-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (12, 'Janot', 'Featherston', 12, 12, to_date('14-04-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (13, 'Benjamen', 'Kalberer', 13, 13, to_date('18-03-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (14, 'Llywellyn', 'Scaysbrook', 14, 14, to_date('03-06-2010', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (15, 'Lilias', 'Hammett', 15, 15, to_date('08-08-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (16, 'Dag', 'Biglin', 16, 16, to_date('30-11-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (17, 'Claretta', 'Reignould', 17, 17, to_date('07-01-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (18, 'Tadeas', 'Allawy', 18, 18, to_date('28-04-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (19, 'Angelico', 'Heinritz', 19, 19, to_date('28-11-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (20, 'El', 'Cruickshanks', 20, 20, to_date('05-12-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (21, 'Kliment', 'McGunley', 21, 21, to_date('11-06-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (22, 'Demetris', 'Vlasyuk', 22, 22, to_date('02-11-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (23, 'Nicoline', 'Mileham', 23, 23, to_date('15-03-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (24, 'Sidonnie', 'Draijer', 24, 24, to_date('02-03-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (25, 'Siouxie', 'Seelbach', 25, 25, to_date('09-03-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (26, 'Natal', 'Rudkin', 26, 26, to_date('11-07-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (27, 'Bendite', 'De Moreno', 27, 27, to_date('28-04-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (28, 'Helaina', 'Jewiss', 28, 28, to_date('30-07-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (29, 'Rudyard', 'Varnals', 29, 29, to_date('16-08-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (30, 'Jesus', 'Applewhite', 30, 30, to_date('22-10-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (31, 'Lanita', 'Wallworth', 31, 31, to_date('29-01-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (32, 'Parrnell', 'Yorkston', 32, 32, to_date('22-10-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (33, 'Alvinia', 'Versey', 33, 33, to_date('22-11-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (34, 'Dyann', 'Pinchbeck', 34, 34, to_date('17-11-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (35, 'Claudio', 'Twine', 35, 35, to_date('13-09-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (36, 'Lacee', 'Bouzek', 36, 36, to_date('31-05-2011', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (37, 'Rab', 'Marusyak', 37, 37, to_date('21-05-2010', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (38, 'Malory', 'Weafer', 38, 38, to_date('02-03-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (39, 'Claudia', 'Scryne', 39, 39, to_date('09-01-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (40, 'Win', 'Doumenc', 40, 40, to_date('09-06-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (41, 'Gal', 'Goodhand', 41, 41, to_date('11-10-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (42, 'Roslyn', 'Dudeney', 42, 42, to_date('08-06-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (43, 'Keven', 'Tringham', 43, 43, to_date('16-01-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (44, 'Beret', 'Bayman', 44, 44, to_date('11-06-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (45, 'Quintilla', 'Lorain', 45, 45, to_date('02-05-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (46, 'Forest', 'Lafayette', 46, 46, to_date('03-10-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (47, 'Ware', 'Gwinnel', 47, 47, to_date('18-03-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (48, 'Renato', 'Booth', 48, 48, to_date('24-04-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (49, 'Jeffie', 'Klaiser', 49, 49, to_date('24-09-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (50, 'Bethany', 'Fermer', 50, 50, to_date('30-07-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (51, 'Ursola', 'Cutts', 51, 51, to_date('31-01-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (52, 'Wynne', 'Enion', 52, 52, to_date('06-01-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (53, 'Kellie', 'Gadault', 53, 53, to_date('23-05-2010', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (54, 'Oralla', 'Barritt', 54, 54, to_date('09-08-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (55, 'Odele', 'Aberkirder', 55, 55, to_date('08-05-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (56, 'Kate', 'Krzysztof', 56, 56, to_date('11-01-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (57, 'Hester', 'De Simoni', 57, 57, to_date('26-08-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (58, 'Erasmus', 'Wanstall', 58, 58, to_date('18-02-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (59, 'Edik', 'Guesford', 59, 59, to_date('16-07-2010', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (60, 'Alexandre', 'Wilshin', 60, 60, to_date('20-03-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (61, 'Osgood', 'Vickars', 61, 61, to_date('17-09-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (62, 'Giordano', 'Adolphine', 62, 62, to_date('04-05-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (63, 'Bordie', 'Moro', 63, 63, to_date('11-10-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (64, 'Augustine', 'Castellucci', 64, 64, to_date('07-09-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (65, 'Chastity', 'Feaveryear', 65, 65, to_date('03-02-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (66, 'Gerhardt', 'Cannam', 66, 66, to_date('07-07-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (67, 'Irita', 'Vest', 67, 67, to_date('11-12-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (68, 'Leon', 'Conford', 68, 68, to_date('12-02-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (69, 'Garry', 'Filyaev', 69, 69, to_date('27-08-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (70, 'Shannen', 'Perritt', 70, 70, to_date('17-07-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (71, 'Maryanne', 'Radmore', 71, 71, to_date('02-01-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (72, 'Tobie', 'Lambot', 72, 72, to_date('31-10-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (73, 'Heather', 'Pennetta', 73, 73, to_date('10-12-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (74, 'Barb', 'Browncey', 74, 74, to_date('06-09-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (75, 'Myra', 'Arens', 75, 75, to_date('10-08-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (76, 'Kermit', 'Barensky', 76, 76, to_date('10-08-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (77, 'Kevan', 'Probin', 77, 77, to_date('23-08-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (78, 'Terri', 'Tomley', 78, 78, to_date('08-01-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (79, 'Jacki', 'Vineall', 79, 79, to_date('17-06-2010', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (80, 'Donny', 'Farraway', 80, 80, to_date('19-04-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (81, 'Mickie', 'Corbet', 81, 81, to_date('16-07-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (82, 'Agatha', 'Rubel', 82, 82, to_date('23-01-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (83, 'Siffre', 'Willshire', 83, 83, to_date('15-01-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (84, 'Merline', 'Cutridge', 84, 84, to_date('08-01-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (85, 'Patience', 'Van Son', 85, 85, to_date('25-10-2010', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (86, 'Xena', 'Gerrelt', 86, 86, to_date('11-12-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (87, 'Philippe', 'Pepperill', 87, 87, to_date('06-02-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (88, 'Aylmar', 'Walford', 88, 88, to_date('15-09-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (89, 'Letisha', 'Karleman', 89, 89, to_date('02-03-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (90, 'Jilly', 'Mazonowicz', 90, 90, to_date('22-06-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (91, 'Adele', 'Abeau', 91, 91, to_date('14-04-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (92, 'Grace', 'Coursor', 92, 92, to_date('29-09-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (93, 'Evangeline', 'Lankester', 93, 93, to_date('25-01-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (94, 'Martita', 'Jamary', 94, 94, to_date('09-09-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (95, 'Bunnie', 'Godsil', 95, 95, to_date('24-06-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (96, 'Madelon', 'Sollowaye', 96, 96, to_date('17-11-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (97, 'Jacklin', 'Finder', 97, 97, to_date('15-03-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (98, 'Wylma', 'Clempton', 98, 98, to_date('23-05-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (99, 'Lib', 'Legrand', 99, 99, to_date('01-06-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (100, 'Carolina', 'Rogliero', 100, 100, to_date('28-10-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (101, 'Maurise', 'McAnalley', 101, 101, to_date('09-01-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (102, 'Mohammed', 'Haglington', 102, 102, to_date('29-04-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (103, 'Worthington', 'Fison', 103, 103, to_date('03-09-2010', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (104, 'Matilde', 'Philp', 104, 104, to_date('31-01-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (105, 'Zelig', 'O''Hartigan', 105, 105, to_date('03-04-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (106, 'Martynne', 'Fountaine', 106, 106, to_date('06-08-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (107, 'Tiebout', 'Baynton', 107, 107, to_date('25-05-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (108, 'Urban', 'Grimmett', 108, 108, to_date('09-06-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (109, 'Sharlene', 'Hancill', 109, 109, to_date('05-01-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (110, 'Tybi', 'Vankeev', 110, 110, to_date('31-05-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (111, 'Dalia', 'Bande', 111, 111, to_date('02-11-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (112, 'Shauna', 'Checcucci', 112, 112, to_date('01-03-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (113, 'Garnet', 'Greenshiels', 113, 113, to_date('20-06-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (114, 'Minnie', 'Kinkead', 114, 114, to_date('21-09-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (115, 'Opal', 'Dickson', 115, 115, to_date('01-05-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (116, 'Serene', 'Cubbin', 116, 116, to_date('20-07-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (117, 'Lind', 'Troctor', 117, 117, to_date('26-07-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (118, 'Merrill', 'Robbings', 118, 118, to_date('01-07-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (119, 'Rooney', 'Smallsman', 119, 119, to_date('22-11-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (120, 'Conn', 'Kirtley', 120, 120, to_date('16-08-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (121, 'Itch', 'Docharty', 121, 121, to_date('17-12-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (122, 'Rhodie', 'Turn', 122, 122, to_date('23-04-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (123, 'Kariotta', 'Macias', 123, 123, to_date('18-09-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (124, 'Dylan', 'Ebbrell', 124, 124, to_date('26-04-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (125, 'Vanna', 'Wingrove', 125, 125, to_date('13-03-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (126, 'Fanya', 'Radke', 126, 126, to_date('17-11-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (127, 'Ethelind', 'Atte-Stone', 127, 127, to_date('28-03-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (128, 'Hayden', 'Scotti', 128, 128, to_date('10-01-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (129, 'Ashlen', 'Cotter', 129, 129, to_date('01-04-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (130, 'Noak', 'Copley', 130, 130, to_date('27-06-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (131, 'Mathilde', 'Hinckley', 131, 131, to_date('23-03-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (132, 'Bret', 'Huckabe', 132, 132, to_date('07-10-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (133, 'Cece', 'Ortega', 133, 133, to_date('27-09-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (134, 'Corbie', 'Dymocke', 134, 134, to_date('05-03-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (135, 'Brenden', 'Littleton', 135, 135, to_date('19-06-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (136, 'Flem', 'Christescu', 136, 136, to_date('17-10-2020', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (137, 'Gui', 'Frosch', 137, 137, to_date('04-02-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (138, 'Mirabella', 'Iglesia', 138, 138, to_date('02-04-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (139, 'Lindie', 'Maggill''Andreis', 139, 139, to_date('26-11-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (140, 'Herve', 'Zamorrano', 140, 140, to_date('28-06-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (141, 'Gilli', 'Whysall', 141, 141, to_date('10-05-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (142, 'Duky', 'Mingaud', 142, 142, to_date('04-09-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (143, 'Perceval', 'Tomkinson', 143, 143, to_date('13-09-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (144, 'Keriann', 'Proudman', 144, 144, to_date('31-07-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (145, 'Zaccaria', 'Haswall', 145, 145, to_date('30-03-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (146, 'Rea', 'Redsull', 146, 146, to_date('28-09-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (147, 'Benny', 'Fewster', 147, 147, to_date('20-03-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (148, 'Doyle', 'Boscher', 148, 148, to_date('24-06-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (149, 'Dillon', 'Cornwell', 149, 149, to_date('16-12-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (150, 'Kent', 'Beamish', 150, 150, to_date('13-02-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (151, 'Grissel', 'Vlies', 151, 151, to_date('11-07-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (152, 'Nahum', 'Esseby', 152, 152, to_date('04-02-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (153, 'Faith', 'Daintree', 153, 153, to_date('30-07-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (154, 'Vick', 'McCraine', 154, 154, to_date('02-01-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (155, 'Daven', 'Bernardeschi', 155, 155, to_date('07-12-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (156, 'Elijah', 'Strachan', 156, 156, to_date('20-11-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (157, 'Harry', 'Kuhnhardt', 157, 157, to_date('07-08-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (158, 'Janka', 'Vanyakin', 158, 158, to_date('29-04-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (159, 'Lissa', 'Turbat', 159, 159, to_date('11-10-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (160, 'Dagmar', 'Littlefield', 160, 160, to_date('07-03-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (161, 'Ches', 'Cranfield', 161, 161, to_date('01-11-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (162, 'Gaspar', 'Van Halle', 162, 162, to_date('14-10-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (163, 'Cornie', 'Jacquemot', 163, 163, to_date('28-04-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (164, 'Albina', 'McDonnell', 164, 164, to_date('03-04-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (165, 'Daloris', 'Dulton', 165, 165, to_date('03-06-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (166, 'Etienne', 'Konzel', 166, 166, to_date('29-12-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (167, 'Hope', 'Leat', 167, 167, to_date('24-01-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (168, 'Ramona', 'O''Heaney', 168, 168, to_date('20-07-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (169, 'Othello', 'Bearcock', 169, 169, to_date('10-03-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (170, 'Bobbi', 'Heaslip', 170, 170, to_date('17-06-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (171, 'Daren', 'Vasyanin', 171, 171, to_date('08-01-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (172, 'Pasquale', 'Dyke', 172, 172, to_date('26-12-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (173, 'Coleen', 'Brisseau', 173, 173, to_date('29-10-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (174, 'Jule', 'Klimkov', 174, 174, to_date('29-07-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (175, 'Jaine', 'Kraft', 175, 175, to_date('04-06-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (176, 'Jsandye', 'Mutter', 176, 176, to_date('21-06-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (177, 'Fran', 'Olivetti', 177, 177, to_date('07-07-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (178, 'Isidora', 'Runsey', 178, 178, to_date('30-03-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (179, 'Gisela', 'Stearn', 179, 179, to_date('04-08-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (180, 'Jessie', 'Daouse', 180, 180, to_date('18-08-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (181, 'Donia', 'Coakley', 181, 181, to_date('11-04-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (182, 'Yale', 'Ludmann', 182, 182, to_date('26-05-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (183, 'Venita', 'Drayson', 183, 183, to_date('12-01-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (184, 'Hastings', 'Biss', 184, 184, to_date('07-01-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (185, 'Candie', 'Nabbs', 185, 185, to_date('23-09-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (186, 'Raynor', 'Crepel', 186, 186, to_date('17-10-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (187, 'Nessa', 'Shapera', 187, 187, to_date('11-04-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (188, 'Estelle', 'Bendare', 188, 188, to_date('22-03-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (189, 'Osmond', 'Byfford', 189, 189, to_date('21-08-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (190, 'Osmond', 'Behrendsen', 190, 190, to_date('24-02-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (191, 'Lynnet', 'Cluett', 191, 191, to_date('11-04-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (192, 'Sosanna', 'Ketchaside', 192, 192, to_date('07-04-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (193, 'Andria', 'Burbank', 193, 193, to_date('04-02-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (194, 'Felisha', 'Schwandt', 194, 194, to_date('23-03-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (195, 'Camellia', 'Spaice', 195, 195, to_date('23-05-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (196, 'Gaby', 'Caddie', 196, 196, to_date('12-08-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (197, 'Mommy', 'Enright', 197, 197, to_date('24-06-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (198, 'Katti', 'Videneev', 198, 198, to_date('31-08-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (199, 'Golda', 'Diglin', 199, 199, to_date('06-03-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (200, 'Tessi', 'Brymham', 200, 200, to_date('23-05-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (201, 'Newton', 'Polini', 201, 201, to_date('28-04-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (202, 'Burgess', 'Vagges', 202, 202, to_date('28-07-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (203, 'Haily', 'de Najera', 203, 203, to_date('06-09-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (204, 'Ede', 'Croser', 204, 204, to_date('16-06-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (205, 'Suellen', 'Muckley', 205, 205, to_date('19-10-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (206, 'Beck', 'Gavrielly', 206, 206, to_date('11-11-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (207, 'Doris', 'Pearmain', 207, 207, to_date('07-04-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (208, 'Prisca', 'Bence', 208, 208, to_date('19-07-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (209, 'Barry', 'Suermeier', 209, 209, to_date('18-11-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (210, 'Genni', 'Pappin', 210, 210, to_date('10-03-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (211, 'Carson', 'Cristoforetti', 211, 211, to_date('06-09-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (212, 'Zondra', 'Kasparski', 212, 212, to_date('22-05-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (213, 'Cirstoforo', 'Nester', 213, 213, to_date('02-09-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (214, 'Padraic', 'Beadon', 214, 214, to_date('04-11-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (215, 'Rhett', 'Sivier', 215, 215, to_date('06-12-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (216, 'Bord', 'Wilder', 216, 216, to_date('12-01-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (217, 'Broderick', 'Boggish', 217, 217, to_date('19-09-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (218, 'Dionis', 'Culham', 218, 218, to_date('26-11-2010', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (219, 'Thoma', 'Rubery', 219, 219, to_date('15-06-2010', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (220, 'Dolph', 'Crimin', 220, 220, to_date('23-07-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (221, 'Carce', 'Loisi', 221, 221, to_date('22-10-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (222, 'Mellie', 'Faulkner', 222, 222, to_date('16-06-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (223, 'Agneta', 'Schulze', 223, 223, to_date('25-04-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (224, 'Lacy', 'Wibberley', 224, 224, to_date('02-08-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (225, 'Kati', 'Conre', 225, 225, to_date('04-03-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (226, 'Farrand', 'Stoffers', 226, 226, to_date('10-11-2010', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (227, 'Tessy', 'Conford', 227, 227, to_date('17-02-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (228, 'Bradford', 'Hartin', 228, 228, to_date('15-12-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (229, 'Adan', 'O''Cannavan', 229, 229, to_date('05-10-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (230, 'Dedie', 'Penhale', 230, 230, to_date('19-02-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (231, 'Tana', 'Iston', 231, 231, to_date('08-08-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (232, 'Harmonie', 'Pawling', 232, 232, to_date('12-10-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (233, 'Wilbur', 'Heel', 233, 233, to_date('06-07-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (234, 'Jeffy', 'Duligall', 234, 234, to_date('15-11-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (235, 'Brantley', 'Matelyunas', 235, 235, to_date('02-06-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (236, 'Maddie', 'Sweating', 236, 236, to_date('05-01-2014', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (237, 'Horatia', 'Viger', 237, 237, to_date('25-12-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (238, 'Daisy', 'Chadbourn', 238, 238, to_date('01-07-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (239, 'Bebe', 'Angliss', 239, 239, to_date('09-08-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (240, 'Max', 'Brosoli', 240, 240, to_date('09-10-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (241, 'Lazare', 'Drysdall', 241, 241, to_date('28-08-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (242, 'Lucienne', 'Sertin', 242, 242, to_date('28-04-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (243, 'Chrysa', 'Golley', 243, 243, to_date('16-10-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (244, 'Vince', 'Timcke', 244, 244, to_date('29-05-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (245, 'Petunia', 'Alforde', 245, 245, to_date('22-10-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (246, 'Bunny', 'Bencher', 246, 246, to_date('11-01-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (247, 'Jard', 'Delbergue', 247, 247, to_date('02-07-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (248, 'Wenda', 'Mallabone', 248, 248, to_date('21-09-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (249, 'Stefano', 'Eborall', 249, 249, to_date('11-11-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (250, 'Gwen', 'Brabyn', 250, 250, to_date('09-04-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (251, 'Vernen', 'Markus', 251, 251, to_date('18-09-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (252, 'Errol', 'Geggus', 252, 252, to_date('18-04-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (253, 'Ranique', 'Wensley', 253, 253, to_date('09-09-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (254, 'Nealson', 'O''Caine', 254, 254, to_date('14-04-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (255, 'Temp', 'Seawell', 255, 255, to_date('08-05-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (256, 'Julio', 'Ehrat', 256, 256, to_date('29-05-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (257, 'Cam', 'Trask', 257, 257, to_date('08-06-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (258, 'Dun', 'Aubray', 258, 258, to_date('13-11-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (259, 'Georgena', 'Swale', 259, 259, to_date('02-07-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (260, 'Alfie', 'Southby', 260, 260, to_date('16-12-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (261, 'Courtney', 'Greest', 261, 261, to_date('02-05-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (262, 'Derk', 'Torns', 262, 262, to_date('20-07-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (263, 'Rozanna', 'Dasent', 263, 263, to_date('19-03-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (264, 'Ricca', 'Karlowicz', 264, 264, to_date('02-06-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (265, 'Baillie', 'O'' Shea', 265, 265, to_date('28-02-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (266, 'Chas', 'Pendergast', 266, 266, to_date('15-04-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (267, 'Ilysa', 'Mote', 267, 267, to_date('25-01-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (268, 'Aviva', 'Scowen', 268, 268, to_date('11-09-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (269, 'Andi', 'Waring', 269, 269, to_date('22-01-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (270, 'Dix', 'Hewertson', 270, 270, to_date('07-05-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (271, 'Doria', 'Millichap', 271, 271, to_date('19-05-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (272, 'Atlanta', 'Killingbeck', 272, 272, to_date('28-11-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (273, 'Sayre', 'Tethcote', 273, 273, to_date('03-09-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (274, 'Arie', 'Milson', 274, 274, to_date('26-08-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (275, 'Leonelle', 'Cambell', 275, 275, to_date('21-05-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (276, 'Bertrand', 'Middlehurst', 276, 276, to_date('04-09-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (277, 'Tuckie', 'Koschke', 277, 277, to_date('17-06-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (278, 'Elissa', 'Tatchell', 278, 278, to_date('02-05-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (279, 'Berky', 'Vondrak', 279, 279, to_date('13-12-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (280, 'Felicdad', 'Marre', 280, 280, to_date('20-11-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (281, 'Luci', 'Ascraft', 281, 281, to_date('06-06-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (282, 'Augustin', 'Fetherston', 282, 282, to_date('02-10-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (283, 'Brod', 'Sivier', 283, 283, to_date('11-03-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (284, 'Brenna', 'Vahl', 284, 284, to_date('24-10-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (285, 'Zechariah', 'Hulbert', 285, 285, to_date('26-02-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (286, 'Morissa', 'Mattea', 286, 286, to_date('24-01-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (287, 'Augusta', 'Poplee', 287, 287, to_date('18-01-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (288, 'Chauncey', 'Schiementz', 288, 288, to_date('10-05-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (289, 'Caitrin', 'Tweddell', 289, 289, to_date('01-05-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (290, 'Jaquith', 'Trevaskiss', 290, 290, to_date('14-06-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (291, 'Ottilie', 'Monketon', 291, 291, to_date('20-10-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (292, 'Ermengarde', 'Seebright', 292, 292, to_date('09-09-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (293, 'Nikolia', 'Dri', 293, 293, to_date('29-03-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (294, 'Adolf', 'Vasyatkin', 294, 294, to_date('10-01-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (295, 'Leroy', 'Phillcox', 295, 295, to_date('26-07-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (296, 'Ned', 'Vennart', 296, 296, to_date('11-01-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (297, 'Peterus', 'O''Currane', 297, 297, to_date('19-10-2010', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (298, 'Minnnie', 'Paxeford', 298, 298, to_date('02-03-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (299, 'Shelby', 'Caesman', 299, 299, to_date('06-02-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (300, 'Peri', 'Guisby', 300, 300, to_date('07-04-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (301, 'Tadeo', 'Golson', 301, 301, to_date('18-04-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (302, 'Lorrayne', 'Ruff', 302, 302, to_date('16-11-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (303, 'Nels', 'Itzkowicz', 303, 303, to_date('23-03-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (304, 'Maurits', 'Rendall', 304, 304, to_date('22-09-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (305, 'Kathrine', 'Coltherd', 305, 305, to_date('06-04-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (306, 'Claire', 'Staples', 306, 306, to_date('02-06-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (307, 'Alejandrina', 'Kime', 307, 307, to_date('02-12-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (308, 'Flore', 'Gert', 308, 308, to_date('02-03-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (309, 'Murielle', 'Whye', 309, 309, to_date('29-11-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (310, 'Junia', 'Pundy', 310, 310, to_date('10-08-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (311, 'Roma', 'Connors', 311, 311, to_date('31-03-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (312, 'Audy', 'Leger', 312, 312, to_date('02-06-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (313, 'Shawna', 'Raatz', 313, 313, to_date('28-03-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (314, 'Hynda', 'Stuckey', 314, 314, to_date('26-04-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (315, 'Claiborne', 'Fader', 315, 315, to_date('15-02-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (316, 'Brandy', 'Antoons', 316, 316, to_date('11-05-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (317, 'Nicolina', 'McGaughey', 317, 317, to_date('11-08-2010', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (318, 'Beverlee', 'Coult', 318, 318, to_date('15-10-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (319, 'Barney', 'Paulou', 319, 319, to_date('16-11-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (320, 'Darcey', 'Howick', 320, 320, to_date('13-05-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (321, 'Jsandye', 'Cardoso', 321, 321, to_date('31-08-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (322, 'Denys', 'Timeby', 322, 322, to_date('19-08-2010', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (323, 'Willey', 'Blick', 323, 323, to_date('23-06-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (324, 'Jens', 'Hubery', 324, 324, to_date('15-07-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (325, 'Nonie', 'Ties', 325, 325, to_date('24-07-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (326, 'Johan', 'Kynder', 326, 326, to_date('19-12-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (327, 'Opalina', 'Davidovici', 327, 327, to_date('15-11-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (328, 'Edd', 'Corstan', 328, 328, to_date('18-06-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (329, 'Pansy', 'Balham', 329, 329, to_date('08-09-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (330, 'Glen', 'Larway', 330, 330, to_date('13-03-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (331, 'Drusie', 'Huertas', 331, 331, to_date('09-05-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (332, 'Tiffi', 'Karpinski', 332, 332, to_date('04-02-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (333, 'Barris', 'Van Hesteren', 333, 333, to_date('19-09-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (334, 'Virgie', 'Beek', 334, 334, to_date('01-08-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (335, 'Ivy', 'Jorgesen', 335, 335, to_date('21-10-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (336, 'Natty', 'Falkner', 336, 336, to_date('17-02-2016', 'dd-mm-yyyy'));
commit;
prompt 500 records committed...
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (337, 'Orv', 'Westgate', 337, 337, to_date('05-12-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (338, 'Anny', 'Stiven', 338, 338, to_date('09-01-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (339, 'Trudi', 'Pauluzzi', 339, 339, to_date('17-06-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (340, 'Elysha', 'Marron', 340, 340, to_date('27-02-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (341, 'Charin', 'Shorten', 341, 341, to_date('02-03-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (342, 'Guilbert', 'Zanassi', 342, 342, to_date('15-09-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (343, 'Rachelle', 'Gudde', 343, 343, to_date('23-07-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (344, 'Antonina', 'Guyer', 344, 344, to_date('17-12-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (345, 'Lindy', 'Gatling', 345, 345, to_date('04-01-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (346, 'Georgetta', 'Alesbrook', 346, 346, to_date('22-06-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (347, 'Reece', 'Bainton', 347, 347, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (348, 'Brittni', 'Thrussell', 348, 348, to_date('09-09-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (349, 'Eduardo', 'Dobney', 349, 349, to_date('16-05-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (350, 'Claiborn', 'Duthie', 350, 350, to_date('14-03-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (351, 'Luce', 'McIlvoray', 351, 351, to_date('05-03-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (352, 'Grace', 'Vanichkin', 352, 352, to_date('11-09-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (353, 'Ringo', 'Northgraves', 353, 353, to_date('06-06-2010', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (354, 'Brenn', 'Canning', 354, 354, to_date('15-05-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (355, 'Melessa', 'Pickthall', 355, 355, to_date('14-11-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (356, 'Bibi', 'Grinikhin', 356, 356, to_date('03-08-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (357, 'Jaclin', 'Gillhespy', 357, 357, to_date('08-05-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (358, 'Kenna', 'Wetherburn', 358, 358, to_date('14-05-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (359, 'Brittani', 'Richly', 359, 359, to_date('27-11-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (360, 'Alecia', 'Tytterton', 360, 360, to_date('11-05-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (361, 'Armin', 'Scopham', 361, 361, to_date('17-04-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (362, 'Minette', 'Reaveley', 362, 362, to_date('19-10-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (363, 'Cora', 'Durdy', 363, 363, to_date('23-10-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (364, 'Madelina', 'Loughton', 364, 364, to_date('30-07-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (365, 'Anatollo', 'Bittany', 365, 365, to_date('07-10-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (366, 'Andy', 'Greenslade', 366, 366, to_date('05-12-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (367, 'Isadore', 'Veivers', 367, 367, to_date('19-03-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (368, 'Peyter', 'Hulse', 368, 368, to_date('08-07-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (369, 'Brynn', 'Coulthard', 369, 369, to_date('10-04-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (370, 'Rourke', 'Dowda', 370, 370, to_date('13-05-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (371, 'Vernon', 'Buist', 371, 371, to_date('02-11-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (372, 'Garrard', 'Cranny', 372, 372, to_date('02-08-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (373, 'Corbett', 'Philipart', 373, 373, to_date('23-02-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (374, 'Pyotr', 'Attfield', 374, 374, to_date('20-02-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (375, 'Leonie', 'Vinnick', 375, 375, to_date('25-08-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (376, 'Pavlov', 'Annell', 376, 376, to_date('20-05-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (377, 'Liz', 'Malthouse', 377, 377, to_date('07-09-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (378, 'Kipper', 'Vannah', 378, 378, to_date('25-02-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (379, 'Ivette', 'Palmby', 379, 379, to_date('03-02-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (380, 'Ted', 'Wilcott', 380, 380, to_date('03-06-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (381, 'Bernete', 'Sinnie', 381, 381, to_date('01-08-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (382, 'Marianna', 'McGuire', 382, 382, to_date('08-05-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (383, 'Victoir', 'Flemming', 383, 383, to_date('18-01-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (384, 'Dennie', 'Dutton', 384, 384, to_date('30-01-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (385, 'Kenton', 'Coneybeer', 385, 385, to_date('28-07-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (386, 'Larine', 'MacGragh', 386, 386, to_date('16-08-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (387, 'Tressa', 'Chaffey', 387, 387, to_date('08-08-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (388, 'Gisela', 'McClune', 388, 388, to_date('20-07-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (389, 'Modesty', 'Towne', 389, 389, to_date('17-01-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (390, 'Axe', 'Praten', 390, 390, to_date('16-12-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (391, 'Maxi', 'Gresham', 391, 391, to_date('04-10-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (392, 'Debee', 'Gummary', 392, 392, to_date('23-04-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (393, 'Sandye', 'Robiou', 393, 393, to_date('24-09-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (394, 'Guthrey', 'Redhills', 394, 394, to_date('13-12-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (395, 'Skyler', 'Alldridge', 395, 395, to_date('21-01-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (396, 'Cathlene', 'Gulland', 396, 396, to_date('14-08-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (397, 'Tabbi', 'Tewkesberry', 397, 397, to_date('16-08-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (398, 'Sig', 'Ventam', 398, 398, to_date('22-03-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (399, 'Miof mela', 'Ratcliff', 399, 399, to_date('27-02-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (400, 'Pietra', 'Edensor', 400, 400, to_date('07-08-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (401, 'Rubie', 'April', 401, 401, to_date('30-12-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (402, 'Rock', 'Girdwood', 402, 402, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (403, 'Jillene', 'Sher', 403, 403, to_date('01-12-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (404, 'Parrnell', 'O''Sheilds', 404, 404, to_date('07-04-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (405, 'Nichols', 'Kubiczek', 405, 405, to_date('19-06-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (406, 'Eugen', 'Bidnall', 406, 406, to_date('10-02-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (407, 'Arly', 'Klausen', 407, 407, to_date('16-01-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (408, 'Harry', 'Behan', 408, 408, to_date('31-10-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (409, 'Georgine', 'Kubiak', 409, 409, to_date('27-02-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (410, 'Tony', 'Lambden', 410, 410, to_date('19-08-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (411, 'Theodosia', 'Jori', 411, 411, to_date('16-04-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (412, 'Issi', 'Spratley', 412, 412, to_date('08-01-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (413, 'Lesya', 'Dales', 413, 413, to_date('06-01-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (414, 'Tedman', 'Neligan', 414, 414, to_date('09-09-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (415, 'Jobye', 'Halhead', 415, 415, to_date('17-05-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (416, 'Lorettalorna', 'Anney', 416, 416, to_date('12-03-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (417, 'Nico', 'Wonfar', 417, 417, to_date('23-07-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (418, 'Johnathon', 'Sanper', 418, 418, to_date('13-08-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (419, 'Portie', 'Pickthall', 419, 419, to_date('22-12-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (420, 'Sinclair', 'Cassam', 420, 420, to_date('02-07-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (421, 'Orland', 'Careless', 421, 421, to_date('21-09-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (422, 'Flss', 'McCrow', 422, 422, to_date('30-03-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (423, 'Adriana', 'Patching', 423, 423, to_date('29-11-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (424, 'Pavia', 'Labden', 424, 424, to_date('27-11-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (425, 'Gualterio', 'Voisey', 425, 425, to_date('18-05-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (426, 'Kendricks', 'Strut', 426, 426, to_date('03-01-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (427, 'Jonathon', 'Iannazzi', 427, 427, to_date('08-07-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (428, 'Xymenes', 'Boome', 428, 428, to_date('06-12-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (429, 'Gav', 'Grandisson', 429, 429, to_date('03-04-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (430, 'Barnebas', 'Scahill', 430, 430, to_date('25-01-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (431, 'Cristina', 'Mellings', 431, 431, to_date('05-11-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (432, 'Loni', 'Neising', 432, 432, to_date('21-12-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (433, 'Bess', 'Yuill', 433, 433, to_date('23-11-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (434, 'Milka', 'Entwistle', 434, 434, to_date('01-06-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (435, 'Florance', 'Downing', 435, 435, to_date('14-02-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (436, 'Zena', 'Koppes', 436, 436, to_date('19-01-2014', 'dd-mm-yyyy'));
commit;
prompt 600 records committed...
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (437, 'Deina', 'Humbee', 437, 437, to_date('28-08-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (438, 'Lezley', 'Farrants', 438, 438, to_date('12-10-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (439, 'Adolphus', 'Feasey', 439, 439, to_date('03-09-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (440, 'Salome', 'Tuffs', 440, 440, to_date('05-08-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (441, 'Symon', 'Jeanneau', 441, 441, to_date('10-07-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (442, 'Eugenia', 'Giacomuzzi', 442, 442, to_date('12-06-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (443, 'Jefferson', 'Castro', 443, 443, to_date('08-12-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (444, 'Susann', 'Marages', 444, 444, to_date('15-03-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (445, 'Faydra', 'Eddowes', 445, 445, to_date('27-12-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (446, 'Ellerey', 'Basset', 446, 446, to_date('16-04-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (447, 'Myriam', 'Whitcombe', 447, 447, to_date('15-07-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (448, 'Ali', 'Pott', 448, 448, to_date('14-05-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (449, 'Maxwell', 'O''Sullivan', 449, 449, to_date('19-11-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (450, 'Pail', 'Zincke', 450, 450, to_date('08-06-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (451, 'Jackelyn', 'Royal', 451, 451, to_date('21-06-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (452, 'Denis', 'Garland', 452, 452, to_date('11-05-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (453, 'Christal', 'Lenormand', 453, 453, to_date('14-11-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (454, 'Bartie', 'McLeish', 454, 454, to_date('24-05-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (455, 'Fergus', 'Harpham', 455, 455, to_date('22-07-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (456, 'Dynah', 'Kantor', 456, 456, to_date('05-07-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (457, 'Wilfred', 'Thomsen', 457, 457, to_date('15-10-2010', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (458, 'Kippar', 'Bruna', 458, 458, to_date('04-10-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (459, 'Minerva', 'Kayzer', 459, 459, to_date('17-05-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (460, 'Joanne', 'Lodo', 460, 460, to_date('10-11-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (461, 'Hilton', 'Olyonov', 461, 461, to_date('09-10-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (462, 'Brock', 'Woodington', 462, 462, to_date('29-11-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (463, 'Reamonn', 'Wornham', 463, 463, to_date('19-08-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (464, 'Kirk', 'Mobius', 464, 464, to_date('28-12-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (465, 'Juliet', 'Smaling', 465, 465, to_date('25-12-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (466, 'Winne', 'Heinz', 466, 466, to_date('01-05-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (467, 'Corinna', 'Harms', 467, 467, to_date('02-11-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (468, 'Rolfe', 'Foxton', 468, 468, to_date('04-09-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (469, 'Derby', 'Chewter', 469, 469, to_date('25-06-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (470, 'Steven', 'Clines', 470, 470, to_date('27-06-2010', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (471, 'Standford', 'Eynon', 471, 471, to_date('31-12-2010', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (472, 'Zeb', 'Bingham', 472, 472, to_date('12-02-2011', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (473, 'Frances', 'Cartmail', 473, 473, to_date('15-06-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (474, 'Noemi', 'Edgley', 474, 474, to_date('08-03-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (475, 'Lancelot', 'Harbor', 475, 475, to_date('04-07-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (476, 'Ernie', 'Dranfield', 476, 476, to_date('07-12-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (477, 'Mommy', 'Northall', 477, 477, to_date('09-09-2022', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (478, 'Averell', 'Gray', 478, 478, to_date('15-09-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (479, 'Bertina', 'Chanson', 479, 479, to_date('27-07-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (480, 'Karena', 'Alexandre', 480, 480, to_date('06-11-2021', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (481, 'Thekla', 'Blest', 481, 481, to_date('05-04-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (482, 'Tania', 'Grocock', 482, 482, to_date('04-12-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (483, 'Ruttger', 'Skitch', 483, 483, to_date('09-05-2017', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (484, 'Jozef', 'Robez', 484, 484, to_date('23-06-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (485, 'Shel', 'Degli Antoni', 485, 485, to_date('22-03-2018', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (486, 'Celisse', 'Dalgety', 486, 486, to_date('12-10-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (487, 'Catharina', 'Corr', 487, 487, to_date('10-05-2012', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (488, 'Hillel', 'Rosenstock', 488, 488, to_date('19-11-2020', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (489, 'Ricky', 'Bosanko', 489, 489, to_date('28-06-2023', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (490, 'Ellsworth', 'Corish', 490, 490, to_date('11-08-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (491, 'Joan', 'Capner', 491, 491, to_date('17-03-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (492, 'Cyrille', 'Krahl', 492, 492, to_date('07-12-2016', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (493, 'Montague', 'Ridgwell', 493, 493, to_date('13-11-2014', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (494, 'Rosabel', 'Breddy', 494, 494, to_date('07-03-2024', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (495, 'Alden', 'Wylder', 495, 495, to_date('05-10-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (496, 'Vasily', 'McCue', 496, 496, to_date('14-01-2019', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (497, 'Bradford', 'Piercey', 497, 497, to_date('15-07-2013', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (498, 'Vale', 'Bonsall', 498, 498, to_date('19-11-2015', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (499, 'Orsa', 'Chester', 499, 499, to_date('06-11-2010', 'dd-mm-yyyy'));
insert into PROJECTMANAGERS (manager_id, first_name, last_name, project_id, department_id, hire_date)
values (500, 'Mareah', 'Truluck', 500, 500, to_date('09-01-2024', 'dd-mm-yyyy'));
commit;
prompt 664 records loaded
prompt Loading OFFICETECHNICIANS...
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (43999, 'Bill', 'Spears', 520606, to_date('03-10-2019', 'dd-mm-yyyy'), 132117);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (27890, 'Jet', 'Jovovich', 926584, to_date('03-12-2019', 'dd-mm-yyyy'), 103006);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (25626, 'Gran', 'O''Sullivan', 670489, to_date('19-03-2019', 'dd-mm-yyyy'), 814256);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (26764, 'Victoria', 'Senior', 665297, to_date('18-10-2019', 'dd-mm-yyyy'), 463788);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (44309, 'Mickey', 'Cross', 142132, to_date('08-02-2020', 'dd-mm-yyyy'), 35646);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (34828, 'Nanci', 'Bruce', 559672, to_date('28-11-2018', 'dd-mm-yyyy'), 138277);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (20425, 'Brad', 'Rhys-Davies', 941899, to_date('10-02-2019', 'dd-mm-yyyy'), 548095);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (71811, 'Malcolm', 'Lee', 233302, to_date('21-01-2020', 'dd-mm-yyyy'), 55262);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (73244, 'Darius', 'Mitra', 977049, to_date('02-04-2019', 'dd-mm-yyyy'), 281407);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (17990, 'Edie', 'Mathis', 620769, to_date('20-08-2019', 'dd-mm-yyyy'), 68615);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (66879, 'Hector', 'Nicholas', 207244, to_date('17-06-2019', 'dd-mm-yyyy'), 993040);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (20025, 'Connie', 'Burton', 652795, to_date('23-02-2020', 'dd-mm-yyyy'), 398747);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (77747, 'Leon', 'Potter', 574023, to_date('25-10-2018', 'dd-mm-yyyy'), 478619);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (44831, 'Courtney', 'Thorton', 154099, to_date('07-08-2018', 'dd-mm-yyyy'), 789745);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (22123, 'Renee', 'Grier', 460261, to_date('09-11-2018', 'dd-mm-yyyy'), 128122);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (88205, 'Andrew', 'Hawthorne', 302466, to_date('12-03-2020', 'dd-mm-yyyy'), 584392);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (88825, 'Edwin', 'Farina', 350000, to_date('31-12-2019', 'dd-mm-yyyy'), 966524);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (22862, 'Toni', 'Cole', 117982, to_date('23-07-2018', 'dd-mm-yyyy'), 481007);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (94836, 'Rory', 'Singh', 913306, to_date('05-04-2020', 'dd-mm-yyyy'), 357783);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (98121, 'Kurt', 'Popper', 764681, to_date('04-10-2018', 'dd-mm-yyyy'), 662133);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (91474, 'Debra', 'Sossamon', 888085, to_date('08-12-2019', 'dd-mm-yyyy'), 172652);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (41911, 'Merle', 'Fishburne', 517871, to_date('18-06-2018', 'dd-mm-yyyy'), 774441);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (39192, 'Tia', 'Wilson', 67687, to_date('15-07-2018', 'dd-mm-yyyy'), 501256);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (32081, 'Holland', 'Polley', 685594, to_date('24-02-2019', 'dd-mm-yyyy'), 864357);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (55388, 'Kyra', 'Branagh', 886088, to_date('12-07-2018', 'dd-mm-yyyy'), 680338);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (53228, 'Amy', 'Penders', 392628, to_date('17-01-2020', 'dd-mm-yyyy'), 770561);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (22527, 'Andrea', 'Feuerstein', 753695, to_date('20-09-2019', 'dd-mm-yyyy'), 138277);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (39895, 'Teri', 'Breslin', 687214, to_date('09-05-2018', 'dd-mm-yyyy'), 436292);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (56908, 'Ronnie', 'Gallant', 540643, to_date('15-04-2020', 'dd-mm-yyyy'), 118664);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (83085, 'Ivan', 'Levert', 495521, to_date('06-05-2019', 'dd-mm-yyyy'), 398747);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (14384, 'Toshiro', 'Tankard', 368383, to_date('03-10-2019', 'dd-mm-yyyy'), 382551);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (81897, 'Alannah', 'Mifune', 672327, to_date('16-09-2019', 'dd-mm-yyyy'), 644288);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (85637, 'Victoria', 'Cocker', 161844, to_date('12-03-2019', 'dd-mm-yyyy'), 880053);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (24968, 'Vince', 'Silverman', 858868, to_date('03-08-2019', 'dd-mm-yyyy'), 345249);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (20665, 'Olga', 'Mraz', 502718, to_date('27-05-2018', 'dd-mm-yyyy'), 601051);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (14088, 'Gran', 'Studi', 295863, to_date('21-07-2019', 'dd-mm-yyyy'), 743449);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (66378, 'Cameron', 'Palin', 628583, to_date('18-11-2018', 'dd-mm-yyyy'), 88744);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (36411, 'Joey', 'Folds', 692819, to_date('21-02-2019', 'dd-mm-yyyy'), 658705);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (89104, 'Samuel', 'Parish', 845662, to_date('26-10-2018', 'dd-mm-yyyy'), 396819);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (50442, 'Ashley', 'Carnes', 345656, to_date('20-07-2019', 'dd-mm-yyyy'), 514398);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (15991, 'Bebe', 'Spader', 834211, to_date('23-09-2018', 'dd-mm-yyyy'), 680338);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (77435, 'Arturo', 'Hampton', 120456, to_date('01-06-2018', 'dd-mm-yyyy'), 254665);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (11421, 'Rolando', 'Moriarty', 559384, to_date('25-04-2020', 'dd-mm-yyyy'), 644288);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (52122, 'Anthony', 'Cochran', 883483, to_date('17-04-2020', 'dd-mm-yyyy'), 132117);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (37214, 'Malcolm', 'Ronstadt', 636176, to_date('03-07-2019', 'dd-mm-yyyy'), 881220);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (78021, 'Angelina', 'Cara', 583546, to_date('03-05-2019', 'dd-mm-yyyy'), 345249);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (54237, 'Trini', 'Harrelson', 479144, to_date('15-06-2019', 'dd-mm-yyyy'), 172019);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (60975, 'Noah', 'Unger', 524009, to_date('22-05-2018', 'dd-mm-yyyy'), 548095);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (18665, 'Kylie', 'Chambers', 755417, to_date('31-03-2020', 'dd-mm-yyyy'), 874171);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (13199, 'Jeffery', 'MacLachlan', 995353, to_date('08-11-2019', 'dd-mm-yyyy'), 490824);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (34215, 'Cuba', 'Coe', 677386, to_date('25-04-2020', 'dd-mm-yyyy'), 666283);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (17133, 'Carlene', 'Himmelman', 486818, to_date('06-10-2019', 'dd-mm-yyyy'), 530541);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (12743, 'Glen', 'Cantrell', 228789, to_date('24-05-2018', 'dd-mm-yyyy'), 252974);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (86875, 'Mitchell', 'Willis', 824419, to_date('24-06-2018', 'dd-mm-yyyy'), 223124);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (15407, 'Beverley', 'Boone', 59077, to_date('18-04-2019', 'dd-mm-yyyy'), 382983);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (43070, 'Owen', 'Williams', 474168, to_date('24-05-2018', 'dd-mm-yyyy'), 898797);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (35651, 'Rosanne', 'Peet', 185317, to_date('23-10-2019', 'dd-mm-yyyy'), 538791);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (77955, 'Molly', 'Sayer', 750717, to_date('10-04-2020', 'dd-mm-yyyy'), 651581);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (79254, 'Betty', 'Braugher', 942812, to_date('27-03-2020', 'dd-mm-yyyy'), 355452);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (88957, 'Maureen', 'Condition', 404643, to_date('19-03-2020', 'dd-mm-yyyy'), 324048);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (36253, 'Vanessa', 'Sinatra', 194540, to_date('05-10-2019', 'dd-mm-yyyy'), 418757);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (74894, 'Burton', 'Vaughn', 693082, to_date('24-04-2020', 'dd-mm-yyyy'), 492110);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (60230, 'Charlton', 'Klugh', 49719, to_date('21-04-2020', 'dd-mm-yyyy'), 780744);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (96661, 'Marianne', 'Pleasence', 500346, to_date('05-05-2018', 'dd-mm-yyyy'), 468303);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (82993, 'Arturo', 'Griffiths', 412740, to_date('28-06-2018', 'dd-mm-yyyy'), 981193);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (77229, 'Nicolas', 'Isaak', 204329, to_date('16-01-2019', 'dd-mm-yyyy'), 447853);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (72588, 'Claire', 'Balin', 39712, to_date('16-05-2019', 'dd-mm-yyyy'), 490824);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (62231, 'Latin', 'Chaplin', 392789, to_date('11-06-2018', 'dd-mm-yyyy'), 986875);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (30583, 'Taye', 'Craven', 230336, to_date('31-05-2019', 'dd-mm-yyyy'), 587540);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (15224, 'Peter', 'Hudson', 537963, to_date('12-07-2018', 'dd-mm-yyyy'), 970247);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (66178, 'Jimmie', 'MacLachlan', 742089, to_date('29-04-2020', 'dd-mm-yyyy'), 657743);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (29210, 'Vendetta', 'Imperioli', 140149, to_date('19-05-2019', 'dd-mm-yyyy'), 885594);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (20691, 'Edward', 'Feuerstein', 211212, to_date('02-08-2018', 'dd-mm-yyyy'), 663505);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (51195, 'Faye', 'Blair', 17890, to_date('27-01-2019', 'dd-mm-yyyy'), 13539);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (91799, 'Milla', 'Hamilton', 755044, to_date('03-02-2020', 'dd-mm-yyyy'), 934802);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (67627, 'Robbie', 'Kimball', 356031, to_date('16-11-2018', 'dd-mm-yyyy'), 688837);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (43339, 'Colleen', 'Ricci', 502283, to_date('10-07-2018', 'dd-mm-yyyy'), 492110);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (58620, 'Mike', 'Gibson', 330021, to_date('16-02-2020', 'dd-mm-yyyy'), 662133);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (99077, 'Ritchie', 'Coyote', 736097, to_date('30-09-2019', 'dd-mm-yyyy'), 895410);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (45999, 'Peter', 'Bryson', 877403, to_date('12-06-2018', 'dd-mm-yyyy'), 662133);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (48230, 'Swoosie', 'Makeba', 29053, to_date('08-12-2019', 'dd-mm-yyyy'), 396819);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (77629, 'Cathy', 'Strathairn', 22202, to_date('06-01-2020', 'dd-mm-yyyy'), 740019);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (92304, 'Allan', 'Chao', 942985, to_date('22-07-2018', 'dd-mm-yyyy'), 514398);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (16205, 'Johnny', 'Idol', 616861, to_date('12-04-2020', 'dd-mm-yyyy'), 740019);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (47732, 'Cyndi', 'Bello', 50472, to_date('09-07-2019', 'dd-mm-yyyy'), 132174);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (57960, 'Coley', 'Wayans', 256350, to_date('31-05-2019', 'dd-mm-yyyy'), 468303);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (52234, 'Karon', 'Almond', 682047, to_date('14-04-2019', 'dd-mm-yyyy'), 604591);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (73550, 'Ronny', 'Gayle', 501867, to_date('18-04-2019', 'dd-mm-yyyy'), 501256);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (35727, 'Miko', 'Gertner', 53850, to_date('13-05-2018', 'dd-mm-yyyy'), 898797);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (12983, 'Isaiah', 'Pacino', 584215, to_date('19-01-2020', 'dd-mm-yyyy'), 158081);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (44293, 'Machine', 'Carlisle', 638625, to_date('04-08-2018', 'dd-mm-yyyy'), 252974);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (16894, 'Swoosie', 'Haysbert', 761135, to_date('10-02-2020', 'dd-mm-yyyy'), 355452);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (19045, 'Andy', 'Scott', 948135, to_date('01-02-2020', 'dd-mm-yyyy'), 158081);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (20880, 'Benicio', 'Neil', 385674, to_date('15-08-2018', 'dd-mm-yyyy'), 999825);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (56173, 'Billy', 'Chan', 401519, to_date('01-12-2018', 'dd-mm-yyyy'), 898797);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (56162, 'Emm', 'Shorter', 895807, to_date('17-02-2019', 'dd-mm-yyyy'), 898889);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (30714, 'Natascha', 'Reubens', 71304, to_date('07-04-2020', 'dd-mm-yyyy'), 747927);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (71581, 'Alannah', 'Shearer', 75955, to_date('06-05-2018', 'dd-mm-yyyy'), 223124);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (30283, 'April', 'Utada', 571032, to_date('24-08-2018', 'dd-mm-yyyy'), 885594);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (57097, 'Alec', 'Botti', 30586, to_date('19-06-2018', 'dd-mm-yyyy'), 981193);
commit;
prompt 100 records committed...
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (16722, 'Albert', 'Reilly', 395185, to_date('25-04-2019', 'dd-mm-yyyy'), 158081);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (50539, 'Crispin', 'Jackson', 395708, to_date('04-03-2019', 'dd-mm-yyyy'), 481007);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (39015, 'Taye', 'Burton', 277619, to_date('01-12-2019', 'dd-mm-yyyy'), 747927);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (55589, 'Brooke', 'Baldwin', 537463, to_date('28-11-2018', 'dd-mm-yyyy'), 428459);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (50538, 'Adina', 'Chao', 128454, to_date('21-04-2019', 'dd-mm-yyyy'), 780744);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (82948, 'Edward', 'Van Shelton', 325322, to_date('03-02-2020', 'dd-mm-yyyy'), 740019);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (33308, 'Lenny', 'Caviezel', 985695, to_date('01-12-2019', 'dd-mm-yyyy'), 893153);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (26426, 'Mary Beth', 'Coyote', 252225, to_date('10-09-2019', 'dd-mm-yyyy'), 604591);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (92082, 'Linda', 'White', 446124, to_date('13-12-2019', 'dd-mm-yyyy'), 127305);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (44500, 'Rodney', 'Hornsby', 352396, to_date('08-07-2019', 'dd-mm-yyyy'), 530146);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (57469, 'Kylie', 'Salt', 974610, to_date('07-01-2020', 'dd-mm-yyyy'), 172019);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (63822, 'Murray', 'Chaykin', 431371, to_date('25-03-2019', 'dd-mm-yyyy'), 970247);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (60388, 'Elle', 'Wright', 21274, to_date('22-03-2019', 'dd-mm-yyyy'), 132174);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (37255, 'Denzel', 'Gallagher', 248771, to_date('14-03-2020', 'dd-mm-yyyy'), 60781);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (45722, 'Stewart', 'Matheson', 776340, to_date('26-07-2019', 'dd-mm-yyyy'), 157219);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (83548, 'Rich', 'Edmunds', 414607, to_date('01-08-2019', 'dd-mm-yyyy'), 960709);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (21659, 'Jeremy', 'Spacek', 722329, to_date('14-10-2018', 'dd-mm-yyyy'), 830541);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (51747, 'Isaiah', 'Sevigny', 561026, to_date('30-08-2019', 'dd-mm-yyyy'), 658705);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (48454, 'Toshiro', 'Himmelman', 496916, to_date('19-09-2019', 'dd-mm-yyyy'), 770561);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (69017, 'Katrin', 'Holden', 695576, to_date('09-11-2019', 'dd-mm-yyyy'), 35646);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (46947, 'Tzi', 'Hanks', 576645, to_date('21-10-2018', 'dd-mm-yyyy'), 436292);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (28894, 'Liv', 'Hynde', 435856, to_date('10-08-2019', 'dd-mm-yyyy'), 42392);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (48633, 'Drew', 'LuPone', 886121, to_date('02-02-2019', 'dd-mm-yyyy'), 311995);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (16175, 'Embeth', 'Whitley', 710975, to_date('24-03-2020', 'dd-mm-yyyy'), 594338);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (36167, 'Charlie', 'McCracken', 838709, to_date('10-03-2019', 'dd-mm-yyyy'), 942351);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (27820, 'Bradley', 'Barry', 489215, to_date('09-04-2020', 'dd-mm-yyyy'), 436292);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (81348, 'Katrin', 'Mellencamp', 467499, to_date('07-09-2019', 'dd-mm-yyyy'), 514398);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (14530, 'Tamala', 'Robards', 675715, to_date('16-11-2018', 'dd-mm-yyyy'), 478619);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (97671, 'Martin', 'Young', 788704, to_date('14-12-2018', 'dd-mm-yyyy'), 864357);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (48180, 'Xander', 'Tanon', 865661, to_date('16-03-2020', 'dd-mm-yyyy'), 643069);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (41966, 'Ving', 'Cummings', 98186, to_date('14-10-2019', 'dd-mm-yyyy'), 234201);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (24166, 'Balthazar', 'Li', 209284, to_date('21-06-2018', 'dd-mm-yyyy'), 158081);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (25093, 'Rosco', 'Conroy', 664747, to_date('14-09-2019', 'dd-mm-yyyy'), 33437);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (68077, 'Laurie', 'Kirkwood', 721776, to_date('02-06-2018', 'dd-mm-yyyy'), 357783);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (30853, 'Spencer', 'Marx', 835617, to_date('24-04-2019', 'dd-mm-yyyy'), 643069);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (11090, 'Rik', 'Ripley', 605969, to_date('25-06-2019', 'dd-mm-yyyy'), 490824);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (35691, 'Rascal', 'Rauhofer', 709565, to_date('16-11-2019', 'dd-mm-yyyy'), 405104);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (1, 'Alice', 'Johnson', 1, to_date('20-05-2024', 'dd-mm-yyyy'), 1);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (601, 'Ethan', 'Brown', 501, to_date('01-01-2024', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (602, 'Olivia', 'Wilson', 501, to_date('01-02-2024', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (603, 'William', 'Garcia', 502, to_date('01-03-2024', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (604, 'Sophia', 'Martinez', 502, to_date('01-04-2024', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (605, 'James', 'Lopez', 503, to_date('01-05-2024', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (606, 'Michael', 'Gonzalez', 503, to_date('01-06-2024', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (607, 'Olivia', 'Wilson', 504, to_date('01-07-2024', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (608, 'William', 'Garcia', 504, to_date('01-08-2024', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (609, 'Sophia', 'Martinez', 505, to_date('01-09-2024', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (610, 'James', 'Lopez', 505, to_date('01-10-2024', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (611, 'Michael', 'Gonzalez', 506, to_date('01-11-2024', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (612, 'Olivia', 'Wilson', 506, to_date('01-12-2024', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (613, 'William', 'Garcia', 507, to_date('01-01-2025', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (614, 'Sophia', 'Martinez', 507, to_date('01-02-2025', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (615, 'James', 'Lopez', 508, to_date('01-03-2025', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (616, 'Michael', 'Gonzalez', 508, to_date('01-04-2025', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (617, 'Olivia', 'Wilson', 509, to_date('01-05-2025', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (618, 'William', 'Garcia', 509, to_date('01-06-2025', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (619, 'Sophia', 'Martinez', 510, to_date('01-07-2025', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (620, 'James', 'Lopez', 510, to_date('01-08-2025', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (621, 'Michael', 'Gonzalez', 511, to_date('01-09-2025', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (622, 'Olivia', 'Wilson', 511, to_date('01-10-2025', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (623, 'William', 'Garcia', 512, to_date('01-11-2025', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (624, 'Sophia', 'Martinez', 512, to_date('01-12-2025', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (625, 'James', 'Lopez', 513, to_date('01-01-2026', 'dd-mm-yyyy'), null);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (2, 'Tanner', 'Braben', 2, to_date('15-07-2019', 'dd-mm-yyyy'), 2);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (3, 'Gretna', 'Mathew', 3, to_date('30-05-2018', 'dd-mm-yyyy'), 3);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (4, 'Jerrilyn', 'Korfmann', 4, to_date('02-03-2022', 'dd-mm-yyyy'), 4);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (5, 'Ardys', 'Bostick', 5, to_date('06-04-2024', 'dd-mm-yyyy'), 5);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (6, 'Mikey', 'Hammant', 6, to_date('28-09-2014', 'dd-mm-yyyy'), 6);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (7, 'Rory', 'Summerlee', 7, to_date('24-09-2015', 'dd-mm-yyyy'), 7);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (8, 'Quentin', 'GiacobbiniJacob', 8, to_date('04-05-2020', 'dd-mm-yyyy'), 8);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (9, 'Sly', 'Rawcliff', 9, to_date('21-03-2017', 'dd-mm-yyyy'), 9);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (10, 'Phillipp', 'Andrysiak', 10, to_date('05-02-2018', 'dd-mm-yyyy'), 10);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (11, 'Doyle', 'Jarrelt', 11, to_date('20-08-2014', 'dd-mm-yyyy'), 11);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (12, 'Rica', 'Nardi', 12, to_date('03-11-2018', 'dd-mm-yyyy'), 12);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (13, 'Peter', 'Ebden', 13, to_date('09-02-2020', 'dd-mm-yyyy'), 13);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (14, 'Portie', 'Hanford', 14, to_date('12-11-2011', 'dd-mm-yyyy'), 14);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (15, 'Jeremiah', 'Hayden', 15, to_date('21-01-2019', 'dd-mm-yyyy'), 15);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (16, 'Mavra', 'Quarrie', 16, to_date('20-01-2015', 'dd-mm-yyyy'), 16);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (17, 'Karim', 'Walbrun', 17, to_date('15-08-2021', 'dd-mm-yyyy'), 17);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (18, 'Cornelia', 'Sustin', 18, to_date('24-06-2018', 'dd-mm-yyyy'), 18);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (19, 'Sterling', 'Heineke', 19, to_date('30-05-2023', 'dd-mm-yyyy'), 19);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (20, 'Abbi', 'Ferrant', 20, to_date('07-01-2015', 'dd-mm-yyyy'), 20);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (21, 'Gwenette', 'Sennett', 21, to_date('14-06-2023', 'dd-mm-yyyy'), 21);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (22, 'Hazel', 'Rowntree', 22, to_date('18-10-2021', 'dd-mm-yyyy'), 22);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (23, 'Gustave', 'Dibley', 23, to_date('12-08-2012', 'dd-mm-yyyy'), 23);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (24, 'Cos', 'Dettmar', 24, to_date('26-10-2014', 'dd-mm-yyyy'), 24);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (25, 'Lind', 'O''Mara', 25, to_date('01-04-2016', 'dd-mm-yyyy'), 25);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (26, 'Wash', 'Beddin', 26, to_date('15-07-2022', 'dd-mm-yyyy'), 26);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (27, 'Lindsey', 'Ackland', 27, to_date('28-11-2016', 'dd-mm-yyyy'), 27);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (28, 'Flory', 'Fassan', 28, to_date('20-12-2019', 'dd-mm-yyyy'), 28);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (29, 'Gerry', 'MacTeague', 29, to_date('20-10-2019', 'dd-mm-yyyy'), 29);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (30, 'Percy', 'Stallworthy', 30, to_date('01-04-2014', 'dd-mm-yyyy'), 30);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (31, 'Neilla', 'Alvarado', 31, to_date('16-10-2015', 'dd-mm-yyyy'), 31);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (32, 'Ase', 'Biernacki', 32, to_date('15-11-2017', 'dd-mm-yyyy'), 32);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (33, 'Jared', 'Kirkness', 33, to_date('31-03-2024', 'dd-mm-yyyy'), 33);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (34, 'Shel', 'Constable', 34, to_date('31-01-2018', 'dd-mm-yyyy'), 34);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (35, 'Brice', 'MacKeever', 35, to_date('29-07-2011', 'dd-mm-yyyy'), 35);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (36, 'Gill', 'Klemz', 36, to_date('24-01-2021', 'dd-mm-yyyy'), 36);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (37, 'Maris', 'Churms', 37, to_date('18-09-2017', 'dd-mm-yyyy'), 37);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (38, 'Karoly', 'Birt', 38, to_date('31-03-2023', 'dd-mm-yyyy'), 38);
commit;
prompt 200 records committed...
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (39, 'Johan', 'Noyce', 39, to_date('26-01-2024', 'dd-mm-yyyy'), 39);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (40, 'Peggie', 'Bulbrook', 40, to_date('25-09-2013', 'dd-mm-yyyy'), 40);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (41, 'Layney', 'Clayborn', 41, to_date('27-06-2017', 'dd-mm-yyyy'), 41);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (42, 'Hoyt', 'Formilli', 42, to_date('14-12-2013', 'dd-mm-yyyy'), 42);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (43, 'Culley', 'Zwicker', 43, to_date('22-08-2022', 'dd-mm-yyyy'), 43);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (44, 'Shaylynn', 'Gully', 44, to_date('02-02-2014', 'dd-mm-yyyy'), 44);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (45, 'Obed', 'Kennet', 45, to_date('09-09-2015', 'dd-mm-yyyy'), 45);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (46, 'Dion', 'Jordan', 46, to_date('12-10-2020', 'dd-mm-yyyy'), 46);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (47, 'Anna-diana', 'Esmond', 47, to_date('01-12-2018', 'dd-mm-yyyy'), 47);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (48, 'Jorie', 'Issard', 48, to_date('15-02-2018', 'dd-mm-yyyy'), 48);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (49, 'Irma', 'Macveigh', 49, to_date('29-12-2018', 'dd-mm-yyyy'), 49);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (50, 'Flora', 'Frend', 50, to_date('30-12-2017', 'dd-mm-yyyy'), 50);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (51, 'Dorie', 'Benko', 51, to_date('13-08-2018', 'dd-mm-yyyy'), 51);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (52, 'Justino', 'Guillem', 52, to_date('25-09-2019', 'dd-mm-yyyy'), 52);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (53, 'Mia', 'Claydon', 53, to_date('08-12-2020', 'dd-mm-yyyy'), 53);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (54, 'Elijah', 'Pafford', 54, to_date('04-08-2016', 'dd-mm-yyyy'), 54);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (55, 'Emiline', 'Linnitt', 55, to_date('03-10-2014', 'dd-mm-yyyy'), 55);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (56, 'Rogers', 'Clementucci', 56, to_date('22-05-2023', 'dd-mm-yyyy'), 56);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (57, 'Edin', 'Lilburne', 57, to_date('12-06-2017', 'dd-mm-yyyy'), 57);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (58, 'Stacee', 'Delahunt', 58, to_date('01-02-2018', 'dd-mm-yyyy'), 58);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (59, 'Philomena', 'Colchett', 59, to_date('07-05-2017', 'dd-mm-yyyy'), 59);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (60, 'Jacquette', 'Stirgess', 60, to_date('21-03-2014', 'dd-mm-yyyy'), 60);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (61, 'Ladonna', 'Milesop', 61, to_date('17-01-2016', 'dd-mm-yyyy'), 61);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (62, 'Jesse', 'Gonnely', 62, to_date('29-06-2010', 'dd-mm-yyyy'), 62);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (63, 'Elmira', 'Kenrack', 63, to_date('27-12-2016', 'dd-mm-yyyy'), 63);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (64, 'Carlen', 'Hutchinges', 64, to_date('06-06-2022', 'dd-mm-yyyy'), 64);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (65, 'Theodore', 'Birtchnell', 65, to_date('08-07-2016', 'dd-mm-yyyy'), 65);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (66, 'Lorenza', 'Khidr', 66, to_date('16-07-2019', 'dd-mm-yyyy'), 66);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (67, 'Reidar', 'Brackpool', 67, to_date('13-09-2011', 'dd-mm-yyyy'), 67);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (68, 'Eldin', 'Borchardt', 68, to_date('16-12-2023', 'dd-mm-yyyy'), 68);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (69, 'Orin', 'Chrippes', 69, to_date('11-04-2022', 'dd-mm-yyyy'), 69);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (70, 'Aeriell', 'Stutely', 70, to_date('16-05-2015', 'dd-mm-yyyy'), 70);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (71, 'Angelico', 'Charlin', 71, to_date('26-02-2013', 'dd-mm-yyyy'), 71);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (72, 'Elaina', 'Borthwick', 72, to_date('22-02-2023', 'dd-mm-yyyy'), 72);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (73, 'Adele', 'Frigout', 73, to_date('08-12-2021', 'dd-mm-yyyy'), 73);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (74, 'Robinet', 'Ebbitt', 74, to_date('05-07-2013', 'dd-mm-yyyy'), 74);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (75, 'Kelila', 'Wych', 75, to_date('13-12-2016', 'dd-mm-yyyy'), 75);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (76, 'Madella', 'Dissman', 76, to_date('04-03-2024', 'dd-mm-yyyy'), 76);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (77, 'Morissa', 'MacDowal', 77, to_date('17-03-2016', 'dd-mm-yyyy'), 77);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (78, 'Lilli', 'McCaskill', 78, to_date('27-04-2022', 'dd-mm-yyyy'), 78);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (79, 'Marven', 'Mattingley', 79, to_date('03-02-2012', 'dd-mm-yyyy'), 79);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (80, 'Lexie', 'Josupeit', 80, to_date('04-09-2011', 'dd-mm-yyyy'), 80);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (81, 'Hali', 'Mincher', 81, to_date('12-09-2021', 'dd-mm-yyyy'), 81);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (82, 'Isacco', 'Pheasant', 82, to_date('31-07-2014', 'dd-mm-yyyy'), 82);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (83, 'Flossy', 'Rabbage', 83, to_date('26-06-2023', 'dd-mm-yyyy'), 83);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (84, 'Llewellyn', 'Sodory', 84, to_date('13-04-2021', 'dd-mm-yyyy'), 84);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (85, 'Stanly', 'Fairman', 85, to_date('01-06-2021', 'dd-mm-yyyy'), 85);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (86, 'Catharina', 'Dines', 86, to_date('04-12-2017', 'dd-mm-yyyy'), 86);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (87, 'Zorina', 'Avrahamoff', 87, to_date('02-03-2022', 'dd-mm-yyyy'), 87);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (88, 'Celene', 'O''Shiels', 88, to_date('11-10-2015', 'dd-mm-yyyy'), 88);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (89, 'Kirby', 'Rodman', 89, to_date('13-12-2019', 'dd-mm-yyyy'), 89);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (90, 'Mile', 'Shearstone', 90, to_date('23-12-2013', 'dd-mm-yyyy'), 90);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (91, 'Clay', 'Scrannage', 91, to_date('11-03-2021', 'dd-mm-yyyy'), 91);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (92, 'Chrysler', 'Pickton', 92, to_date('13-05-2024', 'dd-mm-yyyy'), 92);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (93, 'Marven', 'Insole', 93, to_date('11-10-2021', 'dd-mm-yyyy'), 93);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (94, 'Matthiew', 'Lowrance', 94, to_date('02-03-2012', 'dd-mm-yyyy'), 94);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (95, 'Barrie', 'Neubigging', 95, to_date('20-09-2015', 'dd-mm-yyyy'), 95);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (96, 'Laird', 'Fenny', 96, to_date('01-12-2013', 'dd-mm-yyyy'), 96);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (97, 'Buck', 'Farman', 97, to_date('18-04-2016', 'dd-mm-yyyy'), 97);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (98, 'Joscelin', 'Leming', 98, to_date('27-09-2020', 'dd-mm-yyyy'), 98);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (99, 'Felicia', 'Lammerding', 99, to_date('12-02-2017', 'dd-mm-yyyy'), 99);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (100, 'Sybyl', 'Boldero', 100, to_date('22-11-2017', 'dd-mm-yyyy'), 100);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (101, 'Benetta', 'Tevlin', 101, to_date('31-10-2022', 'dd-mm-yyyy'), 101);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (102, 'Randy', 'Batt', 102, to_date('19-02-2015', 'dd-mm-yyyy'), 102);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (103, 'Rurik', 'Horney', 103, to_date('10-08-2019', 'dd-mm-yyyy'), 103);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (104, 'Troy', 'Mullender', 104, to_date('12-03-2024', 'dd-mm-yyyy'), 104);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (105, 'Barbara-anne', 'Kenwyn', 105, to_date('11-11-2013', 'dd-mm-yyyy'), 105);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (106, 'Colleen', 'Key', 106, to_date('13-06-2023', 'dd-mm-yyyy'), 106);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (107, 'Maud', 'Rowney', 107, to_date('12-05-2012', 'dd-mm-yyyy'), 107);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (108, 'Cam', 'Belf', 108, to_date('30-03-2014', 'dd-mm-yyyy'), 108);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (109, 'Casie', 'Verbruggen', 109, to_date('26-05-2016', 'dd-mm-yyyy'), 109);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (110, 'Jo', 'Hansom', 110, to_date('05-11-2015', 'dd-mm-yyyy'), 110);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (111, 'Berta', 'Mulloch', 111, to_date('22-07-2022', 'dd-mm-yyyy'), 111);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (112, 'Halimeda', 'Plumb', 112, to_date('18-07-2020', 'dd-mm-yyyy'), 112);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (113, 'Kimball', 'Monro', 113, to_date('25-06-2016', 'dd-mm-yyyy'), 113);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (114, 'Gil', 'Sponer', 114, to_date('01-03-2014', 'dd-mm-yyyy'), 114);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (115, 'Fayette', 'Palfree', 115, to_date('08-12-2019', 'dd-mm-yyyy'), 115);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (116, 'Ingelbert', 'Sangwine', 116, to_date('29-01-2012', 'dd-mm-yyyy'), 116);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (117, 'Melisandra', 'McCane', 117, to_date('02-11-2011', 'dd-mm-yyyy'), 117);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (118, 'Ciro', 'Roocroft', 118, to_date('06-07-2017', 'dd-mm-yyyy'), 118);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (119, 'Mureil', 'Govier', 119, to_date('19-12-2021', 'dd-mm-yyyy'), 119);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (120, 'Addison', 'Castagnet', 120, to_date('21-07-2010', 'dd-mm-yyyy'), 120);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (121, 'Nicolis', 'Willas', 121, to_date('02-01-2020', 'dd-mm-yyyy'), 121);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (122, 'Corri', 'O''Dunniom', 122, to_date('11-01-2016', 'dd-mm-yyyy'), 122);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (123, 'Alidia', 'Wilsdon', 123, to_date('06-01-2017', 'dd-mm-yyyy'), 123);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (124, 'Nikos', 'Isakovitch', 124, to_date('19-03-2023', 'dd-mm-yyyy'), 124);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (125, 'Eddie', 'MacClancey', 125, to_date('10-05-2019', 'dd-mm-yyyy'), 125);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (126, 'Octavia', 'Mason', 126, to_date('14-10-2011', 'dd-mm-yyyy'), 126);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (127, 'Lotte', 'Yukhov', 127, to_date('19-06-2020', 'dd-mm-yyyy'), 127);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (128, 'Boothe', 'Hawtry', 128, to_date('14-07-2014', 'dd-mm-yyyy'), 128);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (129, 'Taite', 'Duffin', 129, to_date('31-07-2014', 'dd-mm-yyyy'), 129);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (130, 'Darby', 'Trousdell', 130, to_date('04-08-2014', 'dd-mm-yyyy'), 130);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (131, 'Bethanne', 'Spurgin', 131, to_date('11-01-2022', 'dd-mm-yyyy'), 131);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (132, 'Queenie', 'Robeiro', 132, to_date('10-05-2014', 'dd-mm-yyyy'), 132);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (133, 'Zared', 'Whitrod', 133, to_date('14-12-2012', 'dd-mm-yyyy'), 133);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (134, 'Renado', 'Getty', 134, to_date('11-07-2020', 'dd-mm-yyyy'), 134);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (135, 'Susanne', 'Begbie', 135, to_date('31-08-2014', 'dd-mm-yyyy'), 135);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (136, 'Jarrad', 'Dagon', 136, to_date('23-04-2023', 'dd-mm-yyyy'), 136);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (137, 'Logan', 'MacFadzean', 137, to_date('02-05-2018', 'dd-mm-yyyy'), 137);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (138, 'Pauletta', 'Olenikov', 138, to_date('08-08-2010', 'dd-mm-yyyy'), 138);
commit;
prompt 300 records committed...
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (139, 'Kamila', 'Kildea', 139, to_date('19-09-2012', 'dd-mm-yyyy'), 139);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (140, 'Corissa', 'Cunah', 140, to_date('05-08-2011', 'dd-mm-yyyy'), 140);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (141, 'Marcelia', 'Schindler', 141, to_date('27-04-2018', 'dd-mm-yyyy'), 141);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (142, 'Mollie', 'Beedham', 142, to_date('04-04-2015', 'dd-mm-yyyy'), 142);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (143, 'Davon', 'Housley', 143, to_date('25-02-2017', 'dd-mm-yyyy'), 143);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (144, 'Ulla', 'Seemmonds', 144, to_date('03-07-2020', 'dd-mm-yyyy'), 144);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (145, 'Lanae', 'Finci', 145, to_date('19-12-2018', 'dd-mm-yyyy'), 145);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (146, 'Elissa', 'Charnock', 146, to_date('17-06-2012', 'dd-mm-yyyy'), 146);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (147, 'Philippine', 'Grob', 147, to_date('18-02-2023', 'dd-mm-yyyy'), 147);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (148, 'Frannie', 'Francom', 148, to_date('20-03-2024', 'dd-mm-yyyy'), 148);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (149, 'Maridel', 'Guyon', 149, to_date('04-10-2013', 'dd-mm-yyyy'), 149);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (150, 'Toddie', 'Tomaino', 150, to_date('11-02-2016', 'dd-mm-yyyy'), 150);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (151, 'Noella', 'Jinkins', 151, to_date('19-09-2012', 'dd-mm-yyyy'), 151);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (152, 'Thorin', 'Keri', 152, to_date('16-08-2016', 'dd-mm-yyyy'), 152);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (153, 'Gallard', 'Nottingam', 153, to_date('24-11-2019', 'dd-mm-yyyy'), 153);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (154, 'Otes', 'Egan', 154, to_date('03-12-2011', 'dd-mm-yyyy'), 154);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (155, 'Bobbye', 'Bolstridge', 155, to_date('23-03-2023', 'dd-mm-yyyy'), 155);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (156, 'Ricoriki', 'Shakelade', 156, to_date('24-06-2010', 'dd-mm-yyyy'), 156);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (157, 'Malory', 'Reuven', 157, to_date('18-06-2010', 'dd-mm-yyyy'), 157);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (158, 'Edsel', 'Marjanski', 158, to_date('18-11-2010', 'dd-mm-yyyy'), 158);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (159, 'Ibbie', 'Mussared', 159, to_date('22-08-2019', 'dd-mm-yyyy'), 159);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (160, 'Alexa', 'Dedon', 160, to_date('24-08-2013', 'dd-mm-yyyy'), 160);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (161, 'Gaile', 'Ilyuchyov', 161, to_date('04-05-2024', 'dd-mm-yyyy'), 161);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (162, 'Saundra', 'Fronsek', 162, to_date('16-10-2010', 'dd-mm-yyyy'), 162);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (163, 'Amerigo', 'Geroldo', 163, to_date('17-03-2018', 'dd-mm-yyyy'), 163);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (164, 'Fifi', 'Buntine', 164, to_date('24-03-2020', 'dd-mm-yyyy'), 164);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (165, 'Faustine', 'Caps', 165, to_date('21-04-2014', 'dd-mm-yyyy'), 165);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (166, 'Whitney', 'Checchetelli', 166, to_date('25-05-2013', 'dd-mm-yyyy'), 166);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (167, 'Vladamir', 'Caffery', 167, to_date('29-09-2012', 'dd-mm-yyyy'), 167);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (168, 'Trumann', 'Tomlinson', 168, to_date('05-08-2015', 'dd-mm-yyyy'), 168);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (169, 'Hamel', 'Crystal', 169, to_date('21-09-2013', 'dd-mm-yyyy'), 169);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (170, 'Linnea', 'Huckett', 170, to_date('31-01-2013', 'dd-mm-yyyy'), 170);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (171, 'Guthrey', 'Cardillo', 171, to_date('19-01-2014', 'dd-mm-yyyy'), 171);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (172, 'Dorian', 'Reddlesden', 172, to_date('30-10-2018', 'dd-mm-yyyy'), 172);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (173, 'Munmro', 'Eastabrook', 173, to_date('27-07-2023', 'dd-mm-yyyy'), 173);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (174, 'Bobby', 'Marrows', 174, to_date('22-09-2012', 'dd-mm-yyyy'), 174);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (175, 'Grange', 'De Goey', 175, to_date('28-09-2010', 'dd-mm-yyyy'), 175);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (176, 'Glendon', 'Lebrun', 176, to_date('11-05-2014', 'dd-mm-yyyy'), 176);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (177, 'Susy', 'Sander', 177, to_date('10-10-2015', 'dd-mm-yyyy'), 177);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (178, 'Lorrie', 'Durant', 178, to_date('17-03-2023', 'dd-mm-yyyy'), 178);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (179, 'Margery', 'Bertelet', 179, to_date('12-01-2022', 'dd-mm-yyyy'), 179);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (180, 'Reg', 'Basson', 180, to_date('26-12-2022', 'dd-mm-yyyy'), 180);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (181, 'Lynnette', 'Meconi', 181, to_date('10-04-2013', 'dd-mm-yyyy'), 181);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (182, 'Drucill', 'Winterbourne', 182, to_date('22-04-2023', 'dd-mm-yyyy'), 182);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (183, 'Brigham', 'Talbot', 183, to_date('21-11-2020', 'dd-mm-yyyy'), 183);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (184, 'Alys', 'Birdall', 184, to_date('28-11-2023', 'dd-mm-yyyy'), 184);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (185, 'Lucius', 'Zumbusch', 185, to_date('12-01-2024', 'dd-mm-yyyy'), 185);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (186, 'Rogerio', 'Perrie', 186, to_date('29-08-2018', 'dd-mm-yyyy'), 186);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (187, 'Urbano', 'Behninck', 187, to_date('24-03-2021', 'dd-mm-yyyy'), 187);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (188, 'Tammie', 'Bineham', 188, to_date('15-07-2013', 'dd-mm-yyyy'), 188);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (189, 'Osborne', 'Bratley', 189, to_date('08-10-2011', 'dd-mm-yyyy'), 189);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (190, 'Mellicent', 'Reavell', 190, to_date('05-10-2023', 'dd-mm-yyyy'), 190);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (191, 'Latia', 'Wands', 191, to_date('10-01-2015', 'dd-mm-yyyy'), 191);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (192, 'Gill', 'Mettetal', 192, to_date('05-10-2012', 'dd-mm-yyyy'), 192);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (193, 'Elvira', 'Christensen', 193, to_date('07-05-2022', 'dd-mm-yyyy'), 193);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (194, 'Lita', 'Rickersy', 194, to_date('03-03-2017', 'dd-mm-yyyy'), 194);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (195, 'Alta', 'Krikorian', 195, to_date('14-12-2020', 'dd-mm-yyyy'), 195);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (196, 'Cristiano', 'Farney', 196, to_date('27-08-2012', 'dd-mm-yyyy'), 196);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (197, 'Pierre', 'Kalkofer', 197, to_date('14-07-2019', 'dd-mm-yyyy'), 197);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (198, 'Quinn', 'Bonass', 198, to_date('28-11-2022', 'dd-mm-yyyy'), 198);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (199, 'Heriberto', 'Barrowcliff', 199, to_date('11-06-2015', 'dd-mm-yyyy'), 199);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (200, 'Melva', 'Poulsen', 200, to_date('10-11-2023', 'dd-mm-yyyy'), 200);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (201, 'Chrissy', 'Danniell', 201, to_date('25-01-2011', 'dd-mm-yyyy'), 201);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (202, 'Ruth', 'Thorndycraft', 202, to_date('10-06-2013', 'dd-mm-yyyy'), 202);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (203, 'Mycah', 'Tellwright', 203, to_date('11-09-2013', 'dd-mm-yyyy'), 203);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (204, 'Cullie', 'Suffe', 204, to_date('07-10-2019', 'dd-mm-yyyy'), 204);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (205, 'Roxie', 'Cowperthwaite', 205, to_date('30-11-2014', 'dd-mm-yyyy'), 205);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (206, 'Ingemar', 'Pehrsson', 206, to_date('08-01-2011', 'dd-mm-yyyy'), 206);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (207, 'Mitchel', 'Calverd', 207, to_date('05-12-2012', 'dd-mm-yyyy'), 207);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (208, 'Steward', 'Glazzard', 208, to_date('08-04-2020', 'dd-mm-yyyy'), 208);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (209, 'Austina', 'Pitsall', 209, to_date('21-03-2024', 'dd-mm-yyyy'), 209);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (210, 'Jenda', 'Paffett', 210, to_date('14-01-2023', 'dd-mm-yyyy'), 210);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (211, 'Timmi', 'Brome', 211, to_date('18-01-2013', 'dd-mm-yyyy'), 211);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (212, 'Patrice', 'Bolgar', 212, to_date('07-07-2016', 'dd-mm-yyyy'), 212);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (213, 'Charley', 'Moyser', 213, to_date('12-01-2014', 'dd-mm-yyyy'), 213);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (214, 'Sallyann', 'Philo', 214, to_date('16-12-2015', 'dd-mm-yyyy'), 214);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (215, 'Woodman', 'Gianulli', 215, to_date('23-03-2015', 'dd-mm-yyyy'), 215);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (216, 'Katine', 'Vardon', 216, to_date('09-07-2010', 'dd-mm-yyyy'), 216);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (217, 'Fitzgerald', 'Godball', 217, to_date('29-01-2022', 'dd-mm-yyyy'), 217);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (218, 'Neil', 'De Witt', 218, to_date('31-07-2014', 'dd-mm-yyyy'), 218);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (219, 'Elicia', 'Luety', 219, to_date('24-03-2023', 'dd-mm-yyyy'), 219);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (220, 'Candida', 'Rothermel', 220, to_date('26-11-2015', 'dd-mm-yyyy'), 220);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (221, 'Cheston', 'Swynfen', 221, to_date('09-08-2020', 'dd-mm-yyyy'), 221);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (222, 'Nye', 'Tuckey', 222, to_date('10-12-2016', 'dd-mm-yyyy'), 222);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (223, 'Gabbi', 'Gillford', 223, to_date('08-02-2020', 'dd-mm-yyyy'), 223);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (224, 'Ali', 'Neiland', 224, to_date('02-10-2011', 'dd-mm-yyyy'), 224);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (225, 'Ainsley', 'Sewart', 225, to_date('04-07-2017', 'dd-mm-yyyy'), 225);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (226, 'David', 'Welford', 226, to_date('26-07-2012', 'dd-mm-yyyy'), 226);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (227, 'Rosalind', 'Ringsell', 227, to_date('08-01-2014', 'dd-mm-yyyy'), 227);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (228, 'Veronika', 'Colleymore', 228, to_date('11-09-2013', 'dd-mm-yyyy'), 228);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (229, 'Zacherie', 'Begent', 229, to_date('28-10-2017', 'dd-mm-yyyy'), 229);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (230, 'Forest', 'Coleman', 230, to_date('07-01-2014', 'dd-mm-yyyy'), 230);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (231, 'Drusilla', 'Fardo', 231, to_date('02-07-2022', 'dd-mm-yyyy'), 231);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (232, 'Anselma', 'Laweles', 232, to_date('07-05-2017', 'dd-mm-yyyy'), 232);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (233, 'Ninnette', 'Forryan', 233, to_date('19-11-2019', 'dd-mm-yyyy'), 233);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (234, 'Iris', 'Masterson', 234, to_date('27-09-2018', 'dd-mm-yyyy'), 234);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (235, 'Nancie', 'Matkin', 235, to_date('08-04-2019', 'dd-mm-yyyy'), 235);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (236, 'Tansy', 'Lidstone', 236, to_date('27-03-2019', 'dd-mm-yyyy'), 236);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (237, 'Dania', 'Jedrych', 237, to_date('24-04-2016', 'dd-mm-yyyy'), 237);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (238, 'Galvin', 'Wrates', 238, to_date('11-05-2023', 'dd-mm-yyyy'), 238);
commit;
prompt 400 records committed...
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (239, 'Binnie', 'Hovey', 239, to_date('06-03-2023', 'dd-mm-yyyy'), 239);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (240, 'Viv', 'Tilbey', 240, to_date('12-09-2018', 'dd-mm-yyyy'), 240);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (241, 'Valida', 'Phoebe', 241, to_date('09-07-2016', 'dd-mm-yyyy'), 241);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (242, 'Dru', 'Tewkesbury', 242, to_date('07-10-2017', 'dd-mm-yyyy'), 242);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (243, 'Kincaid', 'Baccas', 243, to_date('09-06-2017', 'dd-mm-yyyy'), 243);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (244, 'Charity', 'Cauley', 244, to_date('16-10-2016', 'dd-mm-yyyy'), 244);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (245, 'Colman', 'Jeannequin', 245, to_date('19-08-2016', 'dd-mm-yyyy'), 245);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (246, 'Vassily', 'Duferie', 246, to_date('30-01-2020', 'dd-mm-yyyy'), 246);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (247, 'Rina', 'McCarlich', 247, to_date('28-02-2012', 'dd-mm-yyyy'), 247);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (248, 'Gordon', 'Filipychev', 248, to_date('21-01-2011', 'dd-mm-yyyy'), 248);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (249, 'Shir', 'Paff', 249, to_date('24-08-2011', 'dd-mm-yyyy'), 249);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (250, 'Rick', 'Kolinsky', 250, to_date('04-06-2023', 'dd-mm-yyyy'), 250);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (251, 'Rutter', 'Meneghi', 251, to_date('07-12-2018', 'dd-mm-yyyy'), 251);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (252, 'Jeanette', 'Lourens', 252, to_date('28-02-2022', 'dd-mm-yyyy'), 252);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (253, 'Rasia', 'Vasile', 253, to_date('01-08-2013', 'dd-mm-yyyy'), 253);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (254, 'Kizzee', 'Pashbee', 254, to_date('01-01-2018', 'dd-mm-yyyy'), 254);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (255, 'Barbe', 'Morten', 255, to_date('31-12-2015', 'dd-mm-yyyy'), 255);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (256, 'Philippe', 'McMenamie', 256, to_date('26-07-2016', 'dd-mm-yyyy'), 256);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (257, 'Auroora', 'Torrejon', 257, to_date('15-02-2011', 'dd-mm-yyyy'), 257);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (258, 'Sarette', 'Gunter', 258, to_date('02-04-2017', 'dd-mm-yyyy'), 258);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (259, 'Wash', 'Courtes', 259, to_date('06-12-2018', 'dd-mm-yyyy'), 259);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (260, 'Austine', 'Farley', 260, to_date('17-07-2021', 'dd-mm-yyyy'), 260);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (261, 'Melodee', 'Barhims', 261, to_date('17-12-2013', 'dd-mm-yyyy'), 261);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (262, 'Blondie', 'Gurnett', 262, to_date('16-05-2019', 'dd-mm-yyyy'), 262);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (263, 'Car', 'Stolle', 263, to_date('28-03-2018', 'dd-mm-yyyy'), 263);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (264, 'Bart', 'Tuffield', 264, to_date('15-06-2016', 'dd-mm-yyyy'), 264);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (265, 'Shalna', 'Konrad', 265, to_date('22-10-2015', 'dd-mm-yyyy'), 265);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (266, 'Toma', 'Jeffry', 266, to_date('12-07-2010', 'dd-mm-yyyy'), 266);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (267, 'Brnaby', 'Maxstead', 267, to_date('27-05-2023', 'dd-mm-yyyy'), 267);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (268, 'Kathye', 'Waszczyk', 268, to_date('29-12-2018', 'dd-mm-yyyy'), 268);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (269, 'Andrew', 'Thurling', 269, to_date('15-07-2018', 'dd-mm-yyyy'), 269);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (270, 'Daryl', 'Wegman', 270, to_date('25-11-2014', 'dd-mm-yyyy'), 270);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (271, 'Findlay', 'Mummery', 271, to_date('05-12-2015', 'dd-mm-yyyy'), 271);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (272, 'Devy', 'Poultney', 272, to_date('30-04-2019', 'dd-mm-yyyy'), 272);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (273, 'Iris', 'Carlow', 273, to_date('30-03-2019', 'dd-mm-yyyy'), 273);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (274, 'Byron', 'Stares', 274, to_date('04-04-2013', 'dd-mm-yyyy'), 274);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (275, 'Ingram', 'Rathbourne', 275, to_date('21-10-2014', 'dd-mm-yyyy'), 275);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (276, 'Gladi', 'Scurlock', 276, to_date('10-01-2015', 'dd-mm-yyyy'), 276);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (277, 'El', 'Dessaur', 277, to_date('27-01-2015', 'dd-mm-yyyy'), 277);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (278, 'Kayle', 'Ebbrell', 278, to_date('11-11-2019', 'dd-mm-yyyy'), 278);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (279, 'Junie', 'Diggins', 279, to_date('06-05-2022', 'dd-mm-yyyy'), 279);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (280, 'Yuri', 'Dozdill', 280, to_date('23-08-2013', 'dd-mm-yyyy'), 280);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (281, 'Franciska', 'Sey', 281, to_date('23-04-2016', 'dd-mm-yyyy'), 281);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (282, 'Claresta', 'Trendle', 282, to_date('25-09-2016', 'dd-mm-yyyy'), 282);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (283, 'Chan', 'Zaniolo', 283, to_date('11-07-2023', 'dd-mm-yyyy'), 283);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (284, 'Ameline', 'Clews', 284, to_date('07-04-2018', 'dd-mm-yyyy'), 284);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (285, 'Zabrina', 'Isley', 285, to_date('20-04-2012', 'dd-mm-yyyy'), 285);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (286, 'Brinna', 'Copello', 286, to_date('19-02-2020', 'dd-mm-yyyy'), 286);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (287, 'Standford', 'Febre', 287, to_date('03-04-2017', 'dd-mm-yyyy'), 287);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (288, 'Peggie', 'Seviour', 288, to_date('23-07-2010', 'dd-mm-yyyy'), 288);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (289, 'Matthieu', 'Panks', 289, to_date('12-05-2012', 'dd-mm-yyyy'), 289);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (290, 'Nolie', 'Craigg', 290, to_date('31-08-2012', 'dd-mm-yyyy'), 290);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (291, 'Ludvig', 'Impett', 291, to_date('09-03-2023', 'dd-mm-yyyy'), 291);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (292, 'Clarance', 'Dyet', 292, to_date('21-01-2016', 'dd-mm-yyyy'), 292);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (293, 'Ellwood', 'McCord', 293, to_date('05-09-2014', 'dd-mm-yyyy'), 293);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (294, 'Alick', 'Palle', 294, to_date('21-09-2011', 'dd-mm-yyyy'), 294);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (295, 'Chad', 'Caney', 295, to_date('19-04-2016', 'dd-mm-yyyy'), 295);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (296, 'Gabe', 'Grigoriev', 296, to_date('13-01-2022', 'dd-mm-yyyy'), 296);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (297, 'Hunfredo', 'Crowd', 297, to_date('25-12-2012', 'dd-mm-yyyy'), 297);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (298, 'Shurlock', 'Philpott', 298, to_date('27-07-2015', 'dd-mm-yyyy'), 298);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (299, 'Olwen', 'Foord', 299, to_date('17-08-2011', 'dd-mm-yyyy'), 299);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (300, 'Brandice', 'Worsfold', 300, to_date('13-11-2015', 'dd-mm-yyyy'), 300);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (301, 'Pietrek', 'De Avenell', 301, to_date('24-08-2022', 'dd-mm-yyyy'), 301);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (302, 'Kerrill', 'Bruna', 302, to_date('20-01-2011', 'dd-mm-yyyy'), 302);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (303, 'Janka', 'Tingey', 303, to_date('30-08-2022', 'dd-mm-yyyy'), 303);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (304, 'Caitlin', 'Nashe', 304, to_date('22-09-2014', 'dd-mm-yyyy'), 304);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (305, 'Sal', 'Ossipenko', 305, to_date('17-05-2021', 'dd-mm-yyyy'), 305);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (306, 'Dionisio', 'Evett', 306, to_date('20-03-2023', 'dd-mm-yyyy'), 306);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (307, 'Elfreda', 'Pittway', 307, to_date('23-11-2014', 'dd-mm-yyyy'), 307);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (308, 'Salomi', 'Castellet', 308, to_date('15-12-2012', 'dd-mm-yyyy'), 308);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (309, 'Kurtis', 'Ethridge', 309, to_date('14-08-2016', 'dd-mm-yyyy'), 309);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (310, 'Alexandro', 'Townend', 310, to_date('10-10-2018', 'dd-mm-yyyy'), 310);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (311, 'Veradis', 'Emslie', 311, to_date('23-11-2015', 'dd-mm-yyyy'), 311);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (312, 'Glenden', 'Vasser', 312, to_date('23-11-2014', 'dd-mm-yyyy'), 312);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (313, 'Robinet', 'Wasmuth', 313, to_date('08-10-2010', 'dd-mm-yyyy'), 313);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (314, 'Alica', 'Gosnell', 314, to_date('17-06-2019', 'dd-mm-yyyy'), 314);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (315, 'Ludovika', 'Waterworth', 315, to_date('03-03-2013', 'dd-mm-yyyy'), 315);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (316, 'Stillmann', 'Roth', 316, to_date('20-10-2023', 'dd-mm-yyyy'), 316);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (317, 'Maryjane', 'McEniry', 317, to_date('10-12-2010', 'dd-mm-yyyy'), 317);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (318, 'Bink', 'Baulk', 318, to_date('06-01-2012', 'dd-mm-yyyy'), 318);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (319, 'Kimbra', 'Persence', 319, to_date('28-01-2019', 'dd-mm-yyyy'), 319);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (320, 'Meta', 'Audenis', 320, to_date('14-08-2013', 'dd-mm-yyyy'), 320);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (321, 'Nina', 'Nickless', 321, to_date('08-04-2019', 'dd-mm-yyyy'), 321);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (322, 'Enrichetta', 'Snoddin', 322, to_date('29-10-2020', 'dd-mm-yyyy'), 322);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (323, 'Mariana', 'Faughny', 323, to_date('30-07-2014', 'dd-mm-yyyy'), 323);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (324, 'Burton', 'Longmire', 324, to_date('07-09-2022', 'dd-mm-yyyy'), 324);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (325, 'Lexine', 'Bowater', 325, to_date('26-10-2015', 'dd-mm-yyyy'), 325);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (326, 'Rosaleen', 'Thams', 326, to_date('28-07-2014', 'dd-mm-yyyy'), 326);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (327, 'Hermann', 'Jiroutka', 327, to_date('01-01-2016', 'dd-mm-yyyy'), 327);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (328, 'Gael', 'Mallatratt', 328, to_date('10-04-2023', 'dd-mm-yyyy'), 328);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (329, 'Jacky', 'Haswall', 329, to_date('06-09-2017', 'dd-mm-yyyy'), 329);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (330, 'Victoir', 'Bosenworth', 330, to_date('06-03-2018', 'dd-mm-yyyy'), 330);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (331, 'Caddric', 'Gommowe', 331, to_date('24-11-2016', 'dd-mm-yyyy'), 331);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (332, 'Faustina', 'Penning', 332, to_date('20-04-2014', 'dd-mm-yyyy'), 332);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (333, 'Fayth', 'Joinsey', 333, to_date('18-10-2013', 'dd-mm-yyyy'), 333);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (334, 'Druci', 'Carnson', 334, to_date('13-06-2021', 'dd-mm-yyyy'), 334);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (335, 'Oralee', 'Harragin', 335, to_date('07-03-2013', 'dd-mm-yyyy'), 335);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (336, 'Blaine', 'Cholonin', 336, to_date('14-06-2018', 'dd-mm-yyyy'), 336);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (337, 'Janene', 'Emblem', 337, to_date('25-05-2012', 'dd-mm-yyyy'), 337);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (338, 'Imogene', 'Rootham', 338, to_date('21-01-2016', 'dd-mm-yyyy'), 338);
commit;
prompt 500 records committed...
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (339, 'Bartolomeo', 'Presshaugh', 339, to_date('27-05-2019', 'dd-mm-yyyy'), 339);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (340, 'Moira', 'Mallalieu', 340, to_date('07-05-2012', 'dd-mm-yyyy'), 340);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (341, 'Jeanine', 'Aitken', 341, to_date('22-11-2018', 'dd-mm-yyyy'), 341);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (342, 'Ruby', 'Davidovics', 342, to_date('14-02-2021', 'dd-mm-yyyy'), 342);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (343, 'Charlton', 'Ethridge', 343, to_date('11-05-2022', 'dd-mm-yyyy'), 343);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (344, 'Marsh', 'Proger', 344, to_date('23-05-2022', 'dd-mm-yyyy'), 344);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (345, 'Hazel', 'Slaight', 345, to_date('18-03-2011', 'dd-mm-yyyy'), 345);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (346, 'Harlie', 'Symper', 346, to_date('27-10-2012', 'dd-mm-yyyy'), 346);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (347, 'Elyssa', 'Standish', 347, to_date('16-12-2019', 'dd-mm-yyyy'), 347);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (348, 'Whitney', 'Fedoronko', 348, to_date('26-10-2015', 'dd-mm-yyyy'), 348);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (349, 'Harcourt', 'Seeborne', 349, to_date('30-09-2013', 'dd-mm-yyyy'), 349);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (350, 'Sara-ann', 'Mote', 350, to_date('03-03-2020', 'dd-mm-yyyy'), 350);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (351, 'Malina', 'Sandry', 351, to_date('15-07-2014', 'dd-mm-yyyy'), 351);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (352, 'Adiana', 'Rosenstengel', 352, to_date('13-10-2010', 'dd-mm-yyyy'), 352);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (353, 'Anya', 'Fydoe', 353, to_date('25-02-2019', 'dd-mm-yyyy'), 353);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (354, 'Obed', 'Phelip', 354, to_date('07-10-2010', 'dd-mm-yyyy'), 354);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (355, 'Burl', 'Sweetlove', 355, to_date('29-11-2020', 'dd-mm-yyyy'), 355);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (356, 'Ennis', 'Noen', 356, to_date('16-01-2016', 'dd-mm-yyyy'), 356);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (357, 'Humbert', 'Noke', 357, to_date('17-09-2013', 'dd-mm-yyyy'), 357);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (358, 'Amby', 'Kondratovich', 358, to_date('13-08-2021', 'dd-mm-yyyy'), 358);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (359, 'Abbe', 'Zoane', 359, to_date('15-03-2015', 'dd-mm-yyyy'), 359);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (360, 'Wayne', 'Olman', 360, to_date('23-07-2021', 'dd-mm-yyyy'), 360);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (361, 'Deloria', 'Spreckley', 361, to_date('11-07-2023', 'dd-mm-yyyy'), 361);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (362, 'Vinson', 'Oliphand', 362, to_date('03-03-2017', 'dd-mm-yyyy'), 362);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (363, 'Terrill', 'Martyntsev', 363, to_date('10-02-2018', 'dd-mm-yyyy'), 363);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (364, 'Em', 'Nottram', 364, to_date('01-04-2020', 'dd-mm-yyyy'), 364);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (365, 'Sanson', 'Scarrisbrick', 365, to_date('28-09-2016', 'dd-mm-yyyy'), 365);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (366, 'Jolene', 'Handscomb', 366, to_date('18-09-2021', 'dd-mm-yyyy'), 366);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (367, 'Peirce', 'Martinovsky', 367, to_date('22-09-2020', 'dd-mm-yyyy'), 367);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (368, 'Loralie', 'Seywood', 368, to_date('05-04-2018', 'dd-mm-yyyy'), 368);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (369, 'Suzanne', 'Guerrero', 369, to_date('27-10-2018', 'dd-mm-yyyy'), 369);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (370, 'Cherilynn', 'Havers', 370, to_date('31-08-2013', 'dd-mm-yyyy'), 370);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (371, 'Lyn', 'Dykins', 371, to_date('17-01-2022', 'dd-mm-yyyy'), 371);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (372, 'Keefe', 'Fleckney', 372, to_date('07-05-2015', 'dd-mm-yyyy'), 372);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (373, 'Ara', 'McKelvie', 373, to_date('12-11-2022', 'dd-mm-yyyy'), 373);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (374, 'Chelsy', 'Berecloth', 374, to_date('20-08-2015', 'dd-mm-yyyy'), 374);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (375, 'Josy', 'Scathard', 375, to_date('01-02-2023', 'dd-mm-yyyy'), 375);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (376, 'Ira', 'Toyer', 376, to_date('09-08-2014', 'dd-mm-yyyy'), 376);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (377, 'Myer', 'Tupp', 377, to_date('18-06-2014', 'dd-mm-yyyy'), 377);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (378, 'Alleyn', 'Avesque', 378, to_date('27-03-2019', 'dd-mm-yyyy'), 378);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (379, 'Lowrance', 'Frostdick', 379, to_date('13-08-2017', 'dd-mm-yyyy'), 379);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (380, 'Lawrence', 'Semmence', 380, to_date('17-10-2022', 'dd-mm-yyyy'), 380);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (381, 'Clemmie', 'Volante', 381, to_date('30-04-2014', 'dd-mm-yyyy'), 381);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (382, 'Marcie', 'Knevett', 382, to_date('13-11-2016', 'dd-mm-yyyy'), 382);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (383, 'Ricca', 'Merrigans', 383, to_date('15-09-2023', 'dd-mm-yyyy'), 383);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (384, 'Doreen', 'Rookesby', 384, to_date('20-10-2012', 'dd-mm-yyyy'), 384);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (385, 'Tommie', 'Pennycock', 385, to_date('08-12-2015', 'dd-mm-yyyy'), 385);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (386, 'Kaitlin', 'Pourvoieur', 386, to_date('21-03-2023', 'dd-mm-yyyy'), 386);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (387, 'Meier', 'Grindell', 387, to_date('18-12-2021', 'dd-mm-yyyy'), 387);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (388, 'Darbee', 'Duley', 388, to_date('29-06-2011', 'dd-mm-yyyy'), 388);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (389, 'Edin', 'Greatex', 389, to_date('03-11-2011', 'dd-mm-yyyy'), 389);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (390, 'Deonne', 'Garfath', 390, to_date('26-08-2016', 'dd-mm-yyyy'), 390);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (391, 'Enos', 'Gloucester', 391, to_date('02-07-2014', 'dd-mm-yyyy'), 391);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (392, 'Sonnie', 'Hamshaw', 392, to_date('17-06-2023', 'dd-mm-yyyy'), 392);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (393, 'Davita', 'Carslake', 393, to_date('02-09-2019', 'dd-mm-yyyy'), 393);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (394, 'Kellia', 'Derycot', 394, to_date('26-10-2015', 'dd-mm-yyyy'), 394);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (395, 'Beth', 'Regus', 395, to_date('02-10-2022', 'dd-mm-yyyy'), 395);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (396, 'Silvester', 'Dimmer', 396, to_date('09-09-2020', 'dd-mm-yyyy'), 396);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (397, 'Tudor', 'Creigan', 397, to_date('30-05-2013', 'dd-mm-yyyy'), 397);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (398, 'Albie', 'Yorkston', 398, to_date('16-09-2015', 'dd-mm-yyyy'), 398);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (399, 'Pierrette', 'Maund', 399, to_date('17-04-2014', 'dd-mm-yyyy'), 399);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (400, 'Gianna', 'Haldane', 400, to_date('01-02-2015', 'dd-mm-yyyy'), 400);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (401, 'Tiffy', 'Crickmer', 401, to_date('16-10-2010', 'dd-mm-yyyy'), 401);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (402, 'Marysa', 'Le Franc', 402, to_date('28-05-2020', 'dd-mm-yyyy'), 402);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (403, 'Rosita', 'O''Dare', 403, to_date('12-10-2012', 'dd-mm-yyyy'), 403);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (404, 'Bondie', 'Butteris', 404, to_date('22-02-2011', 'dd-mm-yyyy'), 404);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (405, 'Krysta', 'Thredder', 405, to_date('15-08-2012', 'dd-mm-yyyy'), 405);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (406, 'Fredi', 'Piggen', 406, to_date('14-01-2012', 'dd-mm-yyyy'), 406);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (407, 'Brendin', 'O''Conor', 407, to_date('02-04-2014', 'dd-mm-yyyy'), 407);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (408, 'Rudyard', 'Chalder', 408, to_date('09-07-2016', 'dd-mm-yyyy'), 408);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (409, 'Caren', 'Weeks', 409, to_date('16-11-2016', 'dd-mm-yyyy'), 409);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (410, 'Florinda', 'Shatford', 410, to_date('28-06-2015', 'dd-mm-yyyy'), 410);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (411, 'Zaccaria', 'Duer', 411, to_date('22-09-2021', 'dd-mm-yyyy'), 411);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (412, 'Gunther', 'Wooffinden', 412, to_date('23-06-2014', 'dd-mm-yyyy'), 412);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (413, 'Twila', 'Kynoch', 413, to_date('05-12-2019', 'dd-mm-yyyy'), 413);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (414, 'Trula', 'Thomelin', 414, to_date('21-07-2016', 'dd-mm-yyyy'), 414);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (415, 'Cointon', 'Staniford', 415, to_date('19-02-2014', 'dd-mm-yyyy'), 415);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (416, 'Lesley', 'Yakuntzov', 416, to_date('12-03-2012', 'dd-mm-yyyy'), 416);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (417, 'Murial', 'Dincke', 417, to_date('27-12-2020', 'dd-mm-yyyy'), 417);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (418, 'Giffard', 'Bilsford', 418, to_date('06-06-2019', 'dd-mm-yyyy'), 418);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (419, 'Wynny', 'Alekseev', 419, to_date('22-03-2015', 'dd-mm-yyyy'), 419);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (420, 'Monique', 'Cordelle', 420, to_date('04-02-2018', 'dd-mm-yyyy'), 420);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (421, 'Lyssa', 'Masterman', 421, to_date('24-10-2016', 'dd-mm-yyyy'), 421);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (422, 'Shae', 'Potapczuk', 422, to_date('01-06-2022', 'dd-mm-yyyy'), 422);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (423, 'Homerus', 'Thal', 423, to_date('19-05-2024', 'dd-mm-yyyy'), 423);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (424, 'Guinevere', 'Brouncker', 424, to_date('15-01-2016', 'dd-mm-yyyy'), 424);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (425, 'Modestia', 'Koles', 425, to_date('10-10-2023', 'dd-mm-yyyy'), 425);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (426, 'Ranna', 'Hagard', 426, to_date('12-12-2014', 'dd-mm-yyyy'), 426);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (427, 'Sanderson', 'Clemoes', 427, to_date('12-11-2020', 'dd-mm-yyyy'), 427);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (428, 'Bill', 'Tomaschke', 428, to_date('09-04-2013', 'dd-mm-yyyy'), 428);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (429, 'Adoree', 'Cathersides', 429, to_date('11-09-2018', 'dd-mm-yyyy'), 429);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (430, 'Sallie', 'Grassin', 430, to_date('09-10-2021', 'dd-mm-yyyy'), 430);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (431, 'Alanna', 'Matley', 431, to_date('05-12-2018', 'dd-mm-yyyy'), 431);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (432, 'Ambros', 'Cordell', 432, to_date('26-06-2011', 'dd-mm-yyyy'), 432);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (433, 'Warner', 'Jex', 433, to_date('10-01-2013', 'dd-mm-yyyy'), 433);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (434, 'Si', 'Defty', 434, to_date('18-06-2023', 'dd-mm-yyyy'), 434);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (435, 'Conway', 'Tuffey', 435, to_date('18-10-2011', 'dd-mm-yyyy'), 435);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (436, 'Jolyn', 'Bingham', 436, to_date('22-05-2011', 'dd-mm-yyyy'), 436);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (437, 'Clea', 'Sidebotham', 437, to_date('07-02-2014', 'dd-mm-yyyy'), 437);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (438, 'Gwenore', 'Kerbey', 438, to_date('06-03-2021', 'dd-mm-yyyy'), 438);
commit;
prompt 600 records committed...
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (439, 'Waneta', 'Crumley', 439, to_date('30-03-2017', 'dd-mm-yyyy'), 439);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (440, 'Margarete', 'Saunier', 440, to_date('19-07-2017', 'dd-mm-yyyy'), 440);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (441, 'Melva', 'Hayley', 441, to_date('04-11-2017', 'dd-mm-yyyy'), 441);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (442, 'Valenka', 'Ducaen', 442, to_date('23-03-2020', 'dd-mm-yyyy'), 442);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (443, 'Robin', 'Loughman', 443, to_date('18-09-2019', 'dd-mm-yyyy'), 443);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (444, 'Huntington', 'Siddeley', 444, to_date('18-02-2019', 'dd-mm-yyyy'), 444);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (445, 'Dolorita', 'Caulcott', 445, to_date('14-02-2011', 'dd-mm-yyyy'), 445);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (446, 'Marybeth', 'Kilrow', 446, to_date('04-03-2016', 'dd-mm-yyyy'), 446);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (447, 'Terrijo', 'Adamek', 447, to_date('13-09-2014', 'dd-mm-yyyy'), 447);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (448, 'Tammara', 'Winsom', 448, to_date('17-04-2012', 'dd-mm-yyyy'), 448);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (449, 'Lev', 'Innwood', 449, to_date('23-01-2020', 'dd-mm-yyyy'), 449);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (450, 'Lilla', 'Sydes', 450, to_date('19-05-2012', 'dd-mm-yyyy'), 450);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (451, 'Mona', 'Crackett', 451, to_date('01-02-2023', 'dd-mm-yyyy'), 451);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (452, 'Ursa', 'Asey', 452, to_date('05-09-2015', 'dd-mm-yyyy'), 452);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (453, 'Elyssa', 'Haldenby', 453, to_date('11-05-2017', 'dd-mm-yyyy'), 453);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (454, 'Bartlet', 'Leagas', 454, to_date('27-08-2022', 'dd-mm-yyyy'), 454);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (455, 'Shellysheldon', 'Villiers', 455, to_date('08-10-2012', 'dd-mm-yyyy'), 455);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (456, 'Bambi', 'Chasles', 456, to_date('25-06-2017', 'dd-mm-yyyy'), 456);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (457, 'Tedda', 'Kenworthey', 457, to_date('11-02-2012', 'dd-mm-yyyy'), 457);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (458, 'Ricky', 'Dechelle', 458, to_date('24-04-2013', 'dd-mm-yyyy'), 458);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (459, 'Aurie', 'Macconachy', 459, to_date('09-11-2018', 'dd-mm-yyyy'), 459);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (460, 'Carol', 'Jelf', 460, to_date('04-01-2022', 'dd-mm-yyyy'), 460);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (461, 'Petronia', 'Crighton', 461, to_date('16-10-2011', 'dd-mm-yyyy'), 461);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (462, 'Locke', 'Starking', 462, to_date('26-11-2023', 'dd-mm-yyyy'), 462);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (463, 'Maurene', 'Gladdis', 463, to_date('20-12-2016', 'dd-mm-yyyy'), 463);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (464, 'Dev', 'Danhel', 464, to_date('29-12-2019', 'dd-mm-yyyy'), 464);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (465, 'Reid', 'Daugherty', 465, to_date('23-01-2018', 'dd-mm-yyyy'), 465);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (466, 'Martyn', 'Haslehurst', 466, to_date('03-11-2021', 'dd-mm-yyyy'), 466);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (467, 'Jeralee', 'Shelvey', 467, to_date('01-12-2023', 'dd-mm-yyyy'), 467);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (468, 'Dorri', 'Bottoner', 468, to_date('08-04-2022', 'dd-mm-yyyy'), 468);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (469, 'Suellen', 'Bartoshevich', 469, to_date('04-07-2020', 'dd-mm-yyyy'), 469);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (470, 'Becki', 'Gery', 470, to_date('19-08-2011', 'dd-mm-yyyy'), 470);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (471, 'Orel', 'Isles', 471, to_date('17-01-2015', 'dd-mm-yyyy'), 471);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (472, 'Way', 'Punshon', 472, to_date('16-04-2023', 'dd-mm-yyyy'), 472);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (473, 'Lavinia', 'Kinvan', 473, to_date('08-03-2015', 'dd-mm-yyyy'), 473);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (474, 'Roanna', 'Janota', 474, to_date('22-04-2024', 'dd-mm-yyyy'), 474);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (475, 'Eduino', 'Dorot', 475, to_date('09-10-2021', 'dd-mm-yyyy'), 475);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (476, 'Katerine', 'Yglesia', 476, to_date('07-08-2022', 'dd-mm-yyyy'), 476);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (477, 'Mable', 'Pickring', 477, to_date('15-07-2014', 'dd-mm-yyyy'), 477);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (478, 'Rheta', 'Birchner', 478, to_date('13-12-2019', 'dd-mm-yyyy'), 478);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (479, 'Barnett', 'Dorricott', 479, to_date('23-06-2021', 'dd-mm-yyyy'), 479);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (480, 'Victor', 'Matignon', 480, to_date('13-02-2020', 'dd-mm-yyyy'), 480);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (481, 'Phillipe', 'Ingree', 481, to_date('24-09-2021', 'dd-mm-yyyy'), 481);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (482, 'Rowe', 'Wallington', 482, to_date('21-01-2015', 'dd-mm-yyyy'), 482);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (483, 'Harwilll', 'Grimston', 483, to_date('18-09-2017', 'dd-mm-yyyy'), 483);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (484, 'Elysia', 'Shellsheere', 484, to_date('27-10-2019', 'dd-mm-yyyy'), 484);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (485, 'Zulema', 'Matej', 485, to_date('09-07-2022', 'dd-mm-yyyy'), 485);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (486, 'Sutton', 'Folker', 486, to_date('16-06-2021', 'dd-mm-yyyy'), 486);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (487, 'Margarette', 'Currer', 487, to_date('24-04-2013', 'dd-mm-yyyy'), 487);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (488, 'Worden', 'Vella', 488, to_date('17-02-2023', 'dd-mm-yyyy'), 488);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (489, 'Fidole', 'Gomez', 489, to_date('10-06-2019', 'dd-mm-yyyy'), 489);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (490, 'Rora', 'Antoniutti', 490, to_date('06-05-2019', 'dd-mm-yyyy'), 490);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (491, 'Logan', 'MacVicar', 491, to_date('31-03-2014', 'dd-mm-yyyy'), 491);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (492, 'Bonni', 'Frain', 492, to_date('25-01-2012', 'dd-mm-yyyy'), 492);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (493, 'Sianna', 'Lillgard', 493, to_date('27-11-2021', 'dd-mm-yyyy'), 493);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (494, 'Christiana', 'Andress', 494, to_date('02-11-2017', 'dd-mm-yyyy'), 494);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (495, 'Carly', 'Ivashev', 495, to_date('14-03-2014', 'dd-mm-yyyy'), 495);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (496, 'Emilio', 'Collishaw', 496, to_date('17-06-2015', 'dd-mm-yyyy'), 496);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (497, 'Stefan', 'Tremellier', 497, to_date('21-10-2010', 'dd-mm-yyyy'), 497);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (498, 'Cati', 'Fleetwood', 498, to_date('08-05-2015', 'dd-mm-yyyy'), 498);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (499, 'Cam', 'McBean', 499, to_date('05-03-2012', 'dd-mm-yyyy'), 499);
insert into OFFICETECHNICIANS (technician_id, first_name, last_name, supervisor_id, hire_date, manager_id)
values (500, 'Meredith', 'Bridgstock', 500, to_date('21-05-2022', 'dd-mm-yyyy'), 500);
commit;
prompt 662 records loaded
prompt Loading SAFETYOFFICERS...
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (870105, 'Teri', 'Tripplehorn', 'Human Factors', 96316, to_date('11-08-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (781424, 'Eddie', 'Iglesias', 'Compliance', 96427, to_date('25-11-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (473533, 'Miko', 'Piven', 'Materials', 35980, to_date('22-01-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (825451, 'Elle', 'Thomas', 'Quality Assurance', 55049, to_date('13-04-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (994466, 'Lisa', 'Roberts', 'Testing', 67549, to_date('05-05-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (773680, 'Lea', 'Bacon', 'Avionics', 21270, to_date('14-03-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (345070, 'Eugene', 'MacLachlan', 'Materials', 23985, to_date('14-12-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (484945, 'Tanya', 'Hudson', 'Risk Assessment', 44988, to_date('30-08-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (230407, 'Ramsey', 'Evanswood', 'Testing', 64149, to_date('12-10-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (55108, 'Jay', 'Paul', 'GNC', 64577, to_date('20-04-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (19528, 'Guy', 'Loggia', 'Risk Assessment', 62661, to_date('11-07-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (919315, 'Shelby', 'Ford', 'Software', 70163, to_date('01-11-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (606959, 'Tara', 'Bush', 'Software', 50359, to_date('27-03-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (832091, 'Cary', 'Rapaport', 'Failure Analysis', 89950, to_date('07-09-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (475665, 'Johnette', 'Martinez', 'GNC', 66705, to_date('06-11-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (606540, 'Moe', 'Spiner', 'Software', 20053, to_date('11-01-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (78825, 'Danny', 'Schneider', 'Risk Assessment', 58754, to_date('29-11-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (682190, 'George', 'Whitaker', 'Risk Assessment', 34000, to_date('25-05-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (626168, 'Sam', 'Harry', 'Structural', 23985, to_date('21-12-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (485629, 'Jill', 'Edmunds', 'Software', 93961, to_date('14-08-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (284387, 'Roberta', 'Byrne', 'Propulsion', 99709, to_date('15-07-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (698377, 'Dylan', 'Mewes', 'Avionics', 87335, to_date('30-08-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (787184, 'Mary-Louise', 'Worrell', 'Quality Assurance', 53290, to_date('22-02-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (236810, 'Leonardo', 'Byrd', 'Systems', 88035, to_date('21-11-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (960707, 'Penelope', 'Sayer', 'Systems', 44988, to_date('30-01-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (48812, 'Brad', 'Hagerty', 'Avionics', 79885, to_date('01-06-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (951320, 'Rebeka', 'Weisz', 'Failure Analysis', 66724, to_date('07-10-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (305459, 'Ewan', 'Rispoli', 'Compliance', 66705, to_date('31-12-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (786750, 'Isabella', 'Sisto', 'GNC', 55049, to_date('12-12-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (572934, 'Christopher', 'Stigers', 'Avionics', 96623, to_date('15-12-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (345512, 'Lena', 'Carrack', 'Hazard Analysis', 96316, to_date('20-08-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (744300, 'Jesus', 'McCain', 'Human Factors', 75986, to_date('15-08-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (865002, 'Fiona', 'Coltrane', 'Systems', 82910, to_date('10-06-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (732151, 'Geoffrey', 'Davison', 'Testing', 99709, to_date('31-05-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (52679, 'Jean', 'Parish', 'Propulsion', 35980, to_date('13-08-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (75908, 'Alan', 'Llewelyn', 'Hazard Analysis', 44589, to_date('15-03-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (369135, 'Dom', 'Porter', 'Human Factors', 85708, to_date('26-11-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (60915, 'Hilton', 'Snipes', 'Software', 96427, to_date('25-04-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (823558, 'Pelvic', 'Ribisi', 'Structural', 34580, to_date('25-04-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (595047, 'Hikaru', 'Kenoly', 'Testing', 67716, to_date('01-05-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (862865, 'Illeana', 'Elizondo', 'Quality Assurance', 90625, to_date('27-04-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (861453, 'Lena', 'Moraz', 'Compliance', 74550, to_date('15-11-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (332634, 'Kevn', 'Beatty', 'Software', 44988, to_date('29-10-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (47873, 'Roger', 'Hiatt', 'Testing', 20103, to_date('10-03-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (402677, 'Miguel', 'Lange', 'Propulsion', 82910, to_date('01-10-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (72950, 'Gwyneth', 'Warren', 'GNC', 66705, to_date('28-04-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (319565, 'Daryle', 'Aglukark', 'Propulsion', 35435, to_date('17-03-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (362528, 'Stephanie', 'Gaynor', 'GNC', 31359, to_date('11-07-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (364556, 'Embeth', 'Cherry', 'Systems', 65793, to_date('16-06-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (133444, 'John', 'Heron', 'Materials', 65641, to_date('03-12-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (645010, 'Howie', 'McGill', 'Structural', 43108, to_date('09-09-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (993173, 'Hank', 'Loggins', 'Systems', 34000, to_date('24-02-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (662391, 'Wang', 'Dickinson', 'Testing', 53290, to_date('08-01-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (580244, 'Bruce', 'Aaron', 'Software', 64577, to_date('03-12-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (107277, 'Liev', 'Schwimmer', 'Compliance', 69550, to_date('24-04-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (126969, 'Rachel', 'Hiatt', 'Quality Assurance', 43108, to_date('02-06-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (853207, 'Mindy', 'Schneider', 'Compliance', 67549, to_date('08-05-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (692115, 'Joanna', 'Firth', 'Avionics', 53196, to_date('01-03-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (353674, 'Lila', 'Garcia', 'Failure Analysis', 38756, to_date('28-12-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (521054, 'Clint', 'Farrell', 'Software', 86330, to_date('18-08-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (121877, 'Liev', 'Herndon', 'Propulsion', 68594, to_date('12-11-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (164051, 'Teena', 'Shue', 'Structural', 33746, to_date('24-07-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (557995, 'Jane', 'Webb', 'Compliance', 22541, to_date('05-09-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (154041, 'Lupe', 'Ponty', 'GNC', 65793, to_date('17-11-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (275469, 'Kevin', 'McClinton', 'Failure Analysis', 86330, to_date('30-09-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (892883, 'Boz', 'Lloyd', 'Propulsion', 86330, to_date('25-02-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (483029, 'Jon', 'Sobieski', 'Structural', 37585, to_date('27-08-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (594067, 'Lari', 'Carlyle', 'Propulsion', 47868, to_date('07-04-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (284901, 'Manu', 'Wariner', 'Systems', 37585, to_date('02-08-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (329522, 'Christine', 'Dourif', 'GNC', 67716, to_date('24-12-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (94503, 'Busta', 'Neeson', 'Software', 29175, to_date('08-08-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (892925, 'Neve', 'Beckham', 'Testing', 44988, to_date('22-12-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (859028, 'Joey', 'Lopez', 'Compliance', 52499, to_date('31-03-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (761122, 'Natascha', 'Mattea', 'Thermal', 68594, to_date('23-06-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (970374, 'Marty', 'Tillis', 'Compliance', 20053, to_date('01-07-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (503319, 'Bette', 'Choice', 'Compliance', 20877, to_date('01-03-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (163856, 'Rhys', 'Marley', 'Human Factors', 79885, to_date('27-04-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (723924, 'Clay', 'Eldard', 'Failure Analysis', 72909, to_date('10-08-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (146864, 'Pat', 'Moraz', 'GNC', 23985, to_date('15-12-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (313754, 'Moe', 'Rain', 'Failure Analysis', 44988, to_date('01-03-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (657003, 'Burt', 'Vicious', 'Risk Assessment', 83572, to_date('07-01-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (335082, 'Tracy', 'Hart', 'Quality Assurance', 82719, to_date('21-06-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (950146, 'Arnold', 'McNarland', 'Software', 81471, to_date('12-02-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (53110, 'Rodney', 'Mars', 'Structural', 67549, to_date('26-11-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (725092, 'Nigel', 'Thomson', 'Propulsion', 83572, to_date('22-10-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (109242, 'Boz', 'Osment', 'Thermal', 85461, to_date('02-08-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (270100, 'Joey', 'Watson', 'Avionics', 64149, to_date('20-08-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (464428, 'Lari', 'Colman', 'Systems', 67549, to_date('06-02-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (499213, 'Christina', 'Sarsgaard', 'Quality Assurance', 47529, to_date('04-09-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (793164, 'Mae', 'Shatner', 'Materials', 90774, to_date('27-07-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (90027, 'Anjelica', 'Channing', 'Testing', 83572, to_date('28-11-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (84928, 'Rosco', 'Stormare', 'Quality Assurance', 65731, to_date('19-02-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (981122, 'Christian', 'Swank', 'Structural', 49447, to_date('03-05-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (119150, 'Stephen', 'Steiger', 'Human Factors', 89950, to_date('08-06-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (253742, 'Delbert', 'Dale', 'Compliance', 21270, to_date('16-02-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (476806, 'Holly', 'Dzundza', 'Risk Assessment', 83572, to_date('27-01-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (610323, 'Gabrielle', 'Knight', 'Materials', 71370, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (445586, 'Elizabeth', 'Johansson', 'Quality Assurance', 75986, to_date('02-04-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (978941, 'Coley', 'Caine', 'Avionics', 64388, to_date('14-03-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (340832, 'Jesus', 'Warwick', 'Hazard Analysis', 71370, to_date('08-11-2017', 'dd-mm-yyyy'));
commit;
prompt 100 records committed...
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (579705, 'Delbert', 'Camp', 'Propulsion', 64149, to_date('07-10-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (910356, 'Harrison', 'Bush', 'Compliance', 34262, to_date('26-04-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (313257, 'Mili', 'Guzman', 'Human Factors', 21684, to_date('22-03-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (772275, 'Mia', 'Mirren', 'Failure Analysis', 21684, to_date('20-01-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (754864, 'Alice', 'Gleeson', 'Testing', 60166, to_date('14-04-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (440419, 'Clive', 'Mitra', 'Failure Analysis', 38756, to_date('25-08-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (686909, 'Radney', 'Hanley', 'Software', 17044, to_date('03-07-2018', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (606207, 'Anthony', 'Tambor', 'Structural', 62376, to_date('01-04-2019', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (969803, 'Carrie-Anne', 'Gagnon', 'Risk Assessment', 17462, to_date('14-09-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (588331, 'Geoffrey', 'Wolf', 'Thermal', 55049, to_date('11-12-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (353344, 'Isabella', 'Colton', 'Structural', 53196, to_date('27-10-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (646688, 'Sigourney', 'Law', 'Quality Assurance', 44988, to_date('23-05-2017', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (1, 'Jane', 'Smith', 'OSHA', 1, to_date('01-01-2022', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (401, 'Emily', 'Garcia', 'SafetyCert1', 202, to_date('01-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (402, 'Matthew', 'Rodriguez', 'SafetyCert2', 202, to_date('01-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (403, 'Sophia', 'Martinez', 'SafetyCert3', 202, to_date('01-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (404, 'Daniel', 'Hernandez', 'SafetyCert4', 202, to_date('01-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (405, 'Olivia', 'Lopez', 'SafetyCert5', 202, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (406, 'Liam', 'Gonzalez', 'SafetyCert6', 202, to_date('01-06-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (407, 'Ava', 'Wilson', 'SafetyCert7', 202, to_date('01-07-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (408, 'James', 'Hernandez', 'SafetyCert8', 202, to_date('01-08-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (409, 'Emma', 'Martinez', 'SafetyCert9', 202, to_date('01-09-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (410, 'William', 'Lopez', 'SafetyCert10', 202, to_date('01-10-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (411, 'Isabella', 'Perez', 'SafetyCert11', 202, to_date('01-11-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (412, 'Michael', 'Rodriguez', 'SafetyCert12', 202, to_date('01-12-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (413, 'Olivia', 'Garcia', 'SafetyCert13', 202, to_date('01-01-2025', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (414, 'Noah', 'Gonzalez', 'SafetyCert14', 202, to_date('01-02-2025', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (415, 'Emily', 'Hernandez', 'SafetyCert15', 202, to_date('01-03-2025', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (416, 'Liam', 'Rodriguez', 'SafetyCert16', 202, to_date('01-04-2025', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (417, 'Emma', 'Martinez', 'SafetyCert17', 202, to_date('01-05-2025', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (418, 'James', 'Garcia', 'SafetyCert18', 202, to_date('01-06-2025', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (419, 'Sophia', 'Hernandez', 'SafetyCert19', 202, to_date('01-07-2025', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (420, 'Daniel', 'Martinez', 'SafetyCert20', 202, to_date('01-08-2025', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (421, 'Olivia', 'Lopez', 'SafetyCert21', 202, to_date('01-09-2025', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (422, 'William', 'Gonzalez', 'SafetyCert22', 202, to_date('01-10-2025', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (423, 'Sophia', 'Rodriguez', 'SafetyCert23', 202, to_date('01-11-2025', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (424, 'Benjamin', 'Martinez', 'SafetyCert24', 202, to_date('01-12-2025', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (425, 'Amelia', 'Hernandez', 'SafetyCert25', 202, to_date('01-01-2026', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (2, 'Del', 'Izen', 'Specialist Certification', 2, to_date('30-05-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (3, 'Deb', 'Satterthwaite', 'Expert Level', 3, to_date('11-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (4, 'Wynn', 'Duligal', 'Specialist Certification', 4, to_date('31-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (5, 'Trixy', 'Haylands', 'Certified Professional', 5, to_date('31-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (6, 'Fionnula', 'Frenzl', 'Master Certification', 6, to_date('19-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (7, 'Mollee', 'Sellek', 'Specialist Certification', 7, to_date('01-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (8, 'Early', 'Delaprelle', 'Expert Level', 8, to_date('09-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (9, 'Juana', 'Proby', 'Specialist Certification', 9, to_date('29-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (10, 'Riordan', 'Dunbar', 'Master Certification', 10, to_date('22-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (11, 'Zed', 'Stitcher', 'Expert Level', 11, to_date('16-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (12, 'Allys', 'Hatchell', 'Specialist Certification', 12, to_date('09-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (13, 'Ruttger', 'Doorly', 'Master Certification', 13, to_date('30-05-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (14, 'Enoch', 'Bispham', 'Certified Professional', 14, to_date('21-05-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (15, 'Colene', 'Follan', 'Expert Level', 15, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (16, 'Ebenezer', 'Le Merchant', 'Expert Level', 16, to_date('04-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (17, 'Lorine', 'Blowne', 'Certified Professional', 17, to_date('17-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (18, 'Laurella', 'Navein', 'Expert Level', 18, to_date('13-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (19, 'Larisa', 'Howarth', 'Specialist Certification', 19, to_date('24-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (20, 'Charlena', 'Cuddon', 'Expert Level', 20, to_date('10-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (21, 'Jacqueline', 'Girardoni', 'Advanced Certification', 21, to_date('17-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (22, 'Elnora', 'McInility', 'Master Certification', 22, to_date('30-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (23, 'Fayette', 'McTurley', 'Certified Professional', 23, to_date('30-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (24, 'Dorris', 'Stanyland', 'Advanced Certification', 24, to_date('06-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (25, 'Bobine', 'Gibard', 'Expert Level', 25, to_date('12-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (26, 'Arlette', 'Sherer', 'Certified Professional', 26, to_date('13-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (27, 'Brandy', 'Verbruggen', 'Certified Professional', 27, to_date('24-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (28, 'Tessa', 'Natwick', 'Master Certification', 28, to_date('04-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (29, 'Madalyn', 'Stapforth', 'Certified Professional', 29, to_date('19-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (30, 'Marget', 'Kennefick', 'Expert Level', 30, to_date('07-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (31, 'Mayer', 'Rosthorn', 'Expert Level', 31, to_date('01-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (32, 'Randall', 'Gerty', 'Specialist Certification', 32, to_date('19-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (33, 'Eloise', 'New', 'Specialist Certification', 33, to_date('18-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (34, 'Lucia', 'Glastonbury', 'Specialist Certification', 34, to_date('16-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (35, 'Barrie', 'Hilldrop', 'Specialist Certification', 35, to_date('24-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (36, 'Gweneth', 'Trewhitt', 'Expert Level', 36, to_date('30-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (37, 'Eunice', 'Marjot', 'Expert Level', 37, to_date('30-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (38, 'Joanne', 'Yukhin', 'Certified Professional', 38, to_date('26-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (39, 'Kelsey', 'Kesper', 'Advanced Certification', 39, to_date('11-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (40, 'Kaitlyn', 'Moan', 'Master Certification', 40, to_date('15-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (41, 'Patrizio', 'Stuttman', 'Expert Level', 41, to_date('01-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (42, 'Natal', 'Farnie', 'Specialist Certification', 42, to_date('29-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (43, 'Forster', 'Siggens', 'Advanced Certification', 43, to_date('18-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (44, 'Chet', 'Fosken', 'Expert Level', 44, to_date('09-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (45, 'Neilla', 'Kuschke', 'Certified Professional', 45, to_date('10-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (46, 'Martha', 'Malarkey', 'Master Certification', 46, to_date('02-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (47, 'Hyacinth', 'Londing', 'Certified Professional', 47, to_date('28-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (48, 'Garwood', 'Mowday', 'Advanced Certification', 48, to_date('06-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (49, 'Ailis', 'Cannavan', 'Expert Level', 49, to_date('27-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (50, 'Nata', 'Rootham', 'Specialist Certification', 50, to_date('04-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (51, 'Welsh', 'Elland', 'Certified Professional', 51, to_date('03-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (52, 'Angel', 'Borges', 'Advanced Certification', 52, to_date('26-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (53, 'Sile', 'Francois', 'Advanced Certification', 53, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (54, 'Neale', 'Goakes', 'Advanced Certification', 54, to_date('13-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (55, 'Aurelie', 'Marcu', 'Master Certification', 55, to_date('06-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (56, 'Melicent', 'Jozwiak', 'Specialist Certification', 56, to_date('09-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (57, 'Kaile', 'Sollis', 'Expert Level', 57, to_date('05-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (58, 'Clemens', 'Oneill', 'Certified Professional', 58, to_date('11-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (59, 'Denice', 'O''Flynn', 'Expert Level', 59, to_date('05-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (60, 'Kittie', 'Rhodes', 'Advanced Certification', 60, to_date('18-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (61, 'Gaultiero', 'Beadnell', 'Certified Professional', 61, to_date('28-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (62, 'Raul', 'Pelham', 'Specialist Certification', 62, to_date('16-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (63, 'Armin', 'McGarvie', 'Specialist Certification', 63, to_date('24-12-2023', 'dd-mm-yyyy'));
commit;
prompt 200 records committed...
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (64, 'Yasmeen', 'Adrienne', 'Expert Level', 64, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (65, 'Laurena', 'Dunkinson', 'Master Certification', 65, to_date('30-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (66, 'Huntlee', 'Kurth', 'Specialist Certification', 66, to_date('01-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (67, 'Twila', 'Reisen', 'Advanced Certification', 67, to_date('09-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (68, 'Tabor', 'Steenson', 'Expert Level', 68, to_date('25-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (69, 'Sibbie', 'MacMoyer', 'Advanced Certification', 69, to_date('06-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (70, 'Melita', 'Head', 'Specialist Certification', 70, to_date('13-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (71, 'Ella', 'De Vuyst', 'Expert Level', 71, to_date('22-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (72, 'Wells', 'Camplen', 'Master Certification', 72, to_date('19-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (73, 'Marjie', 'Treweela', 'Expert Level', 73, to_date('16-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (74, 'Thibaut', 'Shearstone', 'Certified Professional', 74, to_date('09-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (75, 'Elisabetta', 'Minear', 'Expert Level', 75, to_date('09-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (76, 'Teodoor', 'Rook', 'Specialist Certification', 76, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (77, 'Peadar', 'Merrell', 'Expert Level', 77, to_date('03-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (78, 'Buck', 'Howle', 'Expert Level', 78, to_date('11-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (79, 'Nanci', 'Merigon', 'Master Certification', 79, to_date('16-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (80, 'Etti', 'Shord', 'Specialist Certification', 80, to_date('05-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (81, 'Opal', 'Backshaw', 'Specialist Certification', 81, to_date('01-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (82, 'Herc', 'Cake', 'Master Certification', 82, to_date('23-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (83, 'Eduard', 'Ashton', 'Specialist Certification', 83, to_date('24-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (84, 'Any', 'Goldring', 'Master Certification', 84, to_date('28-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (85, 'Anet', 'Mullarkey', 'Advanced Certification', 85, to_date('24-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (86, 'George', 'Roglieri', 'Advanced Certification', 86, to_date('16-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (87, 'Alleyn', 'Lashmore', 'Master Certification', 87, to_date('14-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (88, 'Agace', 'Wiz', 'Specialist Certification', 88, to_date('31-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (89, 'Levey', 'McAlinden', 'Specialist Certification', 89, to_date('09-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (90, 'Sonny', 'Standering', 'Expert Level', 90, to_date('23-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (91, 'Gerhard', 'Maraga', 'Expert Level', 91, to_date('04-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (92, 'Mylo', 'Telfer', 'Expert Level', 92, to_date('25-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (93, 'Agustin', 'Ballentime', 'Specialist Certification', 93, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (94, 'Merrick', 'Dymond', 'Specialist Certification', 94, to_date('23-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (95, 'Connor', 'Wines', 'Certified Professional', 95, to_date('23-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (96, 'Wenona', 'Gapper', 'Specialist Certification', 96, to_date('29-05-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (97, 'Amandie', 'Cargon', 'Certified Professional', 97, to_date('09-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (98, 'Rikki', 'Normand', 'Master Certification', 98, to_date('06-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (99, 'Sherye', 'Cuseck', 'Specialist Certification', 99, to_date('22-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (100, 'Rodney', 'Banck', 'Expert Level', 100, to_date('21-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (101, 'Monica', 'Corck', 'Advanced Certification', 101, to_date('21-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (102, 'Madalena', 'Lampaert', 'Expert Level', 102, to_date('17-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (103, 'Erin', 'MacPeake', 'Master Certification', 103, to_date('26-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (104, 'Emmett', 'Cowern', 'Expert Level', 104, to_date('05-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (105, 'Anastassia', 'Cavy', 'Certified Professional', 105, to_date('15-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (106, 'Xylina', 'Mincher', 'Expert Level', 106, to_date('12-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (107, 'Modesta', 'Schroter', 'Specialist Certification', 107, to_date('26-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (108, 'Arlyn', 'Zecchetti', 'Specialist Certification', 108, to_date('10-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (109, 'Weber', 'Hinkens', 'Master Certification', 109, to_date('14-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (110, 'Abie', 'Murty', 'Expert Level', 110, to_date('01-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (111, 'Ferne', 'Brose', 'Certified Professional', 111, to_date('26-05-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (112, 'Tye', 'Savery', 'Master Certification', 112, to_date('11-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (113, 'Svend', 'Fuge', 'Master Certification', 113, to_date('09-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (114, 'Toby', 'Kennea', 'Expert Level', 114, to_date('20-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (115, 'Patton', 'La Wille', 'Master Certification', 115, to_date('28-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (116, 'Janene', 'Vane', 'Expert Level', 116, to_date('15-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (117, 'Henrieta', 'Beinisch', 'Master Certification', 117, to_date('22-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (118, 'Bernie', 'Goodinge', 'Expert Level', 118, to_date('14-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (119, 'Maible', 'Jellman', 'Expert Level', 119, to_date('02-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (120, 'Baily', 'McDill', 'Expert Level', 120, to_date('14-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (121, 'Johnath', 'Wheatley', 'Master Certification', 121, to_date('03-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (122, 'Benjy', 'Tabner', 'Certified Professional', 122, to_date('18-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (123, 'Hayyim', 'Loney', 'Advanced Certification', 123, to_date('27-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (124, 'Juliane', 'Gunson', 'Advanced Certification', 124, to_date('03-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (125, 'Tad', 'Thornley', 'Master Certification', 125, to_date('06-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (126, 'Francoise', 'Bernardt', 'Advanced Certification', 126, to_date('09-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (127, 'Omero', 'Palliser', 'Specialist Certification', 127, to_date('18-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (128, 'Conrade', 'Signoret', 'Master Certification', 128, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (129, 'Bernetta', 'MacAndie', 'Specialist Certification', 129, to_date('19-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (130, 'Keen', 'Alsobrook', 'Certified Professional', 130, to_date('20-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (131, 'Ethyl', 'Eagleton', 'Master Certification', 131, to_date('25-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (132, 'Liane', 'Riseley', 'Advanced Certification', 132, to_date('22-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (133, 'Rivi', 'Vasyaev', 'Advanced Certification', 133, to_date('22-05-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (134, 'Rudolfo', 'Westmerland', 'Advanced Certification', 134, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (135, 'Phillis', 'Provis', 'Advanced Certification', 135, to_date('28-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (136, 'Traci', 'O''Feeney', 'Specialist Certification', 136, to_date('03-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (137, 'Pierce', 'Paskell', 'Expert Level', 137, to_date('15-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (138, 'Sadye', 'Moran', 'Specialist Certification', 138, to_date('17-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (139, 'Alessandra', 'Antusch', 'Expert Level', 139, to_date('06-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (140, 'Amandie', 'Pavie', 'Master Certification', 140, to_date('19-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (141, 'Mickey', 'Do', 'Certified Professional', 141, to_date('17-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (142, 'Gibby', 'Keuntje', 'Expert Level', 142, to_date('03-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (143, 'Ekaterina', 'Colenutt', 'Certified Professional', 143, to_date('25-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (144, 'Gavan', 'Yelding', 'Certified Professional', 144, to_date('09-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (145, 'John', 'Leisk', 'Advanced Certification', 145, to_date('22-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (146, 'Pennie', 'Mc Mechan', 'Expert Level', 146, to_date('19-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (147, 'Rozele', 'Shucksmith', 'Master Certification', 147, to_date('24-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (148, 'Sonny', 'Lendon', 'Specialist Certification', 148, to_date('26-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (149, 'Kaitlyn', 'Rosenstengel', 'Specialist Certification', 149, to_date('03-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (150, 'Jeane', 'Roskelley', 'Advanced Certification', 150, to_date('05-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (151, 'Padriac', 'Ropking', 'Advanced Certification', 151, to_date('02-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (152, 'Cletis', 'Gravenall', 'Expert Level', 152, to_date('07-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (153, 'Kristyn', 'Stuehmeyer', 'Specialist Certification', 153, to_date('18-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (154, 'Neille', 'Gorry', 'Expert Level', 154, to_date('17-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (155, 'Noel', 'Clemas', 'Specialist Certification', 155, to_date('05-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (156, 'Minni', 'Moncrieffe', 'Expert Level', 156, to_date('18-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (157, 'Carson', 'Roots', 'Expert Level', 157, to_date('12-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (158, 'Elisa', 'Huskinson', 'Certified Professional', 158, to_date('26-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (159, 'Averyl', 'Hoyes', 'Advanced Certification', 159, to_date('21-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (160, 'Kirbie', 'Aldwich', 'Specialist Certification', 160, to_date('12-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (161, 'Maryl', 'Galliver', 'Expert Level', 161, to_date('04-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (162, 'Eleonora', 'Whiteson', 'Expert Level', 162, to_date('11-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (163, 'Mathew', 'Hallgalley', 'Master Certification', 163, to_date('11-02-2024', 'dd-mm-yyyy'));
commit;
prompt 300 records committed...
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (164, 'Barty', 'Blackbrough', 'Certified Professional', 164, to_date('20-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (165, 'Charlena', 'Le Clercq', 'Specialist Certification', 165, to_date('16-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (166, 'Andie', 'Ramelet', 'Master Certification', 166, to_date('14-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (167, 'Hubert', 'Bohlmann', 'Expert Level', 167, to_date('23-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (168, 'Brewer', 'Morit', 'Specialist Certification', 168, to_date('13-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (169, 'Brianne', 'Fanshaw', 'Certified Professional', 169, to_date('04-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (170, 'Averell', 'Pennick', 'Certified Professional', 170, to_date('09-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (171, 'Erhard', 'Vales', 'Specialist Certification', 171, to_date('23-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (172, 'Celisse', 'Wyness', 'Expert Level', 172, to_date('12-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (173, 'Britta', 'Tripean', 'Specialist Certification', 173, to_date('22-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (174, 'Francis', 'Vlasov', 'Master Certification', 174, to_date('31-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (175, 'Erma', 'Dingle', 'Specialist Certification', 175, to_date('12-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (176, 'Florida', 'Frape', 'Advanced Certification', 176, to_date('17-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (177, 'Cosette', 'Cordes', 'Certified Professional', 177, to_date('27-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (178, 'Brook', 'Manns', 'Expert Level', 178, to_date('04-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (179, 'Cory', 'Southward', 'Expert Level', 179, to_date('15-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (180, 'Marcellus', 'Doerren', 'Advanced Certification', 180, to_date('19-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (181, 'Camilla', 'Tabourel', 'Certified Professional', 181, to_date('11-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (182, 'Joell', 'Goulborn', 'Master Certification', 182, to_date('26-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (183, 'Porter', 'Fryman', 'Specialist Certification', 183, to_date('02-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (184, 'Hashim', 'Zanussii', 'Expert Level', 184, to_date('01-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (185, 'Merci', 'Wilcockes', 'Master Certification', 185, to_date('03-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (186, 'Ali', 'Folds', 'Certified Professional', 186, to_date('15-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (187, 'Linell', 'Benedit', 'Certified Professional', 187, to_date('17-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (188, 'Bucky', 'Oliphand', 'Expert Level', 188, to_date('13-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (189, 'Ingra', 'Sey', 'Specialist Certification', 189, to_date('01-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (190, 'Cash', 'Reyes', 'Advanced Certification', 190, to_date('08-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (191, 'Wally', 'Willshere', 'Master Certification', 191, to_date('19-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (192, 'Travus', 'Aneley', 'Certified Professional', 192, to_date('05-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (193, 'Randall', 'Devita', 'Master Certification', 193, to_date('08-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (194, 'Mommy', 'Mouland', 'Certified Professional', 194, to_date('18-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (195, 'Quintilla', 'Muschette', 'Master Certification', 195, to_date('20-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (196, 'Caritta', 'Leed', 'Specialist Certification', 196, to_date('11-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (197, 'Lyssa', 'Eaklee', 'Advanced Certification', 197, to_date('28-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (198, 'Karmen', 'Ganning', 'Specialist Certification', 198, to_date('16-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (199, 'Margot', 'Cressy', 'Specialist Certification', 199, to_date('16-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (200, 'Alica', 'Grombridge', 'Advanced Certification', 200, to_date('01-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (201, 'Florie', 'Fulkes', 'Specialist Certification', 201, to_date('18-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (202, 'Jaime', 'Pooly', 'Advanced Certification', 202, to_date('13-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (203, 'Den', 'MacAllen', 'Expert Level', 203, to_date('02-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (204, 'Dorry', 'Paolicchi', 'Master Certification', 204, to_date('29-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (205, 'Zandra', 'Longthorne', 'Certified Professional', 205, to_date('26-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (206, 'Findley', 'Dearell', 'Advanced Certification', 206, to_date('04-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (207, 'Pandora', 'Gowen', 'Master Certification', 207, to_date('08-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (208, 'Bert', 'Petters', 'Master Certification', 208, to_date('20-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (209, 'Sauncho', 'Bims', 'Expert Level', 209, to_date('20-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (210, 'Iormina', 'Huniwall', 'Specialist Certification', 210, to_date('13-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (211, 'Edithe', 'Castagno', 'Master Certification', 211, to_date('13-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (212, 'Pavel', 'Oxborough', 'Expert Level', 212, to_date('01-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (213, 'Bobinette', 'O''Growgane', 'Specialist Certification', 213, to_date('02-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (214, 'Kath', 'Bitterton', 'Certified Professional', 214, to_date('24-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (215, 'Vick', 'Gunney', 'Specialist Certification', 215, to_date('03-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (216, 'Kipper', 'Jacquemot', 'Certified Professional', 216, to_date('25-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (217, 'Halley', 'Rechert', 'Certified Professional', 217, to_date('09-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (218, 'Shae', 'Janisson', 'Master Certification', 218, to_date('16-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (219, 'Shane', 'Clac', 'Advanced Certification', 219, to_date('22-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (220, 'Violetta', 'O''Donoghue', 'Advanced Certification', 220, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (221, 'Nomi', 'Curnick', 'Expert Level', 221, to_date('20-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (222, 'Hashim', 'Loyndon', 'Specialist Certification', 222, to_date('23-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (223, 'Lilias', 'Klawi', 'Master Certification', 223, to_date('16-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (224, 'Doe', 'Dickings', 'Advanced Certification', 224, to_date('30-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (225, 'Ilka', 'Pieter', 'Certified Professional', 225, to_date('19-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (226, 'Ambrosi', 'Pattlel', 'Advanced Certification', 226, to_date('10-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (227, 'Ramon', 'Beamson', 'Specialist Certification', 227, to_date('29-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (228, 'Chelsey', 'Whightman', 'Master Certification', 228, to_date('17-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (229, 'Krispin', 'Garrelts', 'Certified Professional', 229, to_date('25-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (230, 'Skipton', 'Redferne', 'Expert Level', 230, to_date('23-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (231, 'Dwain', 'Daintier', 'Expert Level', 231, to_date('23-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (232, 'Becca', 'Upston', 'Expert Level', 232, to_date('11-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (233, 'Jarid', 'Crolla', 'Certified Professional', 233, to_date('30-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (234, 'Nadya', 'Wasling', 'Specialist Certification', 234, to_date('09-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (235, 'Karil', 'Seagar', 'Specialist Certification', 235, to_date('10-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (236, 'Hadleigh', 'Gors', 'Specialist Certification', 236, to_date('10-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (237, 'Kristian', 'Wennam', 'Certified Professional', 237, to_date('04-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (238, 'Wilhelm', 'Stoneley', 'Advanced Certification', 238, to_date('18-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (239, 'Elna', 'Cassimer', 'Advanced Certification', 239, to_date('02-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (240, 'Laura', 'Krysztofowicz', 'Expert Level', 240, to_date('19-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (241, 'Stearne', 'Hearfield', 'Certified Professional', 241, to_date('24-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (242, 'Emelina', 'Baroc', 'Expert Level', 242, to_date('03-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (243, 'Blinnie', 'Glowacki', 'Master Certification', 243, to_date('06-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (244, 'Xaviera', 'MacRierie', 'Certified Professional', 244, to_date('09-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (245, 'Mordy', 'Farnaby', 'Specialist Certification', 245, to_date('02-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (246, 'Giulio', 'Laity', 'Certified Professional', 246, to_date('02-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (247, 'Johan', 'Davidou', 'Specialist Certification', 247, to_date('21-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (248, 'Pincas', 'Colling', 'Certified Professional', 248, to_date('15-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (249, 'Corette', 'Ammer', 'Certified Professional', 249, to_date('18-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (250, 'Tedd', 'Truscott', 'Expert Level', 250, to_date('21-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (251, 'Dael', 'Scotchforth', 'Advanced Certification', 251, to_date('12-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (252, 'Obadiah', 'Maltby', 'Certified Professional', 252, to_date('12-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (253, 'Marlena', 'Ousley', 'Expert Level', 253, to_date('02-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (254, 'Isiahi', 'Lewins', 'Advanced Certification', 254, to_date('22-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (255, 'Jermayne', 'Gant', 'Master Certification', 255, to_date('19-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (256, 'Astrid', 'Tuite', 'Expert Level', 256, to_date('21-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (257, 'Leroi', 'Bixley', 'Master Certification', 257, to_date('30-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (258, 'George', 'Lorey', 'Specialist Certification', 258, to_date('14-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (259, 'Gerrard', 'Matignon', 'Expert Level', 259, to_date('29-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (260, 'Fedora', 'O''Rourke', 'Advanced Certification', 260, to_date('08-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (261, 'Berenice', 'Houliston', 'Specialist Certification', 261, to_date('19-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (262, 'Jonell', 'Perillo', 'Advanced Certification', 262, to_date('23-05-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (263, 'Annissa', 'Zieme', 'Certified Professional', 263, to_date('09-06-2023', 'dd-mm-yyyy'));
commit;
prompt 400 records committed...
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (264, 'Adelind', 'Utley', 'Master Certification', 264, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (265, 'Terrye', 'Perse', 'Master Certification', 265, to_date('21-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (266, 'Colman', 'Gerrell', 'Certified Professional', 266, to_date('13-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (267, 'Fairleigh', 'Stealey', 'Specialist Certification', 267, to_date('02-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (268, 'Evangelia', 'Adiscot', 'Master Certification', 268, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (269, 'Nalani', 'Foss', 'Expert Level', 269, to_date('10-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (270, 'Alix', 'Leisk', 'Specialist Certification', 270, to_date('09-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (271, 'Kitty', 'Hathorn', 'Certified Professional', 271, to_date('11-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (272, 'Gabey', 'Beeching', 'Expert Level', 272, to_date('02-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (273, 'Allyn', 'Davidi', 'Advanced Certification', 273, to_date('16-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (274, 'Gustaf', 'Boutwell', 'Specialist Certification', 274, to_date('05-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (275, 'Angel', 'Shireff', 'Specialist Certification', 275, to_date('02-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (276, 'Lauritz', 'Brimacombe', 'Specialist Certification', 276, to_date('11-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (277, 'Frants', 'Vegas', 'Master Certification', 277, to_date('31-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (278, 'Florentia', 'Oxtoby', 'Advanced Certification', 278, to_date('16-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (279, 'Belita', 'Cawthera', 'Advanced Certification', 279, to_date('13-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (280, 'Giraud', 'Nunan', 'Expert Level', 280, to_date('04-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (281, 'Laurence', 'Menaul', 'Specialist Certification', 281, to_date('27-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (282, 'Antoine', 'Kiffe', 'Specialist Certification', 282, to_date('30-05-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (283, 'Pia', 'O''Crowley', 'Expert Level', 283, to_date('29-05-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (284, 'Caro', 'Gianasi', 'Certified Professional', 284, to_date('29-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (285, 'Tatiania', 'Siaspinski', 'Specialist Certification', 285, to_date('24-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (286, 'Florencia', 'Fellenor', 'Specialist Certification', 286, to_date('12-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (287, 'Yevette', 'Mapowder', 'Advanced Certification', 287, to_date('24-05-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (288, 'Courtenay', 'MacCrann', 'Expert Level', 288, to_date('26-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (289, 'Bogart', 'Byford', 'Specialist Certification', 289, to_date('16-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (290, 'Ambros', 'Rigge', 'Expert Level', 290, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (291, 'Sven', 'Prescote', 'Certified Professional', 291, to_date('24-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (292, 'Happy', 'Goly', 'Expert Level', 292, to_date('03-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (293, 'Jessamyn', 'Leghorn', 'Certified Professional', 293, to_date('29-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (294, 'Laurie', 'De Biasio', 'Master Certification', 294, to_date('15-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (295, 'Vinny', 'Comberbeach', 'Master Certification', 295, to_date('19-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (296, 'Paulette', 'Upshall', 'Advanced Certification', 296, to_date('19-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (297, 'Rebekkah', 'Boness', 'Expert Level', 297, to_date('14-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (298, 'Wells', 'Buck', 'Expert Level', 298, to_date('08-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (299, 'Moria', 'Vivers', 'Master Certification', 299, to_date('01-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (300, 'Zonda', 'Crinkley', 'Expert Level', 300, to_date('07-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (301, 'Barty', 'Vandrill', 'Specialist Certification', 301, to_date('10-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (302, 'Gorden', 'Ibeson', 'Specialist Certification', 302, to_date('09-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (303, 'Vittorio', 'Limeburner', 'Advanced Certification', 303, to_date('05-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (304, 'Addy', 'Dolphin', 'Expert Level', 304, to_date('11-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (305, 'Hurleigh', 'Bains', 'Certified Professional', 305, to_date('22-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (306, 'Matty', 'Kingscote', 'Specialist Certification', 306, to_date('24-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (307, 'Harris', 'De La Salle', 'Specialist Certification', 307, to_date('08-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (308, 'Bernetta', 'Lanceley', 'Specialist Certification', 308, to_date('04-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (309, 'Donovan', 'De Roberto', 'Specialist Certification', 309, to_date('24-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (310, 'Gifford', 'Sommerly', 'Certified Professional', 310, to_date('01-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (311, 'Allen', 'Summerside', 'Master Certification', 311, to_date('28-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (312, 'Beverie', 'Woolaghan', 'Expert Level', 312, to_date('19-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (313, 'Haleigh', 'Botger', 'Specialist Certification', 313, to_date('21-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (314, 'Jonathan', 'Barehead', 'Expert Level', 314, to_date('10-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (315, 'Tobe', 'Waltho', 'Master Certification', 315, to_date('18-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (316, 'Creighton', 'Tabbernor', 'Advanced Certification', 316, to_date('03-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (317, 'Bren', 'Ellis', 'Specialist Certification', 317, to_date('23-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (318, 'Jeanna', 'Daniau', 'Expert Level', 318, to_date('02-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (319, 'Perl', 'Treamayne', 'Expert Level', 319, to_date('24-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (320, 'Shelba', 'Entwistle', 'Advanced Certification', 320, to_date('08-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (321, 'Isidor', 'Van den Velden', 'Certified Professional', 321, to_date('12-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (322, 'Shalom', 'O''Grady', 'Expert Level', 322, to_date('18-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (323, 'Elihu', 'Strapp', 'Expert Level', 323, to_date('02-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (324, 'Opaline', 'Edmenson', 'Certified Professional', 324, to_date('17-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (325, 'Raffaello', 'Bampton', 'Advanced Certification', 325, to_date('27-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (326, 'Essie', 'Spileman', 'Expert Level', 326, to_date('24-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (327, 'Moore', 'Pamphilon', 'Master Certification', 327, to_date('24-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (328, 'Cassy', 'Tutchell', 'Master Certification', 328, to_date('09-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (329, 'Alwin', 'Chalkly', 'Expert Level', 329, to_date('21-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (330, 'Gena', 'Dorracott', 'Specialist Certification', 330, to_date('10-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (331, 'Ceil', 'Simak', 'Master Certification', 331, to_date('15-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (332, 'Sauncho', 'Leaves', 'Advanced Certification', 332, to_date('15-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (333, 'Tarrah', 'Larvin', 'Advanced Certification', 333, to_date('06-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (334, 'Gelya', 'Cloutt', 'Certified Professional', 334, to_date('18-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (335, 'Lamont', 'Green', 'Advanced Certification', 335, to_date('09-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (336, 'Hillard', 'Raoul', 'Advanced Certification', 336, to_date('01-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (337, 'Olympe', 'Gorcke', 'Specialist Certification', 337, to_date('05-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (338, 'Vito', 'Lambourne', 'Advanced Certification', 338, to_date('20-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (339, 'Travers', 'Canby', 'Master Certification', 339, to_date('09-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (340, 'Donetta', 'Philip', 'Specialist Certification', 340, to_date('31-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (341, 'Maritsa', 'Ableson', 'Master Certification', 341, to_date('22-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (342, 'Berk', 'Jaulmes', 'Expert Level', 342, to_date('15-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (343, 'Marisa', 'Hiseman', 'Certified Professional', 343, to_date('22-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (344, 'Elfreda', 'Fosten', 'Master Certification', 344, to_date('15-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (345, 'Jock', 'Cotesford', 'Expert Level', 345, to_date('25-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (346, 'Heidie', 'Abarough', 'Expert Level', 346, to_date('09-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (347, 'Foster', 'Albrook', 'Advanced Certification', 347, to_date('01-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (348, 'Carmelia', 'Gerin', 'Specialist Certification', 348, to_date('22-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (349, 'Langston', 'Hercock', 'Expert Level', 349, to_date('29-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (350, 'Zebedee', 'Hamsher', 'Master Certification', 350, to_date('23-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (351, 'Lyn', 'Hurrell', 'Advanced Certification', 351, to_date('03-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (352, 'Shanon', 'Cristoforetti', 'Expert Level', 352, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (353, 'Carey', 'Beagley', 'Advanced Certification', 353, to_date('21-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (354, 'Tami', 'Linggard', 'Specialist Certification', 354, to_date('02-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (355, 'Henka', 'Chidley', 'Certified Professional', 355, to_date('11-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (356, 'Artemis', 'McNalley', 'Specialist Certification', 356, to_date('30-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (357, 'Morgan', 'Pinkie', 'Specialist Certification', 357, to_date('08-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (358, 'Lazaro', 'Rawsthorne', 'Expert Level', 358, to_date('11-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (359, 'Jenelle', 'Caff', 'Specialist Certification', 359, to_date('04-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (360, 'Guss', 'Rockhill', 'Master Certification', 360, to_date('12-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (361, 'Terra', 'Flaws', 'Master Certification', 361, to_date('01-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (362, 'Sydelle', 'Gook', 'Specialist Certification', 362, to_date('26-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (363, 'Alisun', 'Leathem', 'Master Certification', 363, to_date('19-12-2023', 'dd-mm-yyyy'));
commit;
prompt 500 records committed...
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (364, 'Jessee', 'Chelsom', 'Specialist Certification', 364, to_date('27-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (365, 'Dody', 'Semeniuk', 'Advanced Certification', 365, to_date('17-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (366, 'Bridget', 'Wisdish', 'Expert Level', 366, to_date('14-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (367, 'Murray', 'Bolan', 'Certified Professional', 367, to_date('02-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (368, 'Augustine', 'Jessel', 'Expert Level', 368, to_date('06-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (369, 'Phyllys', 'Jorge', 'Specialist Certification', 369, to_date('19-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (370, 'Roseline', 'Ellerbeck', 'Advanced Certification', 370, to_date('05-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (371, 'Melony', 'Skydall', 'Specialist Certification', 371, to_date('26-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (372, 'Bondon', 'Stanett', 'Advanced Certification', 372, to_date('27-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (373, 'Katrinka', 'Gurery', 'Certified Professional', 373, to_date('20-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (374, 'Sebastian', 'Rolingson', 'Advanced Certification', 374, to_date('05-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (375, 'Stanton', 'Osgarby', 'Master Certification', 375, to_date('11-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (376, 'Kathe', 'Grant', 'Advanced Certification', 376, to_date('06-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (377, 'Zabrina', 'Cleugh', 'Expert Level', 377, to_date('29-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (378, 'Damien', 'Whipp', 'Certified Professional', 378, to_date('13-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (379, 'Umeko', 'Aird', 'Expert Level', 379, to_date('06-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (380, 'Bondie', 'Simonitto', 'Advanced Certification', 380, to_date('07-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (381, 'Keene', 'Sutterfield', 'Certified Professional', 381, to_date('15-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (382, 'Brade', 'Gothard', 'Master Certification', 382, to_date('24-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (383, 'Norri', 'Rosencwaig', 'Specialist Certification', 383, to_date('23-05-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (384, 'Lauralee', 'Robet', 'Master Certification', 384, to_date('01-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (385, 'Mina', 'Gribbon', 'Certified Professional', 385, to_date('26-05-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (386, 'Andree', 'Karadzas', 'Specialist Certification', 386, to_date('05-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (387, 'Lilian', 'Grabeham', 'Advanced Certification', 387, to_date('26-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (388, 'Gwenore', 'Fulun', 'Specialist Certification', 388, to_date('20-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (389, 'Baxter', 'Sicely', 'Expert Level', 389, to_date('19-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (390, 'Amery', 'Loweth', 'Expert Level', 390, to_date('30-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (391, 'Dedra', 'Ullyott', 'Advanced Certification', 391, to_date('14-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (392, 'Leda', 'Strowthers', 'Certified Professional', 392, to_date('26-05-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (393, 'Pyotr', 'Bozworth', 'Advanced Certification', 393, to_date('18-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (394, 'Juanita', 'Markus', 'Specialist Certification', 394, to_date('24-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (395, 'Mallorie', 'Duplock', 'Specialist Certification', 395, to_date('11-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (396, 'Bowie', 'Elce', 'Expert Level', 396, to_date('26-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (397, 'Kelsey', 'Reinbeck', 'Certified Professional', 397, to_date('25-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (398, 'Lannie', 'Irons', 'Advanced Certification', 398, to_date('02-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (399, 'Cris', 'Ugolini', 'Master Certification', 399, to_date('10-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (400, 'Filia', 'Angless', 'Expert Level', 400, to_date('13-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (426, 'Redford', 'Boaler', 'Expert Level', 426, to_date('02-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (427, 'Bryna', 'Clorley', 'Specialist Certification', 427, to_date('30-05-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (428, 'Cele', 'Skain', 'Certified Professional', 428, to_date('16-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (429, 'Robbie', 'Questier', 'Master Certification', 429, to_date('30-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (430, 'Berkley', 'Corro', 'Advanced Certification', 430, to_date('22-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (431, 'Zulema', 'Heninghem', 'Master Certification', 431, to_date('21-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (432, 'Timmie', 'Broadfield', 'Expert Level', 432, to_date('19-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (433, 'Malchy', 'Minnette', 'Specialist Certification', 433, to_date('26-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (434, 'Rea', 'Gouinlock', 'Expert Level', 434, to_date('16-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (435, 'Devora', 'McKellar', 'Advanced Certification', 435, to_date('22-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (436, 'Carri', 'Rops', 'Master Certification', 436, to_date('26-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (437, 'Carlita', 'Claworth', 'Advanced Certification', 437, to_date('22-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (438, 'Allissa', 'Grint', 'Master Certification', 438, to_date('24-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (439, 'Dennet', 'Ivannikov', 'Advanced Certification', 439, to_date('10-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (440, 'Prentice', 'Titcombe', 'Certified Professional', 440, to_date('12-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (441, 'Sinclair', 'Collip', 'Certified Professional', 441, to_date('18-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (442, 'Jaquelin', 'Traylen', 'Master Certification', 442, to_date('13-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (443, 'Ripley', 'Gantlett', 'Certified Professional', 443, to_date('22-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (444, 'Madonna', 'Yeats', 'Advanced Certification', 444, to_date('01-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (445, 'Kizzee', 'Farrimond', 'Specialist Certification', 445, to_date('08-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (446, 'Shannen', 'Forestel', 'Expert Level', 446, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (447, 'Alessandra', 'Sloane', 'Expert Level', 447, to_date('10-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (448, 'Yolanda', 'Grabiec', 'Specialist Certification', 448, to_date('14-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (449, 'Alfy', 'Relfe', 'Master Certification', 449, to_date('05-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (450, 'Ginger', 'Rakes', 'Master Certification', 450, to_date('11-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (451, 'Dulcie', 'Yerbury', 'Certified Professional', 451, to_date('19-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (452, 'Darsey', 'Weatherdon', 'Expert Level', 452, to_date('31-05-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (453, 'Paton', 'Hadigate', 'Specialist Certification', 453, to_date('13-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (454, 'Erwin', 'Gerssam', 'Specialist Certification', 454, to_date('15-01-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (455, 'Levey', 'Brownfield', 'Expert Level', 455, to_date('03-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (456, 'Rutledge', 'Phizackarley', 'Advanced Certification', 456, to_date('06-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (457, 'Vincenty', 'Furse', 'Certified Professional', 457, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (458, 'Rog', 'Merriday', 'Certified Professional', 458, to_date('10-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (459, 'Steffane', 'Nisuis', 'Specialist Certification', 459, to_date('15-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (460, 'Velma', 'Jeenes', 'Master Certification', 460, to_date('04-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (461, 'Eunice', 'Edmeads', 'Master Certification', 461, to_date('03-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (462, 'Beatrisa', 'Bader', 'Expert Level', 462, to_date('12-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (463, 'Hayes', 'Sloley', 'Specialist Certification', 463, to_date('07-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (464, 'Ines', 'O''Fallowne', 'Master Certification', 464, to_date('21-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (465, 'Binky', 'Brace', 'Certified Professional', 465, to_date('02-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (466, 'Gaylor', 'Costard', 'Advanced Certification', 466, to_date('12-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (467, 'Dora', 'Cicconetti', 'Specialist Certification', 467, to_date('21-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (468, 'Hilary', 'Kimmitt', 'Certified Professional', 468, to_date('29-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (469, 'Daffy', 'Herculeson', 'Expert Level', 469, to_date('02-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (470, 'Malia', 'Benois', 'Advanced Certification', 470, to_date('21-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (471, 'Karlis', 'Drover', 'Master Certification', 471, to_date('29-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (472, 'Clayson', 'Cumberlidge', 'Certified Professional', 472, to_date('10-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (473, 'Ranna', 'Eyden', 'Specialist Certification', 473, to_date('01-02-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (474, 'Merci', 'Scamerden', 'Specialist Certification', 474, to_date('24-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (475, 'Tina', 'Milne', 'Master Certification', 475, to_date('21-05-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (476, 'Magdaia', 'Jelf', 'Advanced Certification', 476, to_date('08-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (477, 'Shae', 'Whitehorne', 'Certified Professional', 477, to_date('14-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (478, 'Brigitta', 'Galliver', 'Advanced Certification', 478, to_date('08-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (479, 'Cross', 'Devlin', 'Specialist Certification', 479, to_date('23-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (480, 'Darn', 'Hullin', 'Expert Level', 480, to_date('30-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (481, 'Lester', 'Fallawe', 'Master Certification', 481, to_date('03-04-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (482, 'Neala', 'Akast', 'Master Certification', 482, to_date('07-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (483, 'Lorettalorna', 'Brimilcombe', 'Certified Professional', 483, to_date('03-10-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (484, 'Deni', 'Colbridge', 'Expert Level', 484, to_date('23-06-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (485, 'Jo', 'Dickerson', 'Advanced Certification', 485, to_date('14-03-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (486, 'Velma', 'Glassard', 'Certified Professional', 486, to_date('12-12-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (487, 'Quinton', 'Scanterbury', 'Advanced Certification', 487, to_date('11-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (488, 'Georges', 'Lucas', 'Certified Professional', 488, to_date('30-11-2023', 'dd-mm-yyyy'));
commit;
prompt 600 records committed...
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (489, 'Luci', 'Spering', 'Advanced Certification', 489, to_date('19-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (490, 'Coop', 'Czajka', 'Advanced Certification', 490, to_date('07-05-2024', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (491, 'Rocky', 'Stainfield', 'Expert Level', 491, to_date('21-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (492, 'Yulma', 'Conley', 'Certified Professional', 492, to_date('23-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (493, 'Winn', 'Jesse', 'Certified Professional', 493, to_date('27-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (494, 'Brena', 'Schulze', 'Advanced Certification', 494, to_date('20-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (495, 'Cyrus', 'Measey', 'Advanced Certification', 495, to_date('07-07-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (496, 'Hagan', 'Jedraszek', 'Certified Professional', 496, to_date('20-11-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (497, 'Dugald', 'Ciepluch', 'Specialist Certification', 497, to_date('05-09-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (498, 'Daryl', 'Glyn', 'Specialist Certification', 498, to_date('21-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (499, 'Marillin', 'Corbet', 'Expert Level', 499, to_date('30-08-2023', 'dd-mm-yyyy'));
insert into SAFETYOFFICERS (officer_id, first_name, last_name, certification, department_id, hire_date)
values (500, 'Bee', 'Vickors', 'Master Certification', 500, to_date('29-11-2023', 'dd-mm-yyyy'));
commit;
prompt 612 records loaded
prompt Enabling foreign key constraints for ENGINEERS...
alter table ENGINEERS enable constraint FK_ENGINEERS;
prompt Enabling foreign key constraints for PROJECTMANAGERS...
alter table PROJECTMANAGERS enable constraint FK_PROJECTMANAGERS;
alter table PROJECTMANAGERS enable constraint FK_PROJECTMANAGERS2;
prompt Enabling foreign key constraints for OFFICETECHNICIANS...
alter table OFFICETECHNICIANS enable constraint FK_OFFICETECHNICIANS;
prompt Enabling foreign key constraints for SAFETYOFFICERS...
alter table SAFETYOFFICERS enable constraint FK_SAFETYOFFICERS;
prompt Enabling triggers for DEPARTMENTS...
alter table DEPARTMENTS enable all triggers;
prompt Enabling triggers for PROJECTS...
alter table PROJECTS enable all triggers;
prompt Enabling triggers for ENGINEERS...
alter table ENGINEERS enable all triggers;
prompt Enabling triggers for PROJECTMANAGERS...
alter table PROJECTMANAGERS enable all triggers;
prompt Enabling triggers for OFFICETECHNICIANS...
alter table OFFICETECHNICIANS enable all triggers;
prompt Enabling triggers for SAFETYOFFICERS...
alter table SAFETYOFFICERS enable all triggers;

set feedback on
set define on
prompt Done
