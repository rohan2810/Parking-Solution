# Parking Solution Project's DB Schema
# Total 10 tables
# Added search indexes to speed up the search process
# Added foreign key for validation and to satisfy weak entity set relationship(Garage, Floor, Spot)


DROP SCHEMA IF EXISTS parkingsolution;
CREATE SCHEMA parkingsolution;
USE parkingsolution;

CREATE TABLE parkingsolution.User
(
    Id           INT         NOT NULL AUTO_INCREMENT,
    Username     VARCHAR(45) NOT NULL,
    Email        VARCHAR(45) NOT NULL,
    Name         VARCHAR(45) NOT NULL,
    Password     VARCHAR(45) NOT NULL,
    Phone_number VARCHAR(10) NOT NULL,
    PRIMARY KEY (Id),
    UNIQUE INDEX Username_UNIQUE (Username ASC) VISIBLE,
    UNIQUE INDEX Email_UNIQUE (Email ASC) VISIBLE
);

CREATE TABLE parkingsolution.Garage
(
    Garage_Id     INT          NOT NULL AUTO_INCREMENT,
    Zip           VARCHAR(5)   NOT NULL,
    Set_Cost      INT          NOT NULL,
    Garage_Name   VARCHAR(100) NOT NULL,
    Address       VARCHAR(150) NOT NULL UNIQUE,
    Number_Floors INT          NOT NULL,
    Number_Spots  INT          NOT NULL,
    PRIMARY KEY (Garage_Id),
	UNIQUE INDEX Name_UNIQUE (Garage_Name ASC) VISIBLE
);

CREATE TABLE parkingsolution.Owner
(
    User_Id    INT        NOT NULL,
    Garage_Id  INT        NOT NULL,
    Owner_Code VARCHAR(6) NOT NULL,
    PRIMARY KEY (User_Id, Garage_Id),
    UNIQUE INDEX Owner_Code_UNIQUE (Owner_Code ASC) VISIBLE
);


CREATE TABLE parkingsolution.Operator
(
    User_Id       INT        NOT NULL,
    Garage_Id     INT        NOT NULL,
    Operator_Code VARCHAR(6) NOT NULL,
    PRIMARY KEY (User_Id, Garage_Id),
    UNIQUE INDEX Operator_Code_UNIQUE (Operator_Code ASC) VISIBLE
);

CREATE TABLE parkingsolution.Customer
(
    User_Id        INT NOT NULL,
    Booking_Id     INT NOT NULL,
    Total_Bookings INT NULL,
    PRIMARY KEY (User_Id, Booking_Id)
);


CREATE TABLE parkingsolution.Floor
(
    Garage_Id       INT NOT NULL,
    Floor_Id        INT NOT NULL AUTO_INCREMENT,
    Total_Booked    INT NOT NULL,
    Total_Spots     INT NOT NULL,
    Total_Available INT GENERATED ALWAYS AS ((Total_Spots - Total_Booked)),
    PRIMARY KEY (Floor_Id, Garage_Id),
    CONSTRAINT fk_garage_floor
        FOREIGN KEY (Garage_Id)
            REFERENCES parkingsolution.Garage (Garage_Id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE parkingsolution.Spot
(
    Spot_Id    INT        NOT NULL,
    Floor_Id   INT        NOT NULL,
    Garage_Id  INT        NOT NULL,
    Start_Time VARCHAR(2) NOT NULL,
    End_Time   VARCHAR(2) NOT NULL,
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

CREATE TABLE parkingsolution.Booking
(
    Booking_Id   INT         NOT NULL AUTO_INCREMENT,
    User_Id      INT         NOT NULL,
    Spot         INT         NOT NULL COMMENT 'GarageId+FloorId+SpotId',
    Code         VARCHAR(6)  NOT NULL,
    Start_Time   DATETIME    NOT NULL,
    End_Time     DATETIME    NOT NULL,
    Car_no_plate VARCHAR(45) NOT NULL,
    Cost         INT         NOT NULL,
    Booking_Time DATETIME    NOT NULL DEFAULT now() ON UPDATE now(),
    PRIMARY KEY (Booking_Id),
    UNIQUE INDEX Code_UNIQUE (Code ASC) VISIBLE,
    INDEX fk_booking_user_idx (User_Id ASC) VISIBLE,
    CONSTRAINT fk_booking_user
        FOREIGN KEY (User_Id)
            REFERENCES parkingsolution.User (Id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);

CREATE TABLE parkingsolution.Parking_Slip
(
    Parking_Slip_Id      INT     NOT NULL AUTO_INCREMENT,
    Booking_Id           INT     NOT NULL,
    Actual_Exit_Time     TIME    NOT NULL,
    Expected_Exit_Time   TIME    NOT NULL,
    Bfr_penalty_amount   INT     NOT NULL,
    Penalty_time         INT     NOT NULL,
    Penalty_Amount       INT GENERATED ALWAYS AS (Penalty_time * 30),
    After_penalty_amount INT GENERATED ALWAYS AS (Penalty_amount + Bfr_penalty_amount),
    Is_Paid              TINYINT NOT NULL,
    PRIMARY KEY (Parking_Slip_Id),
    INDEX fk_slip_booking_idx (Booking_Id ASC) VISIBLE,
    CONSTRAINT fk_slip_booking
        FOREIGN KEY (Booking_Id)
            REFERENCES parkingsolution.Booking (Booking_Id)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);


