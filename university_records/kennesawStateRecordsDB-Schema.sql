CREATE TABLE `Tutor_Session`(
    `FK id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '--fk to Study_Session(study_id)',
    `tutor_name` VARCHAR(50) NOT NULL,
    `tutoring_avenue` VARCHAR(100) NOT NULL
);
CREATE TABLE `Group_Session`(
    `FK id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY COMMENT '--fk to Study_Session(study_id)',
    `group_size` INT NOT NULL
);
CREATE TABLE `Study_Session`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `session_date` DATE NOT NULL,
    `time` TIME NOT NULL,
    `FK course` VARCHAR(10) NOT NULL,
    `location` VARCHAR(20) NOT NULL,
    `private_session` BOOLEAN NOT NULL
);
CREATE TABLE `Project`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `proj_name` VARCHAR(100) NOT NULL,
    `FK course` VARCHAR(10) NOT NULL COMMENT '--fk to Course(ID)',
    `Key_Tool` VARCHAR(20) NOT NULL
);
CREATE TABLE `Test_Schedule`(
    `Test_Name` VARCHAR(50) NOT NULL,
    `FK Course` VARCHAR(10) NOT NULL,
    `Deadline` DATE NOT NULL,
    `Test_Type` VARCHAR(20) NOT NULL,
    PRIMARY KEY(`Test_Name`)
);
CREATE TABLE `Test_Results`(
    `FK Test_Name` VARCHAR(50) NOT NULL,
    `Grade` DECIMAL(4, 2) NOT NULL,
    `FK Study_Sesssion_ID` BIGINT NOT NULL,
    PRIMARY KEY(`FK Test_Name`)
);
CREATE TABLE `Professor`(
    `Prof_Name` VARCHAR(50) NOT NULL,
    `Department` VARCHAR(50) NOT NULL,
    `Email` VARCHAR(30) NULL,
    PRIMARY KEY(`Prof_Name`)
);
CREATE TABLE `Course`(
    `ID` VARCHAR(10) NOT NULL,
    `FK Professor` VARCHAR(50) NOT NULL COMMENT '--fk to Professor(prof_name)',
    `Semester_Season` VARCHAR(6) NOT NULL,
    `Semester_Year` INT NOT NULL,
    `Final_Grade` CHAR(2) NOT NULL,
    `Modality` VARCHAR(15) NULL,
    `Class_Type` VARCHAR(15) NULL,
    PRIMARY KEY(`ID`)
);
ALTER TABLE
    `Study_Session` ADD CONSTRAINT `study_session_fk course_foreign` FOREIGN KEY(`FK course`) REFERENCES `Course`(`ID`);
ALTER TABLE
    `Test_Results` ADD CONSTRAINT `test_results_fk study_sesssion_id_foreign` FOREIGN KEY(`FK Study_Sesssion_ID`) REFERENCES `Study_Session`(`id`);
ALTER TABLE
    `Study_Session` ADD CONSTRAINT `study_session_id_foreign` FOREIGN KEY(`id`) REFERENCES `Tutor_Session`(`FK id`);
ALTER TABLE
    `Project` ADD CONSTRAINT `project_fk course_foreign` FOREIGN KEY(`FK course`) REFERENCES `Course`(`ID`);
ALTER TABLE
    `Test_Schedule` ADD CONSTRAINT `test_schedule_test_name_foreign` FOREIGN KEY(`Test_Name`) REFERENCES `Test_Results`(`FK Test_Name`);
ALTER TABLE
    `Course` ADD CONSTRAINT `course_fk professor_foreign` FOREIGN KEY(`FK Professor`) REFERENCES `Professor`(`Prof_Name`);
ALTER TABLE
    `Test_Schedule` ADD CONSTRAINT `test_schedule_fk course_foreign` FOREIGN KEY(`FK Course`) REFERENCES `Course`(`ID`);
ALTER TABLE
    `Study_Session` ADD CONSTRAINT `study_session_id_foreign` FOREIGN KEY(`id`) REFERENCES `Group_Session`(`FK id`);