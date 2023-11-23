-- TEST student change to another year in another class
INSERT INTO my_db.classes (id_class, name, person_id, room_id) VALUES ('5', 'Si-t2c', '5', '2');
INSERT INTO my_db.trimesters (name, startdate, enddate, class_id) VALUES ('1er trimestre 2024', '2024-01-01', '2024-06-30', '5');
INSERT INTO my_db.classes_contains_people SET class_id = '5', person_id='10';

-- TEST student can repeat a year
INSERT INTO my_db.trimesters (name, startdate, enddate, class_id) VALUES ('1er trimestre 2024', '2024-01-01', '2024-01-01', '3');
INSERT INTO my_db.classes_contains_people SET class_id = '3', person_id = '10';