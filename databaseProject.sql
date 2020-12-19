DROP SCHEMA IF EXISTS project;
CREATE SCHEMA IF NOT EXISTS project;
USE project;
DROP TABLE IF EXISTS client;
CREATE TABLE client(
	employeeID INTEGER NOT NULL,
    address VARCHAR(500) DEFAULT NULL,
    name VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (employeeID)
);

DROP TABLE IF EXISTS publisher;
CREATE TABLE publisher(
	publisherID INTEGER NOT NULL,
    publisherName VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (publisherID)
);

DROP TABLE IF EXISTS role;
CREATE TABLE role(
	roleID INTEGER NOT NULL,
    roleName VARCHAR(50) DEFAULT NULL,
    PRIMARY KEY (roleID)
);

DROP TABLE IF EXISTS titles;
CREATE TABLE titles(
	titleID int not null,
	titleName varchar(100) default null,
    publishYear date default null,
    entryDate date default null,
    categoryFKey int default null,
    publisherFKey int default null,
    mediaFKey int default null,
    contributorFKey int default null,
    publisherName varchar(50) default null
	/*constraint medK foreign key (mediaFKey) references media(mediaID),
    constraint catK foreign key (categoryFkey) references categories(categoryID)*/
);

ALTER TABLE titles
ADD constraint medK foreign key (mediaFKey) references media(mediaID);

ALTER TABLE titles
DROP constraint medk;

ALTER TABLE titles
ADD constraint catK foreign key (categoryFkey) references categories(categoryID);

ALTER TABLE titles
DROP constraint catK;

DROP TABLE IF EXISTS contributor;
CREATE TABLE contributor(
	contributorID INTEGER NOT NULL,
    name VARCHAR(50) DEFAULT NULL,
    nationality VARCHAR(100) DEFAULT NULL,
    nonDomContributorFKey int default null,
    domContributorFKey int default null,
    PRIMARY KEY (contributorID)
    /*constraint nonDomCon foreign key (nonDomContributorFKey) references nonDomContributor(nonDomContributorID),
    constraint domCon foreign key (domContributorFKey) references domContributor(domContributorID)*/
);
ALTER TABLE contributor
ADD CONSTRAINT nonDomCon foreign key (nonDomContributorFKey) references nonDomContributor(nonDomContributorID);

ALTER TABLE contributor
DROP constraint nonDomCon;

ALTER TABLE contributor
ADD CONSTRAINT domCon foreign key (domContributorFKey) references domContributor(domContributorID);

ALTER TABLE contributor
DROP constraint domCon;

DROP TABLE IF EXISTS nonDomContributor;
CREATE TABLE nonDomContributor(
	nonDomContributorID int not null,
	country VARCHAR(50) DEFAULT NULL,
    email VARCHAR(100) DEFAULT NULL,
    phone varchar(45) DEFAULT '1-357-123-4567',
    primary key(nonDomContributorID),
	contributorFKey int default null,
    CONSTRAINT nonDo FOREIGN KEY (contributorFKey) REFERENCES contributor(contributorID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
	/*FOREIGN KEY (contributorFKey) REFERENCES contributor(contributorID)*/
);

ALTER TABLE nonDomContributor
ADD CONSTRAINT FOREIGN KEY (contributorFKey) REFERENCES contributor(contributorID);

DROP TABLE IF EXISTS domContributor;
CREATE TABLE domContributor(
	domContributorID int not null,
    street varchar(50) default null,
    state varchar(50) default null,
    city varchar (100) default null,
    zipcode int default "0000",
    primary key (domContributorID),
    contributorFKey int default null,
	CONSTRAINT domCo FOREIGN KEY (contributorFKey) REFERENCES contributor(contributorID)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION
    /*foreign key (contributorFKey) references contributor(contributorID)*/
);

ALTER TABLE domContributor
ADD CONSTRAINT foreign key (contributorFKey) references contributor(contributorID);

ALTER TABLE domContributor
DROP constraint contributorFKey;

DROP TABLE IF EXISTS categories;
CREATE TABLE categories(
	categoryID int not null,
    categoryName varchar(50) default null,
    primary key(categoryID)
);

DROP TABLE IF EXISTS media;
CREATE TABLE media(
	mediaID int not null,
    mediaName varchar(50) default null,
    primary Key(mediaID)
);

/*Client 100 rows batch of 4*/
INSERT INTO client (employeeID,address,name) VALUES (1,"795-9536 Nam Avenue","Moana"),(2,"Ap #120-6896 Ipsum Rd.","Maggy"),(3,"P.O. Box 716, 1990 Erat Av.","Kieran"),(4,"P.O. Box 936, 5785 Posuere, St.","Hop");
INSERT INTO client (employeeID,address,name) VALUES (5,"437-2395 Laoreet, Street","Jessica"),(6,"Ap #398-4627 Mauris St.","Xenos"),(7,"2008 Nunc St.","Belle"),(8,"300-8722 Enim Street","Cullen");
INSERT INTO client (employeeID,address,name) VALUES (9,"488-1736 Amet, Road","Rooney"),(10,"9713 Donec Rd.","Jada"),(11,"9824 Vitae Ave","Brendan"),(12,"Ap #174-9094 Quis Av.","April");
INSERT INTO client (employeeID,address,name) VALUES (13,"P.O. Box 618, 1880 Massa. Street","Megan"),(14,"Ap #938-5604 Neque Rd.","Hollee"),(15,"Ap #347-9873 Et Street","Yetta"),(16,"P.O. Box 961, 4553 Pulvinar Ave","Lucy");
INSERT INTO client (employeeID,address,name) VALUES (17,"P.O. Box 853, 5167 Ipsum St.","Omar"),(18,"1702 Aenean Road","Idona"),(19,"497-2647 Pharetra Ave","Evan"),(20,"Ap #922-7088 Ornare Rd.","Demetrius");
INSERT INTO client (employeeID,address,name) VALUES (21,"Ap #738-4064 Lorem, St.","Alvin"),(22,"280-949 Mauris Road","Tana"),(23,"8396 Feugiat St.","Donna"),(24,"Ap #395-1123 Gravida St.","Hamish");
INSERT INTO client (employeeID,address,name) VALUES (25,"2078 Sed, Rd.","Damon"),(26,"P.O. Box 859, 3633 Sed, Ave","Carlos"),(27,"P.O. Box 733, 9837 Libero Rd.","Tiger"),(28,"Ap #272-5544 Maecenas St.","Sasha");
INSERT INTO client (employeeID,address,name) VALUES (29,"Ap #895-9502 Risus. Avenue","Beatrice"),(30,"6751 Pharetra, St.","Howard"),(31,"5654 Ipsum Road","Kyla"),(32,"P.O. Box 477, 1936 Ligula Road","Justin");
INSERT INTO client (employeeID,address,name) VALUES (33,"Ap #198-5293 Donec Ave","Ira"),(34,"P.O. Box 660, 3133 Libero Street","Blossom"),(35,"5859 Scelerisque Road","Lynn"),(36,"394 Ut, St.","Blaze");
INSERT INTO client (employeeID,address,name) VALUES (37,"6099 Maecenas Road","Montana"),(38,"758-5021 Convallis St.","Cassady"),(39,"8160 In Street","Keefe"),(40,"P.O. Box 723, 1466 Nullam Avenue","Gwendolyn");
INSERT INTO client (employeeID,address,name) VALUES (41,"9202 Integer Rd.","Jessica"),(42,"682-2113 Lorem Av.","Selma"),(43,"P.O. Box 709, 9436 Egestas. St.","Kasper"),(44,"Ap #767-7858 Nulla Rd.","Edward");
INSERT INTO client (employeeID,address,name) VALUES (45,"Ap #786-9773 Tristique Rd.","Chanda"),(46,"P.O. Box 810, 2588 Sed Avenue","Abra"),(47,"P.O. Box 380, 9861 At, St.","Davis"),(48,"1815 Auctor. Road","Paki");
INSERT INTO client (employeeID,address,name) VALUES (49,"623-6088 Libero. Av.","Odessa"),(50,"Ap #283-7283 Egestas St.","Sybill"),(51,"P.O. Box 486, 3518 Dignissim Ave","Hall"),(52,"1942 Eget St.","Imogene");
INSERT INTO client (employeeID,address,name) VALUES (53,"597-1593 Sollicitudin Street","Eagan"),(54,"Ap #535-6795 Quisque Avenue","Kasper"),(55,"708-8189 Lacinia St.","Keefe"),(56,"5940 Consectetuer Street","Lilah");
INSERT INTO client (employeeID,address,name) VALUES (57,"4700 Tincidunt Road","Brittany"),(58,"Ap #196-512 Rutrum Ave","Mikayla"),(59,"6434 Parturient Ave","Griffith"),(60,"968-9311 Luctus, Rd.","Cooper");
INSERT INTO client (employeeID,address,name) VALUES (61,"Ap #250-1598 Ultrices. Av.","Violet"),(62,"Ap #808-3158 In Ave","Alexander"),(63,"3826 Convallis St.","Ignacia"),(64,"Ap #174-6392 Massa. Rd.","Jasmine");
INSERT INTO client (employeeID,address,name) VALUES (65,"701 Consequat St.","Beau"),(66,"Ap #737-9768 Malesuada Avenue","Jane"),(67,"938-1424 Phasellus Ave","Paula"),(68,"Ap #680-4295 Metus. Rd.","Michelle");
INSERT INTO client (employeeID,address,name) VALUES (69,"1975 Tempus Street","Blythe"),(70,"P.O. Box 950, 7469 Tempus Rd.","Lewis"),(71,"653-1097 Mi, St.","Amber"),(72,"835-3612 Feugiat Street","Kuame");
INSERT INTO client (employeeID,address,name) VALUES (73,"Ap #662-4702 Nec Road","Brandon"),(74,"Ap #719-7101 Integer Rd.","Derek"),(75,"Ap #825-525 Placerat, Ave","Orson"),(76,"3818 Eros. Ave","Elvis");
INSERT INTO client (employeeID,address,name) VALUES (77,"P.O. Box 481, 2486 Enim St.","Eric"),(78,"Ap #521-7772 Sed Ave","Quinn"),(79,"Ap #908-4055 In St.","Deanna"),(80,"599-8352 Per Avenue","Ira");
INSERT INTO client (employeeID,address,name) VALUES (81,"584-9337 Ut Ave","Scarlett"),(82,"3936 Aliquet Ave","Heidi"),(83,"4885 Donec Rd.","Lionel"),(84,"4248 Orci Av.","Amal");
INSERT INTO client (employeeID,address,name) VALUES (85,"8309 Tincidunt Street","Kim"),(86,"555-5170 Aliquam Street","Tanisha"),(87,"835-9071 Lacinia Street","Willow"),(88,"P.O. Box 305, 9837 Nulla Ave","Dane");
INSERT INTO client (employeeID,address,name) VALUES (89,"470-6420 Aptent St.","Carl"),(90,"Ap #279-9439 Est. Rd.","Dennis"),(91,"653-2523 At St.","Catherine"),(92,"P.O. Box 917, 9765 Mollis. St.","Skyler");
INSERT INTO client (employeeID,address,name) VALUES (93,"P.O. Box 498, 7627 Proin Avenue","Buckminster"),(94,"769-1952 Orci Avenue","Jermaine"),(95,"302-154 Mattis. Street","Cassady"),(96,"Ap #776-6108 Scelerisque Road","Sean");
INSERT INTO client (employeeID,address,name) VALUES (97,"651-3002 Donec Street","Hop"),(98,"Ap #685-4992 Semper Rd.","Renee"),(99,"347-3268 Etiam Street","Bo"),(100,"798-7113 Sed, Rd.","Kasper");

/*Publisher 100 rows batch of 8*/
INSERT INTO publisher (publisherID,publisherName) VALUES (1,"Hyatt"),(2,"Brenden"),(3,"Wyatt"),(4,"Breanna"),(5,"Damian"),(6,"Acton"),(7,"Lawrence"),(8,"Ashely");
INSERT INTO publisher (publisherID,publisherName) VALUES (9,"Montana"),(10,"Colin"),(11,"Josiah"),(12,"James"),(13,"Alfreda"),(14,"Arsenio"),(15,"Mason"),(16,"Pandora");
INSERT INTO publisher (publisherID,publisherName) VALUES (17,"Chester"),(18,"Baker"),(19,"Leilani"),(20,"Phillip"),(21,"Urielle"),(22,"Shaeleigh"),(23,"Brady"),(24,"Zenia");
INSERT INTO publisher (publisherID,publisherName) VALUES (25,"Kirestin"),(26,"Mary"),(27,"Gay"),(28,"Kathleen"),(29,"Kessie"),(30,"Erica"),(31,"Clio"),(32,"Aaron");
INSERT INTO publisher (publisherID,publisherName) VALUES (33,"Cassady"),(34,"Thor"),(35,"Driscoll"),(36,"Kim"),(37,"Brock"),(38,"Ciaran"),(39,"Dillon"),(40,"Ciaran");
INSERT INTO publisher (publisherID,publisherName) VALUES (41,"Holmes"),(42,"Xanthus"),(43,"Rina"),(44,"Jennifer"),(45,"Zelenia"),(46,"Dustin"),(47,"Michelle"),(48,"Jordan");
INSERT INTO publisher (publisherID,publisherName) VALUES (49,"Devin"),(50,"Chadwick"),(51,"Kyra"),(52,"Rebekah"),(53,"Kermit"),(54,"Maite"),(55,"Lyle"),(56,"Clio");
INSERT INTO publisher (publisherID,publisherName) VALUES (57,"Indira"),(58,"Hannah"),(59,"Raphael"),(60,"Giselle"),(61,"Fulton"),(62,"Jennifer"),(63,"Wendy"),(64,"Neve");
INSERT INTO publisher (publisherID,publisherName) VALUES (65,"Xandra"),(66,"Nina"),(67,"Germaine"),(68,"Hayley"),(69,"Dustin"),(70,"Ira"),(71,"Jordan"),(72,"Byron");
INSERT INTO publisher (publisherID,publisherName) VALUES (73,"Emery"),(74,"Kennan"),(75,"Fleur"),(76,"Kaden"),(77,"Kendall"),(78,"May"),(79,"Carissa"),(80,"Britanney");
INSERT INTO publisher (publisherID,publisherName) VALUES (81,"Steel"),(82,"Bruce"),(83,"Tobias"),(84,"Duncan"),(85,"Angela"),(86,"Maggy"),(87,"Savannah"),(88,"Samson");
INSERT INTO publisher (publisherID,publisherName) VALUES (89,"Karyn"),(90,"Andrew"),(91,"Mohammad"),(92,"Alika"),(93,"Darius"),(94,"Indigo"),(95,"Michelle"),(96,"Jessica");
INSERT INTO publisher (publisherID,publisherName) VALUES (97,"Winter"),(98,"Rina"),(99,"David"),(100,"Lewis");

/*Role 100 rows batch of 8*/
INSERT INTO role (roleID,roleName) VALUES (1,"Elmo"),(2,"Lamar"),(3,"Rowan"),(4,"Christen"),(5,"Noah"),(6,"Quincy"),(7,"Barbara"),(8,"Callum");
INSERT INTO role (roleID,roleName) VALUES (9,"Fatima"),(10,"Isaac"),(11,"Pamela"),(12,"Sarah"),(13,"Levi"),(14,"Dacey"),(15,"Sophia"),(16,"Nigel");
INSERT INTO role (roleID,roleName) VALUES (17,"Hiram"),(18,"Halee"),(19,"Keely"),(20,"Abraham"),(21,"Amela"),(22,"Hilel"),(23,"Jada"),(24,"Fuller");
INSERT INTO role (roleID,roleName) VALUES (25,"April"),(26,"Maryam"),(27,"Anastasia"),(28,"Zeph"),(29,"Scarlett"),(30,"Quinn"),(31,"Kermit"),(32,"Kai");
INSERT INTO role (roleID,roleName) VALUES (33,"Jacob"),(34,"Sebastian"),(35,"Amena"),(36,"Margaret"),(37,"Keith"),(38,"Alana"),(39,"Maxine"),(40,"Clare");
INSERT INTO role (roleID,roleName) VALUES (41,"Kathleen"),(42,"Leah"),(43,"Aladdin"),(44,"Chester"),(45,"Jade"),(46,"James"),(47,"Austin"),(48,"Amos");
INSERT INTO role (roleID,roleName) VALUES (49,"Rhonda"),(50,"Macon"),(51,"Ryder"),(52,"Ivan"),(53,"Anika"),(54,"Quamar"),(55,"Silas"),(56,"Channing");
INSERT INTO role (roleID,roleName) VALUES (57,"Shelly"),(58,"Mia"),(59,"Jacob"),(60,"Harlan"),(61,"Nina"),(62,"Jessamine"),(63,"Len"),(64,"Clark");
INSERT INTO role (roleID,roleName) VALUES (65,"Declan"),(66,"Vernon"),(67,"Phyllis"),(68,"Nathaniel"),(69,"Hannah"),(70,"Eric"),(71,"Emma"),(72,"Ferdinand");
INSERT INTO role (roleID,roleName) VALUES (73,"Vaughan"),(74,"Russell"),(75,"Nicholas"),(76,"Xyla"),(77,"Gillian"),(78,"Charlotte"),(79,"Susan"),(80,"Geraldine");
INSERT INTO role (roleID,roleName) VALUES (81,"Quynn"),(82,"Magee"),(83,"Sade"),(84,"Brent"),(85,"Micah"),(86,"Ivor"),(87,"Molly"),(88,"Xavier");
INSERT INTO role (roleID,roleName) VALUES (89,"Samantha"),(90,"Coby"),(91,"William"),(92,"Megan"),(93,"Signe"),(94,"Mara"),(95,"Caldwell"),(96,"Ivana");
INSERT INTO role (roleID,roleName) VALUES (97,"Elmo"),(98,"Sean"),(99,"Liberty"),(100,"John");

/*titles 100 rows batch of 1*/
INSERT INTO titles (titleID,titleName,publishYear,entryDate,categoryFKey,publisherFKey,mediaFKey,contributorFKey,publisherName) VALUES (1,"Damian","24-06-20","16-07-21",1,1,1,1,"Duncan"),(2,"Doris","10-06-20","17-10-20",2,2,2,2,"Mclaughlin"),(3,"Zia","13-08-20","11-09-21",3,3,3,3,"Johnson"),(4,"Rachel","19-11-20","24-08-20",4,4,4,4,"Bowman"),(5,"Ava","21-01-21","14-06-21",5,5,5,5,"Levine"),(6,"Aubrey","25-03-20","21-02-20",6,6,6,6,"Burnett"),(7,"Malachi","20-04-21","07-08-21",7,7,7,7,"Page"),(8,"Kendall","03-10-20","02-06-21",8,8,8,8,"Holt"),(9,"Melissa","13-01-21","23-08-21",9,9,9,9,"Stephens"),(10,"Cain","29-01-21","16-01-20",10,10,10,10,"Perkins");
INSERT INTO titles (titleID,titleName,publishYear,entryDate,categoryFKey,publisherFKey,mediaFKey,contributorFKey,publisherName) VALUES (11,"Juliet","28-07-21","09-06-21",11,11,11,11,"Barlow"),(12,"Shay","23-04-21","19-12-20",12,12,12,12,"Wong"),(13,"Shannon","11-03-20","24-11-19",13,13,13,13,"Holmes"),(14,"Colby","24-06-21","11-01-20",14,14,14,14,"Burks"),(15,"Jordan","05-09-21","26-05-20",15,15,15,15,"Mack"),(16,"Holmes","06-01-21","19-12-20",16,16,16,16,"Williams"),(17,"Lois","12-08-21","02-06-21",17,17,17,17,"Vang"),(18,"Idona","25-11-20","16-03-20",18,18,18,18,"Shaw"),(19,"Brock","26-06-20","05-11-21",19,19,19,19,"Snyder"),(20,"Wanda","29-08-20","04-06-20",20,20,20,20,"Davis");
INSERT INTO titles (titleID,titleName,publishYear,entryDate,categoryFKey,publisherFKey,mediaFKey,contributorFKey,publisherName) VALUES (21,"Garrett","07-03-20","13-06-21",21,21,21,21,"Macdonald"),(22,"Yardley","12-03-21","04-04-21",22,22,22,22,"Duke"),(23,"Kaseem","06-12-20","31-08-20",23,23,23,23,"Barnes"),(24,"Kennan","06-01-20","13-04-20",24,24,24,24,"Guerra"),(25,"Amery","21-07-20","04-01-21",25,25,25,25,"Gallagher"),(26,"Breanna","01-01-20","13-07-21",26,26,26,26,"Hunter"),(27,"Warren","11-04-21","06-09-21",27,27,27,27,"Hensley"),(28,"William","09-10-20","21-09-20",28,28,28,28,"Bush"),(29,"Zorita","07-11-20","29-01-20",29,29,29,29,"Ferrell"),(30,"Devin","23-01-20","11-07-20",30,30,30,30,"Chapman");
INSERT INTO titles (titleID,titleName,publishYear,entryDate,categoryFKey,publisherFKey,mediaFKey,contributorFKey,publisherName) VALUES (31,"Raja","08-06-20","04-12-20",31,31,31,31,"Wilcox"),(32,"Noble","25-10-20","17-10-20",32,32,32,32,"Robinson"),(33,"Scott","06-05-20","22-08-20",33,33,33,33,"Hoffman"),(34,"Brenden","26-04-21","07-11-20",34,34,34,34,"Shelton"),(35,"Cade","02-11-21","11-07-21",35,35,35,35,"Harrell"),(36,"Fallon","26-07-21","14-08-20",36,36,36,36,"Weeks"),(37,"Lila","07-12-20","29-01-21",37,37,37,37,"Fisher"),(38,"Linda","10-08-21","27-11-20",38,38,38,38,"Kidd"),(39,"Troy","21-05-20","01-10-20",39,39,39,39,"Page"),(40,"Rudyard","16-03-21","31-05-20",40,40,40,40,"Solis");
INSERT INTO titles (titleID,titleName,publishYear,entryDate,categoryFKey,publisherFKey,mediaFKey,contributorFKey,publisherName) VALUES (41,"Devin","18-09-21","30-09-21",41,41,41,41,"Hancock"),(42,"Ann","07-05-20","01-04-20",42,42,42,42,"Chambers"),(43,"Ryder","05-09-20","14-03-21",43,43,43,43,"Cherry"),(44,"Ariana","16-12-19","09-10-20",44,44,44,44,"Sanders"),(45,"Kasimir","12-07-21","05-01-20",45,45,45,45,"Whitehead"),(46,"Nayda","04-11-20","04-05-20",46,46,46,46,"Becker"),(47,"Isaac","07-10-21","16-02-21",47,47,47,47,"Humphrey"),(48,"Geraldine","13-08-21","14-08-20",48,48,48,48,"Bray"),(49,"David","01-06-21","20-11-20",49,49,49,49,"Bullock"),(50,"Cooper","08-05-20","13-08-21",50,50,50,50,"Davis");
INSERT INTO titles (titleID,titleName,publishYear,entryDate,categoryFKey,publisherFKey,mediaFKey,contributorFKey,publisherName) VALUES (51,"Hilda","18-09-21","04-07-20",51,51,51,51,"Taylor"),(52,"Naomi","21-12-19","12-11-20",52,52,52,52,"Roberts"),(53,"Hedley","29-09-21","03-05-21",53,53,53,53,"Miranda"),(54,"Emmanuel","10-07-20","16-12-20",54,54,54,54,"Keith"),(55,"Damian","09-12-19","03-04-21",55,55,55,55,"Santos"),(56,"Aurelia","02-01-21","03-12-20",56,56,56,56,"Dickerson"),(57,"Zeus","04-11-21","20-07-20",57,57,57,57,"Allen"),(58,"Baxter","18-09-21","23-03-20",58,58,58,58,"Greene"),(59,"Giacomo","27-03-20","10-06-20",59,59,59,59,"Carson"),(60,"Armand","25-12-20","22-06-20",60,60,60,60,"Adams");
INSERT INTO titles (titleID,titleName,publishYear,entryDate,categoryFKey,publisherFKey,mediaFKey,contributorFKey,publisherName) VALUES (61,"Ferdinand","03-09-20","23-04-21",61,61,61,61,"House"),(62,"Odette","29-01-20","10-08-20",62,62,62,62,"Norris"),(63,"Abdul","19-10-21","31-10-21",63,63,63,63,"Mcintyre"),(64,"Maxine","20-10-21","18-03-20",64,64,64,64,"Crane"),(65,"Ethan","10-08-21","05-01-20",65,65,65,65,"Walsh"),(66,"Brady","01-12-19","31-07-20",66,66,66,66,"Perkins"),(67,"September","10-04-20","31-07-21",67,67,67,67,"Valentine"),(68,"Hayden","28-06-21","02-01-21",68,68,68,68,"Brown"),(69,"Rajah","07-10-21","03-10-21",69,69,69,69,"Boyer"),(70,"Mollie","11-08-21","16-03-20",70,70,70,70,"Alvarado");
INSERT INTO titles (titleID,titleName,publishYear,entryDate,categoryFKey,publisherFKey,mediaFKey,contributorFKey,publisherName) VALUES (71,"Serina","23-12-19","11-12-20",71,71,71,71,"Whitfield"),(72,"Gavin","20-11-20","09-08-21",72,72,72,72,"Rivera"),(73,"Sonia","16-12-20","27-11-20",73,73,73,73,"Harmon"),(74,"Nell","10-05-20","17-01-21",74,74,74,74,"Hyde"),(75,"Martin","15-04-21","06-02-21",75,75,75,75,"Wagner"),(76,"Richard","13-10-20","25-09-20",76,76,76,76,"Kerr"),(77,"Brooke","19-08-20","20-08-20",77,77,77,77,"Mack"),(78,"Iliana","24-08-21","23-11-19",78,78,78,78,"Arnold"),(79,"Francis","13-11-20","23-11-19",79,79,79,79,"Beach"),(80,"Casey","18-09-21","02-12-20",80,80,80,80,"Kelley");
INSERT INTO titles (titleID,titleName,publishYear,entryDate,categoryFKey,publisherFKey,mediaFKey,contributorFKey,publisherName) VALUES (81,"Mallory","15-09-21","17-07-20",81,81,81,81,"Velez"),(82,"Erich","04-11-21","16-10-21",82,82,82,82,"Morales"),(83,"Caldwell","09-10-21","06-02-21",83,83,83,83,"Mathews"),(84,"Josephine","13-08-20","17-03-21",84,84,84,84,"Conway"),(85,"Chastity","23-07-21","24-03-21",85,85,85,85,"Garrett"),(86,"Flavia","19-08-20","24-10-21",86,86,86,86,"Booker"),(87,"Piper","13-04-20","11-10-20",87,87,87,87,"Tanner"),(88,"Ferdinand","11-03-21","29-11-19",88,88,88,88,"Hopkins"),(89,"Jacqueline","30-04-21","18-07-20",89,89,89,89,"Pickett"),(90,"Dexter","08-05-20","14-12-20",90,90,90,90,"Mcconnell");
INSERT INTO titles (titleID,titleName,publishYear,entryDate,categoryFKey,publisherFKey,mediaFKey,contributorFKey,publisherName) VALUES (91,"Marvin","25-12-20","08-04-20",91,91,91,91,"Rhodes"),(92,"Tasha","24-06-21","23-09-20",92,92,92,92,"Baird"),(93,"Pearl","19-12-20","02-02-20",93,93,93,93,"Avery"),(94,"Camille","12-01-21","15-06-21",94,94,94,94,"Walsh"),(95,"Amity","09-02-20","19-08-20",95,95,95,95,"Acevedo"),(96,"Cooper","08-01-20","10-12-20",96,96,96,96,"Hatfield"),(97,"Lane","01-05-21","04-09-20",97,97,97,97,"Mejia"),(98,"Leila","27-06-20","27-07-20",98,98,98,98,"Lambert"),(99,"Ariel","01-09-21","15-09-20",99,99,99,99,"Potter"),(100,"Nissim","19-03-21","26-01-21",100,100,100,100,"Mcbride");

/*Contributor 100 rows batch of 3*/
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (1,"Aristotle","Italy",1,1),(2,"Alexander","Curaçao",2,2),(3,"Eliana","Poland",3,3);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (4,"Regan","Sweden",4,4),(5,"Bianca","Uganda",5,5),(6,"Lillian","Cyprus",6,6);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (7,"Ezekiel","Samoa",7,7),(8,"Blaine","Turks and Caicos Islands",8,8),(9,"Malachi","Brunei",9,9);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (10,"Amelia","Gabon",10,10),(11,"Preston","Botswana",11,11),(12,"Bethany","Morocco",12,12);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (13,"Brooke","Ireland",13,13),(14,"Denise","Tokelau",14,14),(15,"Amber","Faroe Islands",15,15);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (16,"Jaquelyn","Montenegro",16,16),(17,"Kim","Jamaica",17,17),(18,"Tana","Afghanistan",18,18);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (19,"Alden","Afghanistan",19,19),(20,"Avram","Lebanon",20,20),(21,"Adrian","Cameroon",21,21);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (22,"Hall","China",22,22),(23,"Ross","Jersey",23,23),(24,"Patience","Congo, the Democratic Republic of the",24,24);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (25,"Liberty","Croatia",25,25),(26,"Yvette","Cocos (Keeling) Islands",26,26),(27,"Sydnee","Bahamas",27,27);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (28,"Abraham","New Zealand",28,28),(29,"Arsenio","Uganda",29,29),(30,"Joshua","Guam",30,30);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (31,"Leigh","Eritrea",31,31),(32,"James","Slovenia",32,32),(33,"Wayne","Niger",33,33);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (34,"Ivan","Chile",34,34),(35,"Beck","Cambodia",35,35),(36,"Uriah","Saudi Arabia",36,36);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (37,"Claire","Myanmar",37,37),(38,"Jack","Saint Helena, Ascension and Tristan da Cunha",38,38),(39,"Ginger","Finland",39,39);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (40,"Sierra","Guyana",40,40),(41,"Kadeem","Guatemala",41,41),(42,"Taylor","Japan",42,42);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (43,"Scarlet","Burundi",43,43),(44,"Nehru","Fiji",44,44),(45,"Wang","Zimbabwe",45,45);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (46,"Elvis","Brazil",46,46),(47,"Rahim","Barbados",47,47),(48,"Cherokee","Croatia",48,48);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (49,"Deirdre","Benin",49,49),(50,"Jin","Barbados",50,50),(51,"Nelle","Philippines",51,51);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (52,"Yuli","United States",52,52),(53,"Ishmael","Liberia",53,53),(54,"Paki","Viet Nam",54,54);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (55,"Hayley","Jamaica",55,55),(56,"Ulric","Viet Nam",56,56),(57,"Darius","Bolivia",57,57);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (58,"Madeline","Kyrgyzstan",58,58),(59,"Jesse","Armenia",59,59),(60,"Aiko","Zimbabwe",60,60);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (61,"Ann","Mauritius",61,61),(62,"Serena","Gibraltar",62,62),(63,"Hyacinth","Angola",63,63);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (64,"Scott","Panama",64,64),(65,"Sage","Sweden",65,65),(66,"Dara","Luxembourg",66,66);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (67,"Anne","Iran",67,67),(68,"Mona","Saint Vincent and The Grenadines",68,68),(69,"Darius","Cyprus",69,69);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (70,"TaShya","Cayman Islands",70,70),(71,"Dolan","Saudi Arabia",71,71),(72,"Walker","Cayman Islands",72,72);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (73,"Grant","Malta",73,73),(74,"Brian","Slovakia",74,74),(75,"Adrian","Central African Republic",75,75);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (76,"Lester","Angola",76,76),(77,"Kennedy","Jersey",77,77),(78,"Quentin","Croatia",78,78);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (79,"Cassidy","India",79,79),(80,"Yardley","Nicaragua",80,80),(81,"Adria","Poland",81,81);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (82,"Allegra","Haiti",82,82),(83,"Brent","Northern Mariana Islands",83,83),(84,"Hammett","Georgia",84,84);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (85,"Ira","Antigua and Barbuda",85,85),(86,"Xavier","Macedonia",86,86),(87,"Jerry","Sint Maarten",87,87);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (88,"Robert","Tajikistan",88,88),(89,"Hyacinth","Senegal",89,89),(90,"Sarah","Costa Rica",90,90);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (91,"Lee","Guam",91,91),(92,"Alfreda","Chile",92,92),(93,"Kylie","Liberia",93,93);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (94,"Orla","San Marino",94,94),(95,"Kasper","Malawi",95,95),(96,"Kennedy","Canada",96,96);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (97,"Steel","Faroe Islands",97,97),(98,"Amber","Nigeria",98,98),(99,"Nicole","Malta",99,99);
INSERT INTO contributor (contributorID,name,nationality,nonDomContributorFKey,domContributorFKey) VALUES (100,"Kaseem","Norfolk Island",100,100);

/*nonDomContributor 100 rows batch of 1 */
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (1,"Côte D'Ivoire (Ivory Coast)","non.enim.commodo@Curabiturmassa.net","1-773-899-4389",1);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (2,"Japan","est.ac.mattis@adipiscingligula.co.uk","1-889-539-8179",2);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (3,"Yemen","diam.Proin.dolor@sit.com","1-574-166-1567",3);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (4,"Mozambique","Curabitur.consequat@miDuis.net","1-962-332-4333",4);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (5,"Poland","molestie.arcu.Sed@hendrerita.co.uk","1-130-429-7532",5);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (6,"Kyrgyzstan","purus.Duis@id.com","1-286-928-4761",6);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (7,"Bhutan","elit.Nulla@fermentumvelmauris.ca","1-178-524-5625",7);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (8,"Latvia","ipsum.sodales@netus.ca","1-104-834-6633",8);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (9,"Wallis and Futuna","adipiscing.lacus@Naminterdumenim.edu","1-911-747-4664",9);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (10,"Cyprus","cursus@Curabiturutodio.ca","1-571-584-2630",10);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (11,"Fiji","eros.Nam.consequat@eget.ca","1-494-139-3086",11);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (12,"Eritrea","dictum.eleifend.nunc@Etiam.com","1-395-537-7374",12);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (13,"Qatar","erat.nonummy@Inornare.net","1-253-431-9251",13);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (14,"Angola","volutpat.ornare@risusNuncac.ca","1-835-565-3681",14);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (15,"Morocco","dolor.Nulla@quis.ca","1-974-520-5096",15);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (16,"Costa Rica","urna.et@bibendumsed.co.uk","1-637-483-2116",16);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (17,"Ethiopia","Sed.pharetra@Nuncmaurissapien.net","1-701-320-8170",17);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (18,"Barbados","vulputate@neque.com","1-267-823-6972",18);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (19,"Venezuela","dictum@ullamcorper.edu","1-152-900-1454",19);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (20,"Saint Barthélemy","convallis@Aliquamgravida.com","1-837-690-5350",20);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (21,"Cayman Islands","Cras@sitametfaucibus.com","1-861-549-3824",21);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (22,"Finland","elit.pellentesque.a@necmollisvitae.com","1-467-636-8625",22);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (23,"United Kingdom (Great Britain)","Mauris.quis.turpis@nonummyac.net","1-458-588-6364",23);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (24,"Nigeria","egestas@sem.com","1-366-448-2728",24);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (25,"Holy See (Vatican City State)","risus.Donec.nibh@accumsan.ca","1-967-657-5743",25);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (26,"Tanzania","ipsum.non@urnasuscipit.net","1-821-728-2720",26);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (27,"Zimbabwe","Praesent.eu@estmauris.co.uk","1-867-425-1088",27);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (28,"Mexico","gravida@dignissimmagna.edu","1-650-270-5098",28);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (29,"Martinique","adipiscing.lobortis@nuncestmollis.edu","1-382-305-1592",29);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (30,"Isle of Man","Sed.et@aliquet.edu","1-595-365-9905",30);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (31,"Tuvalu","libero.Proin.mi@Aenean.ca","1-301-151-6569",31);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (32,"Estonia","odio@sagittissemperNam.co.uk","1-669-267-3370",32);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (33,"Barbados","porttitor.vulputate.posuere@libero.com","1-802-843-6794",33);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (34,"Botswana","est.Mauris.eu@neque.net","1-902-817-4767",34);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (35,"Saint Kitts and Nevis","tempor@bibendumsed.com","1-940-514-9213",35);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (36,"Saint Barthélemy","sem.Pellentesque@utodiovel.org","1-374-653-6345",36);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (37,"Moldova","arcu.Sed.et@vel.com","1-670-887-3913",37);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (38,"Afghanistan","arcu@nisl.org","1-836-930-6329",38);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (39,"Greenland","adipiscing.elit.Curabitur@facilisis.edu","1-958-693-0391",39);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (40,"Western Sahara","enim.consequat.purus@at.co.uk","1-823-422-7969",40);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (41,"Palau","egestas.Fusce.aliquet@diamSed.edu","1-244-934-7442",41);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (42,"Kiribati","lacinia@Nullasemper.com","1-312-369-1734",42);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (43,"Papua New Guinea","dapibus.rutrum@consequatauctor.co.uk","1-267-904-7025",43);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (44,"South Sudan","Pellentesque@Donec.com","1-471-473-4244",44);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (45,"Laos","amet@miloremvehicula.ca","1-776-887-9677",45);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (46,"Norway","et@urnajusto.com","1-808-302-2209",46);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (47,"Nicaragua","nulla@lectuspedeet.com","1-727-317-3862",47);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (48,"Guinea-Bissau","In@nibh.com","1-164-597-7739",48);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (49,"Fiji","Nam.porttitor@ligulaAliquam.org","1-432-901-5426",49);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (50,"Croatia","Curabitur.sed.tortor@et.net","1-323-581-7067",50);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (51,"Portugal","Cras@ornarefacilisiseget.com","1-614-206-0384",51);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (52,"Congo, the Democratic Republic of the","ultricies.sem.magna@diameu.net","1-279-752-4029",52);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (53,"Cocos (Keeling) Islands","In@consectetuer.com","1-823-659-7259",53);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (54,"Mayotte","elementum@hendreritid.net","1-695-837-2817",54);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (55,"Russian Federation","tristique.pharetra@arcuAliquamultrices.org","1-826-785-7324",55);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (56,"Palestine, State of","tincidunt.orci@Nuncsedorci.edu","1-316-720-0651",56);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (57,"New Caledonia","tristique.ac@Fusce.com","1-290-934-0867",57);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (58,"Greece","vulputate@tempusscelerisque.com","1-194-907-2709",58);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (59,"Guinea","Duis@laciniaSed.org","1-290-962-0367",59);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (60,"Thailand","lobortis@esttemporbibendum.co.uk","1-832-110-8955",60);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (61,"Martinique","massa@Donectempor.org","1-723-689-9595",61);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (62,"Bahrain","nascetur.ridiculus@augueac.ca","1-148-176-6480",62);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (63,"Guadeloupe","Sed.diam.lorem@netusetmalesuada.ca","1-295-978-9715",63);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (64,"Suriname","lectus.a.sollicitudin@morbi.ca","1-694-282-3092",64);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (65,"Burkina Faso","amet.risus@Duiscursus.ca","1-685-764-2722",65);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (66,"Tokelau","adipiscing@per.com","1-527-172-5209",66);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (67,"Jersey","Vivamus@Phasellus.edu","1-423-356-9300",67);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (68,"Trinidad and Tobago","Phasellus.ornare.Fusce@Pellentesque.edu","1-448-158-4946",68);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (69,"Mauritius","eu.ultrices@elitsed.co.uk","1-995-982-1109",69);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (70,"Åland Islands","augue.Sed@molestie.net","1-118-478-1327",70);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (71,"Falkland Islands","nascetur.ridiculus.mus@ametluctus.edu","1-715-599-1764",71);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (72,"Mayotte","ultricies.adipiscing.enim@quis.com","1-318-886-3963",72);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (73,"Cayman Islands","Nunc.ullamcorper.velit@dolor.ca","1-524-635-0811",73);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (74,"Guernsey","lectus@egestaslacinia.edu","1-783-934-2368",74);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (75,"Puerto Rico","elit.pharetra@velit.com","1-318-124-0911",75);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (76,"Afghanistan","quam@nasceturridiculus.net","1-840-323-6892",76);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (77,"Antigua and Barbuda","varius.Nam.porttitor@vitaenibh.co.uk","1-666-912-2461",77);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (78,"Mayotte","vel@arcuacorci.edu","1-819-112-3913",78);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (79,"Jersey","euismod.et.commodo@sitametmassa.ca","1-587-945-2610",79);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (80,"Marshall Islands","tempus@sapiencursusin.org","1-697-537-0950",80);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (81,"Syria","enim.non@ligulatortor.com","1-742-108-1855",81);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (82,"Saint Lucia","nec.diam.Duis@convallis.org","1-862-986-8720",82);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (83,"Qatar","vitae.odio.sagittis@volutpatornarefacilisis.ca","1-405-658-0270",83);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (84,"Italy","malesuada.fringilla@ametmetusAliquam.ca","1-858-793-2026",84);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (85,"Wallis and Futuna","nisi.Mauris.nulla@iaculis.ca","1-708-879-7208",85);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (86,"Taiwan","velit@euaugue.edu","1-300-820-9545",86);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (87,"Senegal","Nam@acarcu.edu","1-677-961-9683",87);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (88,"Bermuda","Vivamus.nisi.Mauris@Inmipede.ca","1-864-149-4197",88);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (89,"Bangladesh","lorem@ultriciessem.net","1-938-291-3917",89);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (90,"Virgin Islands, British","Integer.vitae@ametdapibusid.ca","1-233-530-7863",90);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (91,"Cook Islands","Sed.pharetra@elitfermentumrisus.edu","1-785-154-3635",91);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (92,"Laos","arcu@Aliquamtincidunt.edu","1-167-711-2876",92);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (93,"Iran","ultrices.posuere.cubilia@accumsansedfacilisis.ca","1-895-318-4203",93);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (94,"Cook Islands","Suspendisse.non@natoquepenatibuset.edu","1-822-572-1036",94);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (95,"United Arab Emirates","vehicula.Pellentesque@nonsapienmolestie.org","1-886-575-9430",95);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (96,"Aruba","ridiculus.mus.Donec@nasceturridiculus.ca","1-973-966-0641",96);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (97,"Gambia","gravida@Suspendissealiquetmolestie.com","1-946-776-9888",97);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (98,"Cocos (Keeling) Islands","elit.sed.consequat@euaccumsan.ca","1-923-529-0174",98);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (99,"Bermuda","neque@venenatisvel.org","1-682-570-0072",99);
INSERT INTO nonDomContributor (nonDomContributorID,country,email,phone,contributorFKey) VALUES (100,"Sint Maarten","euismod.et.commodo@posuere.edu","1-773-498-7618",100);


/*domContributor 100 rows batch of 1*/
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (1,"891-3996 Aliquam Av.","MD","Annapolis","46520",1);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (2,"Ap #709-1960 Nisi. St.","IL","Aurora","92220",2);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (3,"877-6627 Ornare Av.","MS","Jackson","27797",3);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (4,"5462 A Rd.","CO","Aurora","49563",4);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (5,"Ap #656-4404 At Rd.","IL","Chicago","65637",5);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (6,"758-5219 Nunc. Rd.","MS","Southaven","99413",6);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (7,"Ap #956-4016 Vestibulum, Street","KS","Wichita","66029",7);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (8,"2427 Cras Street","CT","Bridgeport","97417",8);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (9,"8592 Lectus Avenue","CT","Bridgeport","93947",9);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (10,"Ap #528-4803 Torquent Road","WA","Tacoma","25227",10);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (11,"272-9041 Id, Road","NE","Lincoln","55171",11);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (12,"9680 Adipiscing Ave","AL","Montgomery","36733",12);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (13,"Ap #379-1604 Lectus Avenue","MS","Gulfport","69067",13);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (14,"Ap #937-2447 Mauris Street","CA","San Francisco","91110",14);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (15,"274-8657 Ante, Rd.","IA","Cedar Rapids","45606",15);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (16,"P.O. Box 400, 930 Donec Rd.","KY","Frankfort","36154",16);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (17,"P.O. Box 177, 6030 Nec, St.","CT","Hartford","91560",17);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (18,"Ap #747-2203 Suspendisse Avenue","AZ","Glendale","85705",18);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (19,"Ap #316-2368 Mauris Ave","MS","Gulfport","74226",19);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (20,"6491 Tortor. Rd.","AL","Montgomery","36094",20);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (21,"9771 Mauris Av.","MA","Boston","49198",21);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (22,"P.O. Box 919, 1537 Aliquam Rd.","AL","Tuscaloosa","35013",22);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (23,"264-8275 Et Street","AK","Juneau","99946",23);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (24,"P.O. Box 505, 1467 Lectus, St.","OH","Cleveland","12273",24);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (25,"P.O. Box 942, 583 Sit Avenue","CO","Aurora","46633",25);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (26,"187-6440 Eu, Av.","WI","Kenosha","50460",26);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (27,"P.O. Box 463, 9155 Lorem, Rd.","IL","Joliet","17366",27);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (28,"771-6517 Risus. Rd.","KS","Wichita","20869",28);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (29,"P.O. Box 187, 1987 Ac Av.","CT","New Haven","58044",29);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (30,"3597 Vivamus Av.","HI","Kapolei","39630",30);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (31,"5332 Magna. Rd.","ME","Lewiston","75108",31);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (32,"5123 Gravida Avenue","UT","Provo","64615",32);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (33,"Ap #952-726 Massa. Rd.","MT","Billings","58882",33);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (34,"2676 Sed, Ave","MD","Annapolis","42203",34);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (35,"Ap #503-4043 Et Rd.","NV","Las Vegas","84119",35);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (36,"Ap #257-9071 Dolor, Road","LA","Lafayette","25529",36);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (37,"536-9506 At Avenue","IL","Joliet","31429",37);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (38,"1378 Tellus. St.","OK","Norman","85333",38);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (39,"P.O. Box 602, 4204 Ac St.","NE","Omaha","50959",39);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (40,"858-883 Sem. Avenue","CO","Fort Collins","32505",40);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (41,"Ap #787-4456 Fusce Rd.","NE","Grand Island","67953",41);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (42,"687-2102 Mauris Street","NV","Paradise","64199",42);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (43,"P.O. Box 659, 1639 Scelerisque Street","ID","Boise","60795",43);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (44,"215-5198 Imperdiet Road","PA","Philadelphia","64717",44);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (45,"2129 Sit Rd.","NV","Henderson","36564",45);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (46,"319-7878 Auctor Avenue","KS","Kansas City","18140",46);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (47,"Ap #737-9904 Quisque St.","WA","Tacoma","16735",47);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (48,"Ap #524-732 Luctus, Street","LA","Shreveport","46213",48);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (49,"696-2542 Pharetra. Rd.","WA","Olympia","67848",49);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (50,"6215 Leo Rd.","OH","Toledo","57086",50);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (51,"594-8904 Nam Street","KS","Kansas City","33711",51);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (52,"P.O. Box 904, 997 In Road","VT","Montpelier","99349",52);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (53,"5950 Tincidunt, Rd.","MO","Springfield","38388",53);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (54,"Ap #147-2753 Nunc Avenue","IN","Gary","26253",54);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (55,"Ap #807-2531 Non Street","OH","Akron","16056",55);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (56,"831-3164 Vel Avenue","LA","New Orleans","51345",56);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (57,"395-8364 Metus. St.","KY","Lexington","30942",57);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (58,"Ap #496-5752 Dui. Street","NV","Paradise","93214",58);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (59,"P.O. Box 239, 8232 Nec, Avenue","WI","Green Bay","74454",59);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (60,"P.O. Box 948, 6898 Risus St.","WI","Madison","98974",60);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (61,"3308 Vel, Ave","MS","Gulfport","48600",61);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (62,"3329 Fringilla Rd.","MT","Helena","29547",62);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (63,"2922 Bibendum. Rd.","MN","Saint Paul","33498",63);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (64,"P.O. Box 923, 1946 Sociis Ave","MO","Kansas City","34489",64);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (65,"7225 Lacus. Av.","IL","Joliet","79704",65);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (66,"6936 Sed Avenue","AK","Fairbanks","99590",66);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (67,"P.O. Box 344, 5554 Odio. Ave","VT","Rutland","47730",67);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (68,"3323 Id, Street","IA","Iowa City","10588",68);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (69,"7154 Et Ave","KY","Owensboro","95128",69);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (70,"913-3675 Vitae Rd.","MA","Worcester","92311",70);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (71,"P.O. Box 160, 5297 Magna. Street","WY","Rock Springs","39524",71);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (72,"Ap #641-1175 Vel, Rd.","AZ","Mesa","86661",72);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (73,"P.O. Box 713, 1759 Et Road","ID","Idaho Falls","85211",73);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (74,"P.O. Box 626, 5437 Dignissim St.","NE","Bellevue","37153",74);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (75,"681-4514 Ac Avenue","OK","Oklahoma City","13595",75);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (76,"Ap #488-7355 In, Avenue","WY","Laramie","54791",76);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (77,"436-2178 Rhoncus. Av.","OK","Oklahoma City","22553",77);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (78,"Ap #755-8297 Sodales Road","MA","Springfield","48725",78);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (79,"P.O. Box 807, 8322 Elit, St.","TN","Chattanooga","66016",79);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (80,"1670 Varius Street","IN","South Bend","77458",80);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (81,"Ap #497-2530 Est, Rd.","AL","Tuscaloosa","36204",81);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (82,"272-2543 Sed Ave","HI","Kaneohe","79210",82);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (83,"367-6588 Eros Ave","KY","Frankfort","52065",83);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (84,"2263 Felis. Av.","ID","Idaho Falls","21531",84);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (85,"P.O. Box 853, 2943 Aliquam Road","CT","Stamford","93094",85);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (86,"891-1455 In Avenue","MT","Billings","76065",86);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (87,"783-8765 Enim, Rd.","ID","Idaho Falls","79029",87);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (88,"4768 Sem, St.","FL","St. Petersburg","13610",88);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (89,"Ap #223-530 Metus St.","HI","Honolulu","62445",89);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (90,"4158 Dolor. Ave","NV","North Las Vegas","98617",90);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (91,"741-3407 Montes, St.","MI","Warren","36638",91);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (92,"335-3256 Fermentum Av.","WA","Spokane","35559",92);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (93,"Ap #827-2559 Eros. Rd.","AK","Juneau","99728",93);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (94,"Ap #507-7196 Quam Ave","MI","Warren","41712",94);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (95,"698-8922 Parturient St.","CO","Lakewood","37854",95);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (96,"264-8188 Pede. Road","MD","Columbia","74906",96);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (97,"902-527 Velit. Ave","LA","Shreveport","94061",97);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (98,"Ap #860-359 Eu Rd.","GA","Augusta","42889",98);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (99,"5567 Id Av.","MN","Minneapolis","39810",99);
INSERT INTO domContributor (domContributorID,street,state,city,zipcode,contributorFKey) VALUES (100,"4224 Dis St.","MN","Saint Paul","53229",100);

/*categories 100 rows batch of 10 */
INSERT INTO categories (categoryID,categoryName) VALUES (1,"Price"),(2,"Lee"),(3,"Elijah"),(4,"Lyle"),(5,"Reagan"),(6,"Armand"),(7,"Cullen"),(8,"Rudyard"),(9,"Charissa"),(10,"Griffin");
INSERT INTO categories (categoryID,categoryName) VALUES (11,"Nora"),(12,"Merrill"),(13,"Kevyn"),(14,"Irene"),(15,"Bernard"),(16,"Brady"),(17,"Derek"),(18,"Octavia"),(19,"Wanda"),(20,"Leonard");
INSERT INTO categories (categoryID,categoryName) VALUES (21,"Stella"),(22,"Basil"),(23,"Juliet"),(24,"Imani"),(25,"Joel"),(26,"Baker"),(27,"Audra"),(28,"Kelsie"),(29,"Ali"),(30,"Mechelle");
INSERT INTO categories (categoryID,categoryName) VALUES (31,"Keefe"),(32,"Karen"),(33,"Brenden"),(34,"Nola"),(35,"Salvador"),(36,"Alisa"),(37,"Kyra"),(38,"Connor"),(39,"Chastity"),(40,"Amos");
INSERT INTO categories (categoryID,categoryName) VALUES (41,"Joan"),(42,"Hamilton"),(43,"Macy"),(44,"Kevyn"),(45,"Raven"),(46,"Paul"),(47,"Ignacia"),(48,"Nola"),(49,"Kieran"),(50,"Colin");
INSERT INTO categories (categoryID,categoryName) VALUES (51,"Mary"),(52,"Leonard"),(53,"Larissa"),(54,"Melinda"),(55,"Jemima"),(56,"Marsden"),(57,"Paki"),(58,"Logan"),(59,"Cody"),(60,"Macon");
INSERT INTO categories (categoryID,categoryName) VALUES (61,"Meredith"),(62,"Aubrey"),(63,"Karyn"),(64,"Kerry"),(65,"Carol"),(66,"Leslie"),(67,"Amelia"),(68,"Cole"),(69,"Leo"),(70,"Reagan");
INSERT INTO categories (categoryID,categoryName) VALUES (71,"Molly"),(72,"Derek"),(73,"Jillian"),(74,"April"),(75,"Warren"),(76,"Chanda"),(77,"Henry"),(78,"Lewis"),(79,"Kieran"),(80,"Leonard");
INSERT INTO categories (categoryID,categoryName) VALUES (81,"Macey"),(82,"Hollee"),(83,"Hector"),(84,"Ima"),(85,"Audra"),(86,"Timothy"),(87,"Rebekah"),(88,"Daquan"),(89,"Ethan"),(90,"Quintessa");
INSERT INTO categories (categoryID,categoryName) VALUES (91,"Eric"),(92,"Kelly"),(93,"Imani"),(94,"Calvin"),(95,"Sigourney"),(96,"Burton"),(97,"Elaine"),(98,"Daquan"),(99,"Kato"),(100,"Joel");

/*media 100 rows batch of */
INSERT INTO media (mediaID,mediaName) VALUES (1,"Samson"),(2,"Randall"),(3,"Kylee"),(4,"Xenos"),(5,"Blair"),(6,"Teagan"),(7,"Blaze"),(8,"Blossom"),(9,"Brian"),(10,"Rachel");
INSERT INTO media (mediaID,mediaName) VALUES (11,"Piper"),(12,"Melyssa"),(13,"Brian"),(14,"Allen"),(15,"Brenden"),(16,"Phoebe"),(17,"Anjolie"),(18,"Joel"),(19,"Neve"),(20,"Tanner");
INSERT INTO media (mediaID,mediaName) VALUES (21,"Karyn"),(22,"Rhea"),(23,"Caleb"),(24,"Iliana"),(25,"Autumn"),(26,"Raphael"),(27,"Kathleen"),(28,"Tatum"),(29,"Noelle"),(30,"Paul");
INSERT INTO media (mediaID,mediaName) VALUES (31,"Marah"),(32,"Miranda"),(33,"Hall"),(34,"Tucker"),(35,"Amelia"),(36,"Hop"),(37,"Stephen"),(38,"Kelly"),(39,"Chava"),(40,"Leroy");
INSERT INTO media (mediaID,mediaName) VALUES (41,"Tasha"),(42,"Jane"),(43,"Austin"),(44,"Erasmus"),(45,"Jonah"),(46,"Unity"),(47,"Maisie"),(48,"Baker"),(49,"Unity"),(50,"Hayden");
INSERT INTO media (mediaID,mediaName) VALUES (51,"Mira"),(52,"Azalia"),(53,"Quon"),(54,"Perry"),(55,"Ishmael"),(56,"Ashely"),(57,"Jarrod"),(58,"Germaine"),(59,"Dean"),(60,"Skyler");
INSERT INTO media (mediaID,mediaName) VALUES (61,"Amena"),(62,"Sigourney"),(63,"Louis"),(64,"Samson"),(65,"Jamal"),(66,"Michelle"),(67,"Ebony"),(68,"Kibo"),(69,"Omar"),(70,"Veda");
INSERT INTO media (mediaID,mediaName) VALUES (71,"Dale"),(72,"Orson"),(73,"Darrel"),(74,"Hilel"),(75,"Charity"),(76,"Colin"),(77,"Joy"),(78,"Perry"),(79,"Mark"),(80,"Nevada");
INSERT INTO media (mediaID,mediaName) VALUES (81,"Richard"),(82,"Wylie"),(83,"Raya"),(84,"Xyla"),(85,"Ira"),(86,"Clarke"),(87,"Elizabeth"),(88,"Mufutau"),(89,"Britanney"),(90,"Barry");
INSERT INTO media (mediaID,mediaName) VALUES (91,"Xerxes"),(92,"Ulysses"),(93,"John"),(94,"Paula"),(95,"Walter"),(96,"Vaughan"),(97,"Shaeleigh"),(98,"Edan"),(99,"Otto"),(100,"Arden");



/*ALTER TABLE contributor
	ADD CONSTRAINT nonDom FOREIGN KEY (nonDomContributorFKey) REFERENCES nonDomContributor(nonDomContributorID);
ALTER TABLE contributor 
	ADD CONSTRAINT dom FOREIGN KEY (domContributorFKey) REFERENCES domContributor(domContributorID);*/

DELETE FROM categories WHERE categoryName = 'Eric';

UPDATE media
SET mediaName = 'Ronin'
WHERE mediaID = 21;

CREATE PROCEDURE SelectAllMedia
AS
SELECT * FROM media
GO;


