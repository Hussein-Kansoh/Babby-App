-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!

-- This is only an example of how you add INSERT statements to this file.
--   You may remove it.
INSERT INTO mother(qcid, dateofbirth, phonenum, email, profession, name, adress, bloodtype) VALUES
(7942291,DATE '1991-07-14','(426) 160-6118','keelycantu@aol.ca','Software Developer','Keely Cantu', '327 Port Washington Road' ,'O-Positive')
,(6716526,DATE'1968-03-11','1-241-855-2584','beckirwin8908@yahoo.com','Construction','Victoria Gutierrez', '3938 Cornwall Street','O-Positive')
,(7141812,DATE'1997-10-04','(714) 437-3720','beaulangley@hotmail.net','Finance','Beau Langley', '3308 3rd Avenue', 'O-Positive')
,(1763060,DATE'1970-05-09','(433) 441-9539','hayescampos@outlook.com','Health','Hayes Campos', '3361 Albert Street', 'O-Negative')
,(6597903,DATE'1968-11-07','1-786-939-7241','harrisoncombs@hotmail.ca','Teacher','Harrison Combs', '', 'A-Negative')
,(6006621,DATE'2002-03-10','(378) 414-2744','risa9728@aol.com','Engineer','Risa Donnelly', '1393 50th Street', null)
,(827409,DATE'2000-04-25','(860) 313-0446','lacy@icloud.com','Psychologist','Lacy Goebbels', '213 De la Providence Avenue', 'O-Positive')
,(4612092,DATE'1991-05-10','(559) 960-1251','keelie7767@protonmail.org','Teacher','Keelie Shieh', '2761 Fourth Avenue', 'A-Positive')
,(6110409,DATE'1982-05-16','(161) 676-4009','amethyst413@aol.net','Broker','Amethyst Capocaccia', '2670 Fourth Avenue', 'O-Negative')
,(3863952,DATE'1985-03-02','1-346-936-6025','jennifer5793@outlook.ca','Doctor','Jennifer Lucier', '351 Nelson Street', 'A-Negative')
,(1465084,DATE'1990-03-13','(915) 237-4716','iola@google.edu','Lawyer','Iola Metzler','826 Boulevard Laflèche', 'O-Positive')
,(3316151,DATE'1998-03-15','(288) 648-2376','kyra6557@protonmail.net','Social worker','Kyra Kesey', '351 Nelson Street', 'O-Positive')
;


INSERT INTO father(id, qcid, dateofbirth, phonenum, email, profession, name, bloodtype ) VALUES
(3740, 6317953, DATE'1995-07-11', '(897) 8177457', 'ghighman0@nymag.com', 'Director of Sales', 'Gunar Highman', 'O-Positive')
,(3442, 168485, DATE'1985-06-19', '(899) 3708333', null, 'Safety Technician II', 'Ignazio Quincey', 'A-Negative')
,(1451, null, DATE'1971-01-13', '(257) 2071018', 'sclemson5@mediafire.com', 'VP Sales', 'Salim Clemson', 'A-Positive')
,(1495, 4381596, DATE'1987-12-26', '(477) 3173773', 'alope7@auda.org.au', 'Teacher', 'Albert Lope', 'O-Positive')
,(3939, null, DATE'1964-07-08', '(691) 5571906', 'rmonkhouse9@sohu.com', 'Staff Scientist', 'Rikki Monkhouse', null)
,(3043, 4266820, DATE'2000-10-19', '(507) 6596315', 'lshreevesa@wufoo.com', 'Assistant Media Planner', 'Lucio Shreeves', 'O-Positive')
,(213, 4532247, DATE'1966-12-10', '(738) 6489897', 'hstancliffec@nydailynews.com', 'Compensation Analyst', 'Hasheem Stancliffe', null)
,(3785, null, DATE'1966-08-08', '(323) 7018648', 'smahareye@arizona.edu', 'Occupational Therapist', 'Steven Maharey', 'O-Negative')
,(3079, 5200785, DATE'1978-07-28', '(919) 4821066', null, 'Food Chemist', 'Dillon Eccles', null);


INSERT INTO couple(coupleid, isinterested, ischosen, isqualified, qcid, id) VALUES
(582, true, true, true, 7942291, 3740)
,(4944, true, true, true, 6716526, 3442)
,(3668, true, false, true, 7141812, 1451)
,(3992, true, true, true, 1763060, 1495)
,(1277, true, true, true, 6597903, 3939)
,(4498, false, false, false, 6006621, 3043)
,(566, true, true, true, 827409, 213)
,(2716, true, true, true, 4612092, 3785)
,(2740, true, true, true, 6110409, 3079)
,(1237, false, false, true, 3863952, null)
,(68, true, false, true, 1465084, 3079)
,(174, true, true, true, 1465084, null)
;

INSERT INTO institution(email,name, number, website, address) VALUES
('schulist@multiply.com', 'Powlowski-Schulist', '391-102-8236', 'Powlowski-Schulist.com', '8 Green Hill')
,('jerde@storify.com', 'Roberts, Jerde and Senger', '303-248-8349', 'Roberts-Jerde-Senger.org', '27 Dexter Center')
,('boyer@webeden.co.uk', 'Trantow-Boyer', '683-359-9149', 'Trantow-Boyer.com', '5703 Artisan Pass')
,('mann@bravesites.com', 'Mann, Terry and Roob', '364-139-4736', 'Mann-Terry-Roob.mil', '63 Kipling Point')
,('mueller@psu.edu', 'Morissette, Mueller and Jones', '573-247-3321', 'Morissette-Mueller-Jones.net', '434 South Court')
,('wilderman@yahoo.com', 'Wilderman Group', '724-926-4174', 'Wilderman.net', '5753 Caliangt Parkway')
,('gorczany@technorati.com', 'Gorczany Group', '480-876-6564', 'Gorczany.inc', '9 Linden Park')
,('gwestmore7@gmail.com', 'Beahan-Gulgowski', '912-806-8256', 'Gulgowski.com.au', '2414 Londonderry Avenue')
,('lac_saint_louis@omniture.com', 'lac-saint-louis', '459-434-6644', 'Grady.net', '08 Washington Alley')
,('gutmann@nih.gov', 'Heller-Gutmann', '315-833-1124', 'Heller-Gutmann-health.com', '5355 Ridge Oak Trail')
;


INSERT INTO birthingcenter(email) VALUES
('schulist@multiply.com')
,('jerde@storify.com')
,('boyer@webeden.co.uk')
,('mann@bravesites.com')
,('mueller@psu.edu')
;

INSERT INTO communityclinic(email) VALUES
('wilderman@yahoo.com')
,('gorczany@technorati.com')
,('gwestmore7@gmail.com')
,('lac_saint_louis@omniture.com')
,('gutmann@nih.gov')
;

INSERT INTO midwife(practid, email, name, number, bemail) VALUES
(3478, 'ssuch0@homestead.com', 'Susan Such', '(235) 6300179', 'schulist@multiply.com')
,(4847, 'blordon1@reference.com', 'Blane Lordon', '(281) 2203059', 'jerde@storify.com')
,(3811, 'lrosetti4@feedburner.com', 'Lilia Rosetti', '(772) 4628737', 'boyer@webeden.co.uk')
,(3377, 'dkirk6@sciencedirect.com', 'Deny Kirk', '(598) 9782302', 'wilderman@yahoo.com')
,(3203, 'flightbourne7@smugmug.com', 'Farrah Lightbourne', '(360) 4335703', 'gorczany@technorati.com')
,(3371, 'hivetts8@unesco.org', 'Hillary Ivetts', '(785) 3048983', 'gwestmore7@gmail.com')
,(94, 'ksausman9@unblog.fr', 'Karalynn Sausman', '(270) 4945102', 'lac_saint_louis@omniture.com')
,(3385, 'saughtiea@weebly.com', 'Sybilla Aughtie', '(849) 5939986', 'lac_saint_louis@omniture.com')
,(3461, 'jconcannonb@state.gov', 'Jehanna Concannon', '(688) 9663409', 'schulist@multiply.com')
,(1276, 'jmeeganc@yolasite.com', 'Jillene Meegan', '(574) 7503052', 'wilderman@yahoo.com')
,(2036, 'cwayneg@bandcamp.com', 'Cairistiona Wayne', '(789) 7607473', 'boyer@webeden.co.uk')
,(4383, 'jitterm@1688.com', 'Janessa Itter', '(403) 8564361', 'wilderman@yahoo.com')
,(325, 'gdeansn@yellowbook.com', 'Germaine Deans', '(388) 2887576', 'gorczany@technorati.com')
,(4888, 'pkielloro@nydailynews.com', 'Penny Kiellor', '(337) 4517136', 'schulist@multiply.com')
,(856, 'hstubbeleyr@myspace.com', 'Haskel Stubbeley', '(415) 9717947', 'jerde@storify.com')
,(4020, 'gbarkt@blogs.com', 'Gillan Bark', '(482) 5612447', 'jerde@storify.com')
,(3483, 'atusony@vkontakte.ru', 'Alexia Tuson', '(139) 2226163', 'boyer@webeden.co.uk')
,(4564, 'girard13@qq.com', 'Marion Girard', '(221) 7118168', 'gwestmore7@gmail.com')
;


INSERT INTO pregnancy(coupleid, pregnancynumber, initialduedate, duedateultrasound, ishomebirth, finalduedate, duedatemenstrual, practid, bpractid, email) VALUES
(582, 1, '2020-05-10', '2020-05-10', true, '2020-05-04', '2020-05-04', 4564, 3478, null)
,(4944, 1, '2021-10-14', '2021-10-14', true, '2021-10-14', '2021-10-20', 3483, 4847, null)
,(3992, 1, '2021-02-28', '2021-02-28', false, '2021-02-28', '2021-02-20', 4020, 3811, 'jerde@storify.com')
,(1277, 1, '2021-02-05', '2021-02-05' , true, '2021-02-05', '2021-02-09', 856, 3377, null)
,(566, 1, '2020-11-10', '2020-11-10',true, '2020-11-05', '2020-11-05', 1276, 2036, null)
,(1277, 2, '2022-07-26', '2022-07-26', false, '2022-07-27', '2022-07-27', 94, 3203, 'mueller@psu.edu')
,(4944, 2, '2022-08-03', '2022-08-03', false, '2022-08-03', '2022-08-03', 4888, 3478, 'mann@bravesites.com')
,(3992, 2, '2022-04-17', '2022-04-17',true, '2022-04-17', '2022-04-21', 4564, 3371, null)
,(2716, 1, '2022-07-21', '2022-07-21', false, null, '2022-07-16', 3461, 4888, 'schulist@multiply.com')
,(2740, 1, '2022-04-13', '2022-04-13', true, '2022-04-13', '2022-04-15', 3385, 325, null)
,(68, 1, '2022-04-13', '2022-04-13', false, '2020-05-29', '2020-05-26', 3377, 3478, 'boyer@webeden.co.uk')
,(174, 1, '2020-03-28', '2020-03-28', false, '2020-04-01', '2020-04-01', 4383, 94, 'boyer@webeden.co.uk')
,(3992, 3, '2022-12-05', '2022-12-05', false, '2022-12-05', '2022-12-09', 2036, 4847, 'mann@bravesites.com')
,(566, 2, '2022-07-26', '2022-07-26', false, '2022-07-24', '2022-07-24', 1276, 856, 'jerde@storify.com')
;


INSERT INTO child(dateofbirth, timeOfBirth, coupleid, pregnancynumber, name, gender) VALUES
('2020-05-04', '11:30 PM', 582, 1, 'Theda', 'Female'),
('2021-10-14', '5:41 PM', 4944, 1, 'Hinze', 'Female'),
('2021-02-28', '2:32 AM', 3992, 1, 'Eleni', 'Male'),
('2021-02-05', '4:58 AM', 1277, 1, 'Mala', 'Male'),
('2020-11-05', '4:29 AM', 566, 1, 'Valida', 'Female'),
('2022-07-27', '12:20 AM', 1277, 2, 'Madlin', 'Male'),
('2022-08-03', '5:37 PM', 4944, 2, 'Johnnie', 'Male'),
('2022-04-17', '2:59 AM', 3992, 2, 'Moina', 'Female'),
('2022-07-16', '4:06 AM', 2716, 1, 'Evangelia', 'Male'),
('2022-04-13', '2:04 PM', 2740, 1, 'Bobbee', 'Female'),
('2020-05-29', '5:01 AM', 68, 1, 'Ricky', 'Female'),
('2020-04-01', '3:58 PM', 174, 1, 'Rowen', 'Male'),
('2022-12-05', '6:40 AM', 3992, 3, 'Phelia', 'Male'),
('2022-07-24', '1:49 AM', 566, 2, 'Elsie', 'Female'),
('2021-02-05', '5:19 AM', 1277, 1, 'Ruby', 'Female'),
('2021-02-28', '2:46 PM', 3992, 1, 'Diana', 'Female'),
('2022-07-27', '12:36 AM', 1277, 2, 'Dag', 'Male')
;



INSERT INTO infosession(sessionid, date, time, language, practid) VALUES
(772, '2020-01-04', '2:00 PM', 'English', 4020)
,(3560, '2020-06-07', '1:30 PM', 'French', 856)
,(1856, '2021-01-05', '3:00 PM', 'French', 2036)
,(1418, '2021-01-06', '2:00 PM', 'English', 3811)
,(1185, '2022-01-04', '3:00 PM', 'English', 3385)
,(2043, '2020-06-03', '2:00 PM', 'English', 3483)
;

INSERT INTO technician(techid, name, phonenum) VALUES
(598, 'Leonelle Lippiatt', '(466) 5637992'),
(4961, 'Vinny Durdy', '(181) 7502438'),
(2517, 'Correy Luigi', '(630) 7957019'),
(4909, 'Antonio Triggle', '(980) 7185757'),
(3717, 'Cooper Norton', '(201) 7299030'),
(4284, 'Dody Lambie', '(911) 3299642'),
(110, 'Griffith Axtens', '(609) 9545538'),
(3091, 'Esra Ellison', '(283) 1864178')
;


INSERT INTO appointment(appointmentid, practid, coupleid, pregnancynumber, date ,time) VALUES
(3952, 4564, 582, 1, '2020-01-04','2:00 PM'),
(153, 3483, 4944, 1, '2021-02-14','3:00 PM'),
(4630, 4020, 3992, 1, '2020-08-28','2:00 PM'),
(654, 856, 1277, 1, '2020-09-05','3:00 PM'),
(1077, 1276, 566, 1, '2020-03-05','3:00 PM'),
(1320, 3203, 1277, 2, '2022-01-27','1:00 PM'),
(158, 4888, 4944, 2, '2022-01-03','4:00 PM'),
(1655, 4564, 3992, 2, '2022-03-22','2:00 PM'),
(4945, 3461, 2716, 1, '2022-01-16','1:00 PM'),
(3233, 3385, 2740, 1, '2021-11-13','4:00 PM'),
(1040, 3377, 68, 1,  '2020-01-29','1:00 PM'),
(1697, 4383, 174, 1, '2020-01-01','3:00 PM'),
(38, 2036, 3992, 3, '2022-05-05','3:00 PM'),
(706, 1276, 566, 2, '2022-01-24','1:00 PM'),
(2881, 3478, 582, 1, '2020-04-04','4:00 PM'),
(4559, 4564, 4944, 1, '2021-05-14','5:00 PM'),
(4755, 2036, 566, 1, '2020-06-05','4:00 PM'),
(2641, 3478, 4944, 2, '2022-04-03','1:00 PM'),
(4099, 4564, 3992, 2, '2022-03-24','2:00 PM'),
(4722, 856, 566, 2, '2022-04-24','5:00 PM'),
(2520, 94, 174, 1, '2020-03-21','4:00 PM'),
(3394, 1276, 566, 1, '2020-06-05','3:00 PM'),
(4601, 3483, 4944, 1, '2021-06-28','2:00 PM'),
(629, 4020, 3992, 1, '2020-10-28','1:00 PM'),
(20, 94, 1277, 2, '2022-03-27','3:00 PM')
;

INSERT INTO note(date, time, appointmentid) VALUES
('2020-01-04','2:05 PM', 3952),
('2021-02-14','3:05 PM', 153),
('2020-08-28','2:06 PM', 4630),
('2020-09-05','3:07 PM', 654),
('2020-03-05','3:08 PM', 1077),
('2022-01-27','1:05 PM', 1320),
('2022-01-03','4:06 PM', 158),
('2022-01-16','1:07 PM', 4945),
('2021-11-13','4:00 PM', 3233),
('2020-01-29','1:02 PM', 1040),
('2020-01-01','3:10 PM', 1697),
('2022-01-24','1:20 PM', 706),
('2020-04-04','4:11 PM', 2881),
('2021-05-14','5:11 PM', 4559),
('2020-06-05','4:12 PM', 4755),
('2022-04-03','1:15 PM', 2641),
('2022-04-24','5:16 PM', 4722),
('2020-03-21','4:13 PM', 2520),
('2020-06-05','3:08 PM', 3394),
('2021-06-28','2:09 PM', 4601),
('2020-10-28','1:19 PM', 629),
('2022-03-27','3:03 PM', 20),
('2020-01-04','2:30 PM', 3952),
('2021-02-14','3:31 PM', 153),
('2020-08-28','2:32 PM', 4630),
('2020-09-05','3:33 PM', 654),
('2020-03-05','3:34 PM', 1077),
('2022-01-27','1:36 PM', 1320),
('2022-01-03','4:32 PM', 158),
('2022-01-16','1:35 PM', 4945),
('2021-11-13','4:12 PM', 3233),
('2020-01-04','2:50 PM', 3952),
('2021-02-14','3:51 PM', 153),
('2020-08-28','2:52 PM', 4630),
('2020-09-05','3:53 PM', 654),
('2020-03-05','3:54 PM', 1077)
;


INSERT INTO medicaltest(testid, datetaken, result, dateprescribed, type, date, coupleid, pregnancynumber, practid, techid, dateofbirth, timeOfBirth) VALUES
(1938, '2022-01-03', 'et magnis', '2022-01-02', 'blood iron', '2022-01-03', 4944, 2, 4888, 598, null, null),
(226, '2020-01-02', 'vestibulum sagittis', '2020-01-01', 'complete blood count', '2020-01-01', 582, 1, 4564, 4961, '2020-05-04', '11:30 PM'),
(2740, '2020-09-02', 'dictumst morbi', '2020-09-01', 'blood iron', '2020-09-02', 1277, 1, 856, null, null, null),
(546, '2021-02-05', 'dolor sit amet consectetuer', '2021-02-04', 'complete blood count', '2021-02-04', 4944, 1, 4564, 2517, '2021-10-14', '5:41 PM'),
(1727, '2021-02-18', 'penatibus et magnis', '2021-02-15', 'blood iron', '2021-02-18', 3992, 1, 4020, 4909, '2021-02-28', '2:32 AM'),
(4166, '2022-01-02', 'lacinia erat vest', '2022-01-01', 'complete blood count', '2022-01-02', 4944, 2, 4888, 3717, null, null),
(3880, '2020-03-04', 'dapibus', '2020-03-02', 'complete blood count', '2020-03-04', 174, 1, 4383, 4284, null, null),
(2387, '2020-11-03', 'consectetuer', '2020-11-02', 'blood iron', '2020-11-03', 566, 1, 1276, null, '2020-11-05', '4:29 AM'),
(1392, '2022-02-17', 'eros elementum', '2022-02-15', 'complete blood count', '2022-02-15', 3992, 1, 4020, 3091, '2021-02-28', '2:32 AM'),
(4073, '2020-01-29', 'eros elementum', '2020-01-27', 'blood iron', '2020-01-29', 68, 1, 3377, null, null, null),
(2880, '2022-04-03', 'nibh in quis', '2022-04-02', 'blood iron', '2022-04-03', 4944, 2, 4888, 4961, null, null),
(2885, '2022-04-03', 'nibh in quis', '2022-04-02', 'blood iron', '2022-04-03', 4944, 2, 4888, 4961, null, null);



INSERT INTO invites(email, coupleid, practid, ifregistered, ifattended) VALUES
('lac_saint_louis@omniture.com', 582, 4564, true, true),
('lac_saint_louis@omniture.com', 4944, 4564, true, true),
('lac_saint_louis@omniture.com', 3668, 4564, false, true),
('lac_saint_louis@omniture.com', 3992, 4564, true, true),
('boyer@webeden.co.uk', 1277, 4564, true, true),
('boyer@webeden.co.uk', 4498, 4564, true, false),
('boyer@webeden.co.uk', 566, 4564, true, true),
('gorczany@technorati.com', 2716, 4020, true, true),
('gorczany@technorati.com', 2740, 4020, true, true),
('schulist@multiply.com', 1237, 856, false, false),
('schulist@multiply.com', 68, 856, true, true),
('gwestmore7@gmail.com', 174, 4888, true, true),
('gwestmore7@gmail.com', 1277, 4888, true, true),
('lac_saint_louis@omniture.com', 4944, 325, true, true),
('lac_saint_louis@omniture.com', 3992, 325, true, true),
('lac_saint_louis@omniture.com', 566, 325, true, true),
('gwestmore7@gmail.com', 3992, 325, true, true)
;
