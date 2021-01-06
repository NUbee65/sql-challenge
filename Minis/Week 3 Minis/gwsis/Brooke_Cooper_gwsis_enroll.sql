SELECT * FROM student WHERE lastname LIKE 'B&&';

SELECT * FROM course;

INSERT INTO class (id_course, section, startdate, enddate)
VALUES 
	(1, 'DTVZ-2020-Nov', '2020-9-23', '2020-3-23'),
	(5, 'MKTG-2020-Nov', '2020-11-12', '2020-5-12');
	
SELECT * FROM class;
	
SELECT
	co.coursecode,
	co.coursename,
	co.credithours,
	c.section,
	c.startdate
FROM 
	class c
	INNER JOIN course co
	ON c.id_course = co.id_course;

SELECT * FROM student;

INSERT INTO classparticipant (id_student, id_class, startdate, enddate)
VALUES 
	(1, 3, '2020-9-23', '2020-3-23'),
	(2, 3, '2020-9-23', '2020-3-23'),
	(3, 3, '2020-9-23', '2020-3-23'),
	(4, 3, '2020-9-23', '2020-3-23'),
	(5, 3, '2020-9-23', '2020-3-23'),
	(11, 4, '2020-11-12', '2020-5-12'),
	(12, 4, '2020-11-12', '2020-5-12'),
	(13, 4, '2020-11-12', '2020-5-12'),
	(14, 4, '2020-11-12', '2020-5-12'),
	(15, 4, '2020-11-12', '2020-5-12');

SELECT * FROM classparticipant;

SELECT * FROM staff;

INSERT INTO staffassignment (id_staff, id_class, role, startdate, enddate)
VALUES 
	(2, 3, 'Instructor', '2020-9-23', '2020-3-23'),
	(3, 4, 'Instructor', '2020-11-12', '2020-5-12');

SELECT * FROM staffassignment;

CREATE VIEW "ClassInfo" AS

	SELECT
		CONCAT (co.coursecode, ' -- ', co.coursename) AS "course_class",
		co.credithours,
		CONCAT (sf.firstname, ' ', sf.lastname) AS "instructor_name",
		s.lastname AS student_lastname,
		s.firstname AS student_firstname,
		c.startdate,
		c.enddate
	FROM
		class AS c
		INNER JOIN course AS co
		ON c.id_course = co.id_course
		INNER JOIN staffassignment AS sa
		ON c.id_class = sa.id_class
		INNER JOIN staff AS sf
		ON sa.id_staff = sf.id_staff
		INNER JOIN classparticipant AS cp
		ON c.id_class = cp.id_class
		INNER JOIN student AS s
		ON cp.id_student = s.id_student;
	
SELECT * FROM "ClassInfo";

SELECT * FROM "ClassInfo"
WHERE course_class LIKE 'BC-DATAVIZ%';

SELECT * FROM "ClassInfo"
WHERE course_class LIKE 'BC-DIGMKTG%';

SELECT * FROM "ClassInfo"
WHERE student_lastname LIKE 'H%';

SELECT * FROM "ClassInfo"
WHERE 
	course_class LIKE 'BC-DATAVIZ%'
	AND student_lastname LIKE 'C%';


	

