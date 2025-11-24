SELECT c.id, c.Professor, c.Class_Type, c.Semester_Year, c.Semester_Season
FROM Course c
ORDER BY Semester_Year ASC,
        CASE
            WHEN Semester_Season='Fall' THEN 0
            WHEN Semester_Season='Summer' THEN 1
            WHEN Semester_Season='Spring' THEN 2
        END DESC,
        ID ASC
;
