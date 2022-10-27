create database if not exists f22_databases_contacts;
use f22_databases_contacts;

DROP TABLE IF EXISTS addresses;
DROP TABLE IF EXISTS emails;
DROP TABLE IF EXISTS phones;
DROP TABLE IF EXISTS students;




/*
 Create table statement.
 */
create table if not exists students
(
    guid  varchar(128) primary key,
    last_name   varchar(128) not null,
    first_name  varchar(128) not null,
    middle_name varchar(128) null,
    school_code varchar(128)  not null
);


create table if not exists addresses
(
    auto_id      int auto_increment primary key,
    guid         varchar(128) not null,
    street_No    varchar(64) not null,
    street_name  varchar(256) not null,
    city         varchar(128) not null,
    state        varchar(256) not null,
    county_code  varchar(128),
    postal_code  int not null,
    FOREIGN KEY (guid) REFERENCES students(guid) ON DELETE CASCADE
);



create table if not exists emails
(
    auto_id int auto_increment primary key,
    email_address varchar(256) not null,
    guid varchar(128) not null,
    FOREIGN KEY (guid) REFERENCES students(guid) ON DELETE CASCADE,
    constraint columbia_student_email_uindex_second
        unique (email_address)
);



create table if not exists phones
(
    auto_id int auto_increment primary key,
    guid  varchar(128) not null,
    phone_num varchar(256) not null,
    area_code varchar(64),
    type varchar(128),
    FOREIGN KEY (guid) REFERENCES students(guid) ON DELETE CASCADE,
    constraint columbia_student_phone_uindex
        unique (phone_num)
);



/*
 Example insert statement students
 */
 insert into students (guid, last_name, first_name, middle_name, school_code)
    values ("dff9","Ferguson", "Donald", "Francis", "SEAS");

 insert into students (guid, last_name, first_name, middle_name, school_code)
    values ("mx1234","Xu", "Mengchen", "None", "DSI");

 insert into students (guid, last_name, first_name, middle_name, school_code)
    values ("ch5656","Hu", "Cai", "Lee", "GSAS");

 insert into students (guid, last_name, first_name, middle_name, school_code)
    values ("ls6789","Smith", "Lucy", "Lily", "GSAS");

 insert into students (guid, last_name, first_name, middle_name, school_code)
    values ("js2323","Shui", "Jack", "None", "GSAS");


/*
 Example insert statement address
 */
 insert into addresses (guid, street_No, street_name, city, state, county_code, postal_code)
    values ("dff9","123", "Columbus Avenue", "New York", "New York", "NY", "10025");

 insert into addresses (guid, street_No, street_name, city, state, county_code, postal_code)
    values ("mx1234","456", "Amsterdam", "Los Angelas", "California", "CA", "92617");

 insert into addresses (guid, street_No, street_name, city, state, county_code, postal_code)
    values ("ch5656","789", "5th Avenue", "Irvine", "California", "CA", "92880");

 insert into addresses (guid, street_No, street_name, city, state, county_code, postal_code)
    values ("ls6789","987", "Westend", "Boston", "Massachesattes", "MA", "23005");

 insert into addresses (guid, street_No, street_name, city, state, county_code, postal_code)
    values ("js2323","654", "Broadway", "Chicago", "Illinoi","IL","56200");



/*
 Example insert statement Emails
 */
 insert into emails (email_address, guid)
    values ("dff9@columbia.edu","dff9");

 insert into emails (email_address, guid)
    values ("mx1234@columbia.edu","mx1234");

 insert into emails (email_address, guid)
    values ("ch5656@uci.edu","ch5656");

 insert into emails (email_address, guid)
    values ("ls6789@ucla.edu","ls6789");

 insert into emails (email_address, guid)
    values ("js2323@ucsd.edu","js2323");




/*
 Example insert statement Phones
 */
 insert into phones (guid, phone_num, area_code, type)
    values ("dff9","567891234", "567", "mobile");

 insert into phones (guid, phone_num, area_code, type)
    values ("mx1234","456789123", "456", "home");

 insert into phones (guid, phone_num, area_code, type)
    values ("ch5656","345678912", "345", "office");

 insert into phones (guid, phone_num, area_code, type)
    values ("ls6789","234567891", "234", "mobile");

 insert into phones (guid, phone_num, area_code, type)
    values ("js2323","123456789", "123", "home");
