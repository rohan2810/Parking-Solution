# Parking Solution Project's DB Schema
# Total 10 tables
# Added search indexes to speed up the search process
# Added foreign key for validation and to satisfy weak entity set relationship(Garage, Floor, Spot)


DROP SCHEMA IF EXISTS parkingsolution;
CREATE SCHEMA parkingsolution;
USE parkingsolution;

CREATE TABLE parkingsolution.Garage
(
    Garage_Id     INT          NOT NULL AUTO_INCREMENT,
    Owner_Id      INT          NOT NULL,
    Operator_Id   INT          NOT NULL,
    Zip           VARCHAR(5)   NOT NULL,
    Set_cost      INT          NOT NULL,
    Garage_name   VARCHAR(100) NOT NULL,
    number_floors INT          NOT NULL,
    Total_spots   INT          NOT NULL,
    Address       VARCHAR(150) NOT NULL UNIQUE,
    Available     TINYINT      NOT NULL,
    PRIMARY KEY (Garage_Id),
    UNIQUE INDEX Operator_Id_UNIQUE (Operator_Id ASC) VISIBLE
);

CREATE TABLE parkingsolution.Owner
(
    Owner_Id     INT         NOT NULL AUTO_INCREMENT,
    Username     VARCHAR(45) NOT NULL,
    Name         VARCHAR(45) NOT NULL,
    Phone_number VARCHAR(10) NOT NULL UNIQUE,
    Password     VARCHAR(45) NOT NULL,
    Owner_code   VARCHAR(6)  NOT NULL UNIQUE,
    Garage_Id    INT         NOT NULL,
    PRIMARY KEY (Owner_Id, Username),
    UNIQUE INDEX Garage_Id_UNIQUE (Garage_Id ASC) VISIBLE,
    CONSTRAINT fk_garage_id
        FOREIGN KEY (Garage_Id)
            REFERENCES parkingsolution.Garage (Garage_Id)
            ON DELETE RESTRICT
            ON UPDATE CASCADE
);

CREATE TABLE ParkingSolution.Operator
(
    Operator_Id  INT         NOT NULL AUTO_INCREMENT,
    Username     VARCHAR(45) NOT NULL UNIQUE,
    Name         VARCHAR(45) NOT NULL,
    Phone_number VARCHAR(10) NOT NULL,
    Password     VARCHAR(45) NOT NULL,
    Garage_Id    INT         NOT NULL,
    Salary       VARCHAR(45) NOT NULL,
    PRIMARY KEY (Operator_Id),
    UNIQUE INDEX Garage_Id_UNIQUE (Garage_Id ASC) VISIBLE,
    CONSTRAINT fk_garage_id1
        FOREIGN KEY (Garage_Id)
            REFERENCES ParkingSolution.Garage (Garage_Id)
            ON DELETE RESTRICT
            ON UPDATE NO ACTION
);


CREATE TABLE parkingsolution.Floor
(
    Floor_Id        INT NOT NULL AUTO_INCREMENT,
    Total_booked    INT NULL,
    Total_spots     INT NULL,
    Total_Available INT GENERATED ALWAYS AS (Total_spots - Total_booked) COMMENT 'All spots - Booked Spots',
    Garage_Id       INT NOT NULL,
    PRIMARY KEY (Floor_Id, Garage_Id),
    CONSTRAINT fk_garage_id_floor
        FOREIGN KEY (Garage_Id)
            REFERENCES parkingsolution.Garage (Garage_Id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);


CREATE TABLE parkingsolution.Spot
(
    Garage_Id   INT     NOT NULL,
    Floor_Id    INT     NOT NULL,
    Spot_Id     INT     NOT NULL,
    Open        TINYINT NOT NULL,
    Duration_Id ENUM ('0.5', '1', '2', '3', '6', '9', '12', '16', '24'),
    PRIMARY KEY (Garage_Id, Floor_Id, Spot_Id),
    CONSTRAINT fk_garage_id_4
        FOREIGN KEY (Garage_Id)
            REFERENCES parkingsolution.Garage (Garage_Id)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT fk_floor_id1
        FOREIGN KEY (Floor_Id)
            REFERENCES parkingsolution.Floor (Floor_Id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);


CREATE TABLE parkingsolution.User
(
    User_Id      INT         NOT NULL AUTO_INCREMENT,
    Username     VARCHAR(45) NOT NULL,
    Name         VARCHAR(45) NOT NULL,
    Password     VARCHAR(45) NOT NULL,
    Phone_number VARCHAR(10) NOT NULL,
    PRIMARY KEY (User_Id),
    UNIQUE INDEX Username_UNIQUE (Username ASC) VISIBLE
);

CREATE TABLE parkingsolution.Duration
(
    Duration_Id       ENUM ('0.5', '1', '2', '3', '6', '9', '12', '16', '24') NOT NULL,
    Duration_name     VARCHAR(45)                                             NULL,
    Duration_in_hours VARCHAR(45)                                             NULL,
    PRIMARY KEY (Duration_Id)
);

CREATE TABLE parkingsolution.Booking
(
    Booking_Id   INT                                                     NOT NULL AUTO_INCREMENT,
    User_Id      INT                                                     NOT NULL,
    Spot_Id      INT                                                     NOT NULL,
    Duration_Id  ENUM ('0.5', '1', '2', '3', '6', '9', '12', '16', '24') NOT NULL,
    Code         VARCHAR(6)                                              NOT NULL UNIQUE,
    Cost         INT                                                     NOT NULL,
    Car_no_plate VARCHAR(45)                                             NOT NULL,
    Operator_Id  INT                                                     NOT NULL,
    Timedate     DATETIME                                                NOT NULL DEFAULT now(),
    PRIMARY KEY (Booking_Id),
    INDEX fk_user_id_idx (User_Id ASC) VISIBLE,
    CONSTRAINT fk_user_id
        FOREIGN KEY (User_Id)
            REFERENCES parkingsolution.User (User_Id)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION
);

CREATE TABLE parkingsolution.Parking_Slip
(
    Parking_Slip_Id      INT     NOT NULL AUTO_INCREMENT,
    Booking_Id           INT     NOT NULL,
    Expected_exit_time   TIME    NOT NULL,
    Actual_exit_time     TIME    NOT NULL,
    Penalty_time         TIME GENERATED ALWAYS AS (Actual_exit_time - Expected_exit_time),
    Penalty_amount       INT     NOT NULL DEFAULT 0,
    Bfr_penalty_amount   INT     NOT NULL,
    After_penalty_amount VARCHAR(45) GENERATED ALWAYS AS (Penalty_amount + Bfr_penalty_amount),
    Is_paid              TINYINT NOT NULL,
    PRIMARY KEY (Parking_Slip_Id),
    UNIQUE INDEX Booking_Id_UNIQUE (Booking_Id ASC) VISIBLE,
    CONSTRAINT fk_booking_id1
        FOREIGN KEY (Booking_Id)
            REFERENCES parkingsolution.Booking (Booking_Id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);


CREATE TABLE parkingsolution.Works_For
(
    id             INT         NOT NULL AUTO_INCREMENT,
    Owner_Id       INT         NOT NULL,
    Owner_username VARCHAR(45) NOT NULL,
    Operator_Id    INT         NOT NULL,
    Operator_code  INT         NOT NULL,
    PRIMARY KEY (id),
    UNIQUE INDEX Operator_code_UNIQUE (Operator_code ASC) VISIBLE,
    INDEX relation_owner_id_idx (Owner_Id ASC, Owner_username ASC) VISIBLE,
    INDEX relation_operator_id_idx (Operator_Id ASC) VISIBLE,
    CONSTRAINT relation_owner_id
        FOREIGN KEY (Owner_Id, Owner_username)
            REFERENCES parkingsolution.Owner (Owner_Id, Username)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT relation_operator_id
        FOREIGN KEY (Operator_Id)
            REFERENCES parkingsolution.Operator (Operator_Id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

