DROP SCHEMA IF EXISTS parkingsolution;
CREATE SCHEMA parkingsolution;
USE parkingsolution;

CREATE TABLE `parkingsolution`.`Garage`
(
    `Garage_Id`     INT          NOT NULL AUTO_INCREMENT,
    `Owner_Id`      INT          NOT NULL,
    `Operator_Id`   INT          NOT NULL,
    `Zip`           VARCHAR(5)   NOT NULL,
    `Set_cost`      INT          NOT NULL,
    `Garage_name`   VARCHAR(100) NOT NULL,
    `number_floors` INT          NOT NULL,
    `Total_spots`   INT          NOT NULL,
    `Address`       VARCHAR(150) NOT NULL,
    `Available`     TINYINT      NOT NULL,
    PRIMARY KEY (`Garage_Id`),
    UNIQUE INDEX `Address_UNIQUE` (`Address` ASC) VISIBLE,
    UNIQUE INDEX `Operator_Id_UNIQUE` (`Operator_Id` ASC) VISIBLE
);

CREATE TABLE `parkingsolution`.`Owner`
(
    `Owner_Id`     INT         NOT NULL AUTO_INCREMENT,
    `Username`     VARCHAR(45) NOT NULL,
    `Name`         VARCHAR(45) NOT NULL,
    `Phone_number` VARCHAR(10) NOT NULL,
    `Password`     VARCHAR(45) NOT NULL,
    `Owner_code`   VARCHAR(6)  NOT NULL,
    `Garage_Id`    INT         NOT NULL,
    PRIMARY KEY (`Owner_Id`, `Username`),
    UNIQUE INDEX `Garage_Id_UNIQUE` (`Garage_Id` ASC) VISIBLE,
    UNIQUE INDEX `Phone_number_UNIQUE` (`Phone_number` ASC) VISIBLE,
    UNIQUE INDEX `Owner_code_UNIQUE` (`Owner_code` ASC) VISIBLE,
    CONSTRAINT `fk_garage_id`
        FOREIGN KEY (`Garage_Id`)
            REFERENCES `parkingsolution`.`Garage` (`Garage_Id`)
            ON DELETE RESTRICT
            ON UPDATE CASCADE
);

CREATE TABLE `ParkingSolution`.`Operator`
(
    `Operator_Id`  INT         NOT NULL AUTO_INCREMENT,
    `Garage_Id`    INT         NOT NULL,
    `Name`         VARCHAR(45) NOT NULL,
    `Username`     VARCHAR(45) NOT NULL,
    `Password`     VARCHAR(45) NOT NULL,
    `Salary`       VARCHAR(45) NOT NULL,
    `Phone_number` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`Operator_Id`),
    UNIQUE INDEX `Garage_Id_UNIQUE` (`Garage_Id` ASC) VISIBLE,
    UNIQUE INDEX `Username_UNIQUE` (`Username` ASC) VISIBLE,
    CONSTRAINT `fk_garage_id9`
        FOREIGN KEY (`Garage_Id`)
            REFERENCES `ParkingSolution`.`Garage` (`Garage_Id`)
            ON DELETE RESTRICT
            ON UPDATE CASCADE
);


CREATE TABLE `parkingsolution`.`Floor`
(
    `Floor_Id`        INT NOT NULL AUTO_INCREMENT,
    `Total_booked`    INT NULL,
    `Total_spots`     INT NULL,
    `Total_Available` INT GENERATED ALWAYS AS (Total_spots - Total_booked) COMMENT 'Total_spots-Total_booked',
    `Garage_Id`       INT NOT NULL,
    PRIMARY KEY (`Floor_Id`, `Garage_Id`),
    INDEX `fk_garage_id_floor_idx` (`Garage_Id` ASC) VISIBLE,
    CONSTRAINT `fk_garage_id_floor`
        FOREIGN KEY (`Garage_Id`)
            REFERENCES `parkingsolution`.`Garage` (`Garage_Id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);


CREATE TABLE `parkingsolution`.`Spot`
(
    `Garage_Id`   INT                                                     NOT NULL,
    `Floor_Id`    INT                                                     NOT NULL,
    `Spot_Id`     INT                                                     NOT NULL,
    `Open`        TINYINT                                                 NULL,
    `Duration_Id` ENUM ('0.5', '1', '2', '3', '6', '9', '12', '16', '24') NOT NULL,
    PRIMARY KEY (`Garage_Id`, `Floor_Id`, `Spot_Id`),
    CONSTRAINT `fk_garage_id_4`
        FOREIGN KEY (`Garage_Id`)
            REFERENCES `parkingsolution`.`Garage` (`Garage_Id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE,
    CONSTRAINT `fk_floor_id1`
        FOREIGN KEY (`Floor_Id`)
            REFERENCES `parkingsolution`.`Floor` (`Floor_Id`)
            ON DELETE CASCADE
            ON UPDATE CASCADE
);


CREATE TABLE `parkingsolution`.`User`
(
    `User_Id`      INT         NOT NULL AUTO_INCREMENT,
    `Username`     VARCHAR(45) NOT NULL,
    `Name`         VARCHAR(45) NOT NULL,
    `Password`     VARCHAR(45) NOT NULL,
    `Phone_number` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`User_Id`),
    UNIQUE INDEX `Username_UNIQUE` (`Username` ASC) VISIBLE
);

CREATE TABLE `parkingsolution`.`Duration`
(
    `Duration_Id`       ENUM ('0.5', '1', '2', '3', '6', '9', '12', '16', '24') NOT NULL,
    `Duration_name`     VARCHAR(45)                                             NULL,
    `Duration_in_hours` VARCHAR(45)                                             NULL,
    PRIMARY KEY (`Duration_Id`)
);






