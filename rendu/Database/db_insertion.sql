INSERT INTO
    addresses (
        id_address,
        street,
        locality,
        postal_code,
        administrative_area,
        country,
        premise
    )
VALUES
    (
        1,
        '3686 Lakeland Trail',
        'Buenlag',
        '2302',
        'VD',
        'CH',
        'PO Box 18638'
    ),
    (
        2,
        '61194 Washington Road',
        'Shajing',
        '2532',
        'NE',
        'CH',
        '5th Floor'
    ),
    (
        3,
        '7 Valley Edge Way',
        'Panganiban',
        'P-12312039',
        'Panganiban',
        'BE',
        'Apt 1023'
    ),
    (
        4,
        '974 Autumn Leaf Plaza',
        'Wanasari Baleran',
        'W-12312039',
        'Wanasari Baleran',
        'IT',
        '12th Floor'
    ),
    (
        5,
        '8 Luster Avenue',
        'Cigaluh',
        '1252',
        'FR',
        'CH',
        'Room 1901'
    ),
    (
        6,
        '1074 Bellgrove Trail',
        'Zhourui',
        'Z-12312039',
        'Zhourui',
        'FR',
        'Apt 1711'
    ),
    (
        7,
        '5860 Mayfield Court',
        'Chetian',
        '3642',
        'BE',
        'CH',
        '18th Floor'
    ),
    (
        8,
        '648 Holy Cross Park',
        'Paninggaran',
        '1234',
        'GE',
        'CH',
        'Suite 91'
    ),
    (
        9,
        '7003 Macpherson Trail',
        'Criciúma',
        '2342',
        'Criciúma',
        'FR',
        '13th Floor'
    ),
    (
        10,
        '345 Mallard Hill',
        'Montemor-o-Velho',
        '1412',
        'VD',
        'CH',
        'PO Box 80457'
    );

INSERT INTO
    rooms (id_room, name)
VALUES
    (1, 'SC-330'),
    (2, 'SC-331'),
    (3, 'SC-332'),
    (4, 'SC-333'),
    (5, 'SC-334'),
    (6, 'SC-335'),
    (7, 'SC-101'),
    (8, 'SC-102'),
    (9, 'SC-103'),
    (10, 'SC-202');

INSERT INTO
    specializations (name, description)
VALUES
    (
        'DEV',
        'eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas metus aenean'
    ),
    (
        'SYS',
        'risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero nullam sit'
    );

INSERT INTO
    people (
        id_person,
        firstname,
        lastname,
        birthdate,
        email,
        phone_number,
        IBAN,
        address_id,
        specialization_id
    )
VALUES
    (
        1,
        'Bernadette',
        'Fitzroy',
        '1985-8-25',
        'bfitzroy0@washingtonpost.com',
        '+41786842506',
        'CH9300762011623852957',
        1,
        null
    ),
    (
        2,
        'Hanni',
        'Francom',
        '1979-8-20',
        'hfrancom1@github.com',
        '+41786812506',
        'CH9300762011623852957',
        2,
        null
    ),
    (
        3,
        'Amerigo',
        'Clendinning',
        '2018-7-27',
        'aclendinning2@google.com',
        '+41786842123',
        'CH9300762011623852957',
        3,
        null
    ),
    (
        4,
        'Ekaterina',
        'Thomassen',
        '1985-7-19',
        'ethomassen3@sfgate.com',
        '+41791042506',
        'CH9300762011623852957',
        4,
        null
    ),
    (
        5,
        'Petr',
        'McAmish',
        '1977-9-5',
        'pmcamish4@tmall.com',
        '+41786841506',
        null,
        5,
        1
    ),
    (
        6,
        'Catha',
        'Quinevan',
        '1995-10-18',
        'cquinevan5@drupal.org',
        '+41786840853',
        null,
        6,
        2
    ),
    (
        7,
        'Gina',
        'Lancett',
        '2000-8-16',
        'glancett6@fema.gov',
        '+41786840321',
        null,
        7,
        2
    ),
    (
        8,
        'Fernandina',
        'Dumphries',
        '1985-4-3',
        'fdumphries7@blogs.com',
        '+41786085506',
        null,
        8,
        1
    ),
    (
        9,
        'Vilhelmina',
        'Trippitt',
        '1985-3-6',
        'vtrippitt8@hostgator.com',
        '+41792442506',
        null,
        9,
        1
    ),
    (
        10,
        'Pauli',
        'Chaimson',
        '2001-4-12',
        'pchaimson9@princeton.edu',
        '+41786842097',
        null,
        10,
        2
    );

INSERT INTO
    classes (id_class, name, person_id, room_id)
VALUES
    (1, 'Si-t1a', 1, 7),
    (2, 'Si-t2a', 1, 1),
    (3, 'Si-t1b', 2, 9),
    (4, 'Si-t2b', 2, 5);


INSERT INTO
    trimesters (id_trimester, name, startdate, enddate, class_id)
VALUES
    (
        1,
        '1er trimestre 2023',
        '2023-01-01',
        '2023-06-30',
        1
    ),
    (
        2,
        '2ème trimestre 2023',
        '2023-07-01',
        '2023-12-31',
        1
    ),
    (
        3,
        '1er trimestre 2023',
        '2023-01-01',
        '2023-06-30',
        3
    ),
    (
        4,
        '2ème trimestre 2023',
        '2023-07-01',
        '2023-12-31',
        3
    ),
    (
        5,
        '1er trimestre 2024',
        '2024-01-01',
        '2024-06-30',
        2
    ),
    (
        6,
        '2ème trimestre 2024',
        '2024-07-01',
        '2024-12-31',
        2
    );

INSERT INTO
    courses_status (id_courses_status, name)
VALUES
    (1, 'obselète'),
    (2, 'en cours'),
    (3, 'en révision'),
    (4, 'à réviser');

INSERT INTO
    courses (
        id_course,
        name,
        description,
        courses_status_id_courses_status
    )
VALUES
    (
        1,
        'SQL1',
        'scelerisque quam turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam convallis nunc proin',
        2
    ),
    (
        2,
        'GUI1',
        'volutpat dui maecenas tristique est et',
        2
    ),
    (
        3,
        'PRW1',
        'felis ut at dolor quis odio consequat varius',
        2
    ),
    (
        4,
        'MAW1.1',
        'nisi volutpat eleifend donec ut dolor morbi vel lectus',
        2
    ),
    (
        5,
        'CLD1',
        'elit ac nulla sed vel enim sit amet nunc viverra dapibus nulla',
        2
    ),
    (
        6,
        'MAW1.2',
        'lacus at turpis donec posuere metus vitae ipsum aliquam non mauris morbi non lectus aliquam sit',
        1
    ),
    (
        7,
        'GUI2',
        'ligula vehicula consequat morbi a ipsum integer a nibh in quis justo maecenas',
        1
    ),
    (
        8,
        'POO1',
        'tincidunt nulla mollis molestie lorem quisque ut erat curabitur gravida nisi at nibh in hac habitasse platea dictumst',
        3
    ),
    (
        9,
        'LAR1',
        'adipiscing molestie hendrerit at vulputate vitae nisl aenean lectus',
        4
    ),
    (
        10,
        'AWS1',
        'eu nibh quisque id justo sit amet sapien',
        3
    );

INSERT INTO
    marks (
        id_mark,
        name,
        mark,
        course_id,
        trimester_id,
        person_id
    )
VALUES
    (1, 'Projet SQL', 6, 1, 1, 3),
    (2, 'Projet SQL', 6, 1, 1, 4),
    (3, 'Projet SQL', 6, 1, 1, 5),
    (4, 'Web app', '2.5', 6, 1, 3),
    (5, 'Web app', 5, 6, 1, 4),
    (6, 'Web app', 4, 6, 1, 5),
    (7, 'UI/UX', '4.5', 2, 1, 3),
    (8, 'UI/UX', '5.5', 2, 1, 4),
    (9, 'UI/UX', 5, 2, 1, 5),
    (10, 'UI/UX', '3.5', 2, 1, 6);

INSERT INTO
    people_status (id_people_status, name)
VALUES
    (1, 'prof'),
    (2, 'élève'),
    (3, 'en cours'),
    (4, 'arrêt prolongé'),
    (5, 'retraite'),
    (6, 'fini'),
    (7, 'arrêté');

INSERT INTO
    people_has_status (person_id, status_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 2),
    (4, 2),
    (5, 2),
    (6, 2),
    (7, 2),
    (8, 2),
    (9, 2),
    (10, 2),
    (1, 3),
    (2, 3),
    (3, 3),
    (4, 3),
    (5, 3),
    (6, 3),
    (7, 3),
    (8, 3),
    (9, 3),
    (10, 3);

INSERT INTO
    people_has_courses (person_id, course_id)
VALUES
    (3, 1),
    (4, 6),
    (5, 2),
    (6, 2),
    (3, 2),
    (4, 1),
    (5, 1),
    (3, 3),
    (4, 3),
    (5, 3);

INSERT INTO
    courses_has_trimesters (
        course_id,
        trimester_id,
        start_time,
        end_time,
        weekday
    )
VALUES
    (1, 1, '08:00:00', '12:15:00', 'Monday'),
    (2, 1, '08:00:00', '12:15:00', 'Tuesday'),
    (3, 1, '08:00:00', '12:15:00', 'Wednesday'),
    (4, 1, '08:00:00', '12:15:00', 'Thursday'),
    (5, 1, '08:00:00', '12:15:00', 'Friday'),
    (6, 2, '08:00:00', '12:15:00', 'Monday'),
    (7, 2, '08:00:00', '12:15:00', 'Tuesday'),
    (8, 2, '08:00:00', '12:15:00', 'Wednesday'),
    (9, 2, '08:00:00', '12:15:00', 'Thursday'),
    (10, 2, '08:00:00', '12:15:00', 'Friday');

INSERT INTO
    courses_has_specializations (course_id, specialization_id)
VALUES
    (1, 1),
    (2, 1),
    (3, 1),
    (4, 2),
    (5, 2),
    (6, 2),
    (7, 1),
    (8, 1),
    (9, 1),
    (10, 2);

INSERT INTO
    classes_contains_people (class_id, person_id)
VALUES
    (1, 3),
    (1, 4),
    (1, 5),
    (1, 6),
    (1, 7),
    (1, 8),
    (1, 9),
    (1, 10);