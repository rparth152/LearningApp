
create proc addCourse
    @coursename VARCHAR(100),
    @description VARCHAR(MAX),
    @fieldid INT,
    @uid INT
AS
BEGIN
    
    INSERT INTO Courses
        (coursename, description, fieldid, uid)
    VALUES
        (@coursename, @description, @fieldid, @uid);

   
    SELECT *
    FROM Courses
    WHERE
        coursename = @coursename
        AND description = @description
        AND fieldid = @fieldid
        AND uid = @uid
    ORDER BY createdat DESC;  
END;


CREATE PROCEDURE InsertModule
    @courseid INT,
    @title VARCHAR(200),
    @contenttext VARCHAR(MAX),
    @contenturl VARCHAR(500)
AS
BEGIN
    INSERT INTO Modules
        (courseid, title, contenttext, contenturl)
    VALUES
        (@courseid, @title, @contenttext, @contenturl);
END;


CREATE PROCEDURE InsertQuiz
    @courseid INT,
    @moduleid INT,
    @title VARCHAR(200)
AS
BEGIN
    INSERT INTO Quizzes (courseid, moduleid, title)
    VALUES (@courseid, @moduleid, @title);
END

CREATE PROCEDURE InsertQuestion
    @quizid INT,
    @questiontext VARCHAR(MAX),
    @optiona VARCHAR(300),
    @optionb VARCHAR(300),
    @optionc VARCHAR(300),
    @optiond VARCHAR(300),
    @correctanswer VARCHAR(1)
AS
BEGIN
    INSERT INTO Questions
        (quizid, questiontext, optiona, optionb, optionc, optiond, correctanswer)
    VALUES
        (@quizid, @questiontext, @optiona, @optionb, @optionc, @optiond, @correctanswer);
END