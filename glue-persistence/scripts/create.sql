CREATE TABLE Category (id VARCHAR(255) NOT NULL, name VARCHAR(255), PRIMARY KEY (id)) ENGINE = innodb;
CREATE TABLE Comment (id VARCHAR(255) NOT NULL, created DATETIME, text VARCHAR(2000) NOT NULL, username VARCHAR(255) NOT NULL, PARENT_ID VARCHAR(255), PRIMARY KEY (id)) ENGINE = innodb;
CREATE TABLE Event (id VARCHAR(255) NOT NULL, allDay BIT, category VARCHAR(20), created DATETIME, description TEXT, free BIT, price VARCHAR(255), reference BIT, source VARCHAR(255), startTime DATETIME NOT NULL, stopTime DATETIME, timeZone VARCHAR(255), title VARCHAR(255) NOT NULL, url VARCHAR(2048), withdrawn BIT, withdrawnNote VARCHAR(255), PARENT_ID VARCHAR(255), VENUE_ID VARCHAR(255), PRIMARY KEY (id)) ENGINE = innodb;
CREATE TABLE Event_Category (EVENT_ID VARCHAR(255), CATEGORIES_ID VARCHAR(255)) ENGINE = innodb;
CREATE TABLE Event_Comment (EVENT_ID VARCHAR(255), COMMENTS_ID VARCHAR(255)) ENGINE = innodb;
CREATE TABLE Event_Event (EVENT_ID VARCHAR(255), CHILDREN_ID VARCHAR(255)) ENGINE = innodb;
CREATE TABLE Event_Image (EVENT_ID VARCHAR(255), IMAGES_ID VARCHAR(255)) ENGINE = innodb;
CREATE TABLE Event_Link (EVENT_ID VARCHAR(255), LINKS_ID VARCHAR(255)) ENGINE = innodb;
CREATE TABLE Event_Occurrence (EVENT_ID VARCHAR(255), OCCURRENCES_ID VARCHAR(255)) ENGINE = innodb;
CREATE TABLE Event_Property (EVENT_ID VARCHAR(255), PROPERTIES_ID INTEGER) ENGINE = innodb;
CREATE TABLE Event_Tag (EVENT_ID VARCHAR(255), TAGS_ID VARCHAR(255)) ENGINE = innodb;
CREATE TABLE Glue_User (id VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL, firstName VARCHAR(255), hometown VARCHAR(255), interests VARCHAR(255), lastName VARCHAR(255), password VARCHAR(255) NOT NULL, registrationDate DATETIME, username VARCHAR(255), PRIMARY KEY (id), UNIQUE U_GLU_USR_EMAIL (email)) ENGINE = innodb;
CREATE TABLE Glue_User_Event (GOING_ID VARCHAR(255)) ENGINE = innodb;
CREATE TABLE Glue_User_Link (USER_ID VARCHAR(255), LINKS_ID VARCHAR(255)) ENGINE = innodb;
CREATE TABLE Image (id VARCHAR(255) NOT NULL, caption VARCHAR(255), creator VARCHAR(255), height INTEGER, source VARCHAR(2048), sticky BIT, url VARCHAR(2048), width INTEGER, BLOCK_ID VARCHAR(255), LARGE_ID VARCHAR(255), MEDIUM_ID VARCHAR(255), ORIGINAL_ID VARCHAR(255), SMALL_ID VARCHAR(255), THUMB_ID VARCHAR(255), PRIMARY KEY (id)) ENGINE = innodb;
CREATE TABLE ImageItem (id VARCHAR(255) NOT NULL, height INTEGER, url VARCHAR(255), width INTEGER, PRIMARY KEY (id)) ENGINE = innodb;
CREATE TABLE Link (id VARCHAR(255) NOT NULL, created DATETIME, description VARCHAR(255), type VARCHAR(20), url VARCHAR(2048) NOT NULL, username VARCHAR(255), PRIMARY KEY (id)) ENGINE = innodb;
CREATE TABLE Occurrence (id VARCHAR(255) NOT NULL, startTime DATETIME NOT NULL, stopTime DATETIME, VENUE_ID VARCHAR(255), PRIMARY KEY (id)) ENGINE = innodb;
CREATE TABLE OPENJPA_SEQUENCE_TABLE (ID TINYINT NOT NULL, SEQUENCE_VALUE BIGINT, PRIMARY KEY (ID)) ENGINE = innodb;
CREATE TABLE Performer (id VARCHAR(255) NOT NULL, created DATETIME, creator VARCHAR(255), longBio VARCHAR(2000), name VARCHAR(255) NOT NULL, shortBio VARCHAR(255), withdrawn BIT, withdrawnNote VARCHAR(255), PRIMARY KEY (id)) ENGINE = innodb;
CREATE TABLE Performer_Comment (PERFORMER_ID VARCHAR(255), COMMENTS_ID VARCHAR(255)) ENGINE = innodb;
CREATE TABLE Performer_Event (PERFORMERS_ID VARCHAR(255), EVENTS_ID VARCHAR(255)) ENGINE = innodb;
CREATE TABLE Performer_Image (PERFORMER_ID VARCHAR(255), IMAGES_ID VARCHAR(255)) ENGINE = innodb;
CREATE TABLE Performer_Link (PERFORMER_ID VARCHAR(255), LINKS_ID VARCHAR(255)) ENGINE = innodb;
CREATE TABLE Performer_Property (PERFORMER_ID VARCHAR(255), PROPERTIES_ID INTEGER) ENGINE = innodb;
CREATE TABLE Performer_Tag (PERFORMER_ID VARCHAR(255), TAGS_ID VARCHAR(255)) ENGINE = innodb;
CREATE TABLE Property (id INTEGER NOT NULL, name VARCHAR(255), value VARCHAR(255), PRIMARY KEY (id)) ENGINE = innodb;
CREATE TABLE Tag (id VARCHAR(255) NOT NULL, owner VARCHAR(255), title VARCHAR(255) NOT NULL, PRIMARY KEY (id), UNIQUE U_TAG_TITLE (title)) ENGINE = innodb;
CREATE TABLE Venue (id VARCHAR(255) NOT NULL, address VARCHAR(255), city VARCHAR(255), country VARCHAR(255), countryThreeLetterAbbreviation VARCHAR(255), countryTwoLetterAbbreviation VARCHAR(255), created DATETIME, description TEXT, geocodeType VARCHAR(255), latitude DOUBLE, longitude DOUBLE, name VARCHAR(255) NOT NULL, postalCode VARCHAR(255), reference BIT, region VARCHAR(255), regionAbbreviation VARCHAR(255), source VARCHAR(255), timeZone VARCHAR(255), type VARCHAR(255), url VARCHAR(2048), PARENT_ID VARCHAR(255), PRIMARY KEY (id)) ENGINE = innodb;
CREATE TABLE Venue_Comment (VENUE_ID VARCHAR(255), COMMENTS_ID VARCHAR(255)) ENGINE = innodb;
CREATE TABLE Venue_Image (VENUE_ID VARCHAR(255), IMAGES_ID VARCHAR(255)) ENGINE = innodb;
CREATE TABLE Venue_Link (VENUE_ID VARCHAR(255), LINKS_ID VARCHAR(255)) ENGINE = innodb;
CREATE TABLE Venue_Property (VENUE_ID VARCHAR(255), PROPERTIES_ID INTEGER) ENGINE = innodb;
CREATE TABLE Venue_Tag (VENUE_ID VARCHAR(255), TAGS_ID VARCHAR(255)) ENGINE = innodb;
CREATE TABLE Venue_Venue (VENUE_ID VARCHAR(255), CHILDREN_ID VARCHAR(255)) ENGINE = innodb;
ALTER TABLE Comment ADD FOREIGN KEY (PARENT_ID) REFERENCES Comment (id);
ALTER TABLE Event ADD FOREIGN KEY (PARENT_ID) REFERENCES Event (id);
ALTER TABLE Event ADD FOREIGN KEY (VENUE_ID) REFERENCES Venue (id);
ALTER TABLE Event_Category ADD FOREIGN KEY (EVENT_ID) REFERENCES Event (id);
ALTER TABLE Event_Category ADD FOREIGN KEY (CATEGORIES_ID) REFERENCES Category (id);
ALTER TABLE Event_Comment ADD FOREIGN KEY (EVENT_ID) REFERENCES Event (id);
ALTER TABLE Event_Comment ADD FOREIGN KEY (COMMENTS_ID) REFERENCES Comment (id);
ALTER TABLE Event_Event ADD FOREIGN KEY (EVENT_ID) REFERENCES Event (id);
ALTER TABLE Event_Event ADD FOREIGN KEY (CHILDREN_ID) REFERENCES Event (id);
ALTER TABLE Event_Image ADD FOREIGN KEY (EVENT_ID) REFERENCES Event (id);
ALTER TABLE Event_Image ADD FOREIGN KEY (IMAGES_ID) REFERENCES Image (id);
ALTER TABLE Event_Link ADD FOREIGN KEY (EVENT_ID) REFERENCES Event (id);
ALTER TABLE Event_Link ADD FOREIGN KEY (LINKS_ID) REFERENCES Link (id);
ALTER TABLE Event_Occurrence ADD FOREIGN KEY (EVENT_ID) REFERENCES Event (id);
ALTER TABLE Event_Occurrence ADD FOREIGN KEY (OCCURRENCES_ID) REFERENCES Occurrence (id);
ALTER TABLE Event_Property ADD FOREIGN KEY (EVENT_ID) REFERENCES Event (id);
ALTER TABLE Event_Property ADD FOREIGN KEY (PROPERTIES_ID) REFERENCES Property (id);
ALTER TABLE Event_Tag ADD FOREIGN KEY (EVENT_ID) REFERENCES Event (id);
ALTER TABLE Event_Tag ADD FOREIGN KEY (TAGS_ID) REFERENCES Tag (id);
ALTER TABLE Glue_User_Event ADD FOREIGN KEY (GOING_ID) REFERENCES Glue_User (id);
ALTER TABLE Glue_User_Event ADD FOREIGN KEY (GOING_ID) REFERENCES Event (id);
ALTER TABLE Glue_User_Link ADD FOREIGN KEY (USER_ID) REFERENCES Glue_User (id);
ALTER TABLE Glue_User_Link ADD FOREIGN KEY (LINKS_ID) REFERENCES Link (id);
ALTER TABLE Image ADD FOREIGN KEY (BLOCK_ID) REFERENCES ImageItem (id);
ALTER TABLE Image ADD FOREIGN KEY (LARGE_ID) REFERENCES ImageItem (id);
ALTER TABLE Image ADD FOREIGN KEY (MEDIUM_ID) REFERENCES ImageItem (id);
ALTER TABLE Image ADD FOREIGN KEY (ORIGINAL_ID) REFERENCES ImageItem (id);
ALTER TABLE Image ADD FOREIGN KEY (SMALL_ID) REFERENCES ImageItem (id);
ALTER TABLE Image ADD FOREIGN KEY (THUMB_ID) REFERENCES ImageItem (id);
ALTER TABLE Occurrence ADD FOREIGN KEY (VENUE_ID) REFERENCES Venue (id);
ALTER TABLE Performer_Comment ADD FOREIGN KEY (PERFORMER_ID) REFERENCES Performer (id);
ALTER TABLE Performer_Comment ADD FOREIGN KEY (COMMENTS_ID) REFERENCES Comment (id);
ALTER TABLE Performer_Event ADD FOREIGN KEY (PERFORMERS_ID) REFERENCES Performer (id);
ALTER TABLE Performer_Event ADD FOREIGN KEY (EVENTS_ID) REFERENCES Event (id);
ALTER TABLE Performer_Image ADD FOREIGN KEY (PERFORMER_ID) REFERENCES Performer (id);
ALTER TABLE Performer_Image ADD FOREIGN KEY (IMAGES_ID) REFERENCES Image (id);
ALTER TABLE Performer_Link ADD FOREIGN KEY (PERFORMER_ID) REFERENCES Performer (id);
ALTER TABLE Performer_Link ADD FOREIGN KEY (LINKS_ID) REFERENCES Link (id);
ALTER TABLE Performer_Property ADD FOREIGN KEY (PERFORMER_ID) REFERENCES Performer (id);
ALTER TABLE Performer_Property ADD FOREIGN KEY (PROPERTIES_ID) REFERENCES Property (id);
ALTER TABLE Performer_Tag ADD FOREIGN KEY (PERFORMER_ID) REFERENCES Performer (id);
ALTER TABLE Performer_Tag ADD FOREIGN KEY (TAGS_ID) REFERENCES Tag (id);
ALTER TABLE Venue ADD FOREIGN KEY (PARENT_ID) REFERENCES Venue (id);
ALTER TABLE Venue_Comment ADD FOREIGN KEY (VENUE_ID) REFERENCES Venue (id);
ALTER TABLE Venue_Comment ADD FOREIGN KEY (COMMENTS_ID) REFERENCES Comment (id);
ALTER TABLE Venue_Image ADD FOREIGN KEY (VENUE_ID) REFERENCES Venue (id);
ALTER TABLE Venue_Image ADD FOREIGN KEY (IMAGES_ID) REFERENCES Image (id);
ALTER TABLE Venue_Link ADD FOREIGN KEY (VENUE_ID) REFERENCES Venue (id);
ALTER TABLE Venue_Link ADD FOREIGN KEY (LINKS_ID) REFERENCES Link (id);
ALTER TABLE Venue_Property ADD FOREIGN KEY (VENUE_ID) REFERENCES Venue (id);
ALTER TABLE Venue_Property ADD FOREIGN KEY (PROPERTIES_ID) REFERENCES Property (id);
ALTER TABLE Venue_Tag ADD FOREIGN KEY (VENUE_ID) REFERENCES Venue (id);
ALTER TABLE Venue_Tag ADD FOREIGN KEY (TAGS_ID) REFERENCES Tag (id);
ALTER TABLE Venue_Venue ADD FOREIGN KEY (VENUE_ID) REFERENCES Venue (id);
ALTER TABLE Venue_Venue ADD FOREIGN KEY (CHILDREN_ID) REFERENCES Venue (id);
