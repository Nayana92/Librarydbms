

// create tables 

create table Branch(
  branchId 		   integer NOT NULL,
  name           char(20),
  address  		   char(50),
  phoneNumber 	 char(10),
  Primary key    (branchId)
);

create table employee(
  employeeId 		  integer NOT NULL,
  Name 	  		    char(20),
  Address     		char(50),
  PhoneNumber     char(10),
  SSN 			      char(9),
  salary          float,
  Primary key     (employeeId)
);

create table employs(
  employId			              integer NOT NULL,
  branchId                  	integer NOT NULL,
  since                      	date,
  Primary Key           		  (branchId),
  Foreign key(employeeId)     reference employee,
  Foreign key(branchId)       reference branch
);
         
create table physicalMedia(
  mediaId 		  integer NOT NULL
  Primary key   (mediaId)
);

create table bookMedia(
  mediaId			          integer NOT NULL,
  ISBN                  integer NOT NULL,
  title                 char(50),
  subject               char(50),
  author                char(20),
  publisher             char(50),
  year                  date,
  language              char(10),
  Format                char(10),
  Primary Key           (mediaId),
  Foreign key(mediaId)  reference physicalMedia,
);

create table videoMedia(
  mediaId			          integer NOT NULL,
  title                 char(50),
  genre                 char(50),
  director              char(20),
  releaseDate           date,
  rating                char(20),
  Primary Key           (mediaId),
  Foreign key(mediaId)  reference physicalMedia,
);

create table check_out(
  mediaId				         integer NOT NULL,
  memberId               integer NOT NULL,
  issuedBy				       char(20),
  borrowFrom             date,
  borrowTo               date,
  Primary Key            (mediaId, memberId),
  Foreign key(mediaId)   reference physicalMedia,
  Foreign key(memberId)  reference member
);

create table reserve(
  mediaId				         integer NOT NULL,
  memberId               integer NOT NULL,
  queue					         integer
  Primary Key            (mediaId, memberId),
  Foreign key(mediaId)   reference physicalMedia,
  Foreign key(memberId)  reference member
);

create table member(
  memberId			         integer NOT NULL,
  branchId			         integer NOT NULL,
  Name				           char(20),
  Address			           char(50),
  phoneNumber            char(10),
  finesDue               date,
  Primary Key            (memberId),
  Primary Key			       (branchId),
  Foreign Key(branchId)  reference branch 		
);


create table mediaLocation(
  mediaId				        integer NOT NULL,
  branchId				      integer NOT NULL,
  ISBN					        char(20),
  Floor					        integer,
  Shelf					        char(10)
  Primary key				    (mediaId, branchId)
  Foreign key(mediaId)  reference physicalMedia,
  Foreign key(branchId) reference branch
);		

// create indexes

create index indexRating on 
  videoMedia
  with structure = BTREE,
  key = (rating, mediaId);

create index indexYear on 
  bookMedia
  with structure = BTREE,
  key = (year, mediaId);


