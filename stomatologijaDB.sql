CREATE TABLE Application_user
(
    user_id  SERIAL      NOT NULL PRIMARY KEY,
    login    varchar(20) NOT NULL UNIQUE,
    password varchar(20) NOT NULL
);

CREATE TABLE Patient
(
    patient_id    SERIAL      NOT NULL PRIMARY KEY,
    firstname     varchar(30) NOT NULL,
    midname       varchar(30) NOT NULL,
    lastname      varchar(30) NOT NULL,
    date_of_birth date,
    passport_data varchar(10) UNIQUE,
    email         varchar(40) NOT NULL,
    phone_number  varchar(15),
    user_id       INT      NOT NULL,
    CONSTRAINT fk_user_id FOREIGN KEY (user_id) REFERENCES  Application_user(user_id)
);

CREATE TABLE Doctor
(
    doctor_id      SERIAL      NOT NULL PRIMARY KEY,
    firstname      varchar(30) NOT NULL,
    midname        varchar(30) NOT NULL,
    lastname       varchar(30) NOT NULL,
    date_of_birth  date,
    passport_data  varchar(10) UNIQUE,
    email          varchar(40) NOT NULL,
    phone_number   varchar(15),
    specialization varchar(40),
    user_id        int      NOT NULL,
    CONSTRAINT  fk_user_id FOREIGN KEY (user_id) REFERENCES  Application_user(user_id)
);

CREATE TABLE Cabinet
(
    cabinet_number varchar(10) NOT NULL PRIMARY KEY UNIQUE,
    cabinet_name   varchar(30) UNIQUE
);

CREATE TABLE Visit
(
    visit_id       SERIAL      NOT NULL PRIMARY KEY,
    date_of_visit  date        NOT NULL,
    patient_id     SERIAL      NOT NULL,
    CONSTRAINT fk_patient_id FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    cabinet_number varchar(10) NOT NULL,
    CONSTRAINT fk_cabinet_number FOREIGN KEY (cabinet_number) REFERENCES Cabinet(cabinet_number)
);

CREATE TABLE Service
(
    service_id       SERIAL      NOT NULL PRIMARY KEY,
    service_name     varchar(20) NOT NULL,
    service_price    int         NOT NULL,
    writeoff_list_id int      NOT NULL,
    CONSTRAINT fk_writeoff_list_id FOREIGN KEY (writeoff_list_id) REFERENCES  Writeoff_list(writeoff_list_id)
);

CREATE TABLE Writeoff_list
(
    writeoff_list_id SERIAL NOT NULL PRIMARY KEY,
    writeoff_amount  int,
    object_id        int NOT NULL,
    CONSTRAINT fk_object_id FOREIGN KEY (object_id) REFERENCES Medical_object(object_id)
);

CREATE TABLE Medical_object
(
    object_id              SERIAL NOT NULL PRIMARY KEY,
    date_of_object_release date   NOT NULL,
    shelf_life             date   NOT NULL,
    price                  int    NOT NULL,
    ammount                int,
    series                 varchar(40),
    object_name_id         INT NOT NULL,
    CONSTRAINT fk_object_id FOREIGN KEY (object_name_id) REFERENCES object_name(object_name_id),
    supply_id              INT NOT NULL,
    CONSTRAINT fk_supply_id FOREIGN KEY (supply_id) REFERENCES supply(supply_id)
);

CREATE TABLE object_name
(
    object_name_id SERIAL      NOT NULL PRIMARY KEY,
    type           varchar(10) NOT NULL,
    object_name    varchar(40) NOT NULL
);

CREATE TABLE supply
(
    supply_id    SERIAL NOT NULL PRIMARY KEY,
    suppliers_id INT NOT NULL,
    CONSTRAINT fk_suppliers_id FOREIGN KEY (suppliers_id) REFERENCES  suppliers(suppliers_id)
);

CREATE TABLE suppliers
(
    suppliers_id   SERIAL      NOT NULL PRIMARY KEY,
    suppliers_name varchar(50) NOT NULL,
    INN            varchar(10),
    OGRN           varchar(13),
    URL            varchar,
    supply_id      INT      NOT NULL,
    CONSTRAINT fk_supply_id FOREIGN KEY (supply_id) REFERENCES supply(supply_id)
);