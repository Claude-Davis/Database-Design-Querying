--@block
RENAME TABLE professsor TO professor;

--@block
ALTER TABLE professor
ADD PRIMARY KEY (prof_name);

--@block
CREATE TABLE course(
    id varchar(10) PRIMARY KEY NOT NULL,
    professor varchar(50),
    FOREIGN KEY (professor) REFERENCES professor(prof_name),
    semester_season varchar(6) NOT NULL,
    semester_year int NOT NULL,
    final_grade char(2) NOT NULL,
    modality varchar(15),
    class_type varchar(15)
);
