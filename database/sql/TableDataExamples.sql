INSERT INTO Campaigns (
    title, 
    dungeon_master
)
VALUES (
    'The Quest for the Data Artifact within the Eldritch Base', 
    'Julia Fay'
),
(
    'Where the Nerdy Things Are',
    'John Smith'
),
(
    'The Adventures of Grekk',
    'Jane Doe'
);

INSERT INTO Characters (
    player, 
    name, 
    race, 
    class, 
    npc
)
VALUES (
    'Skyler Santos', 
    'Draz Len', 
    'Half Orc', 
    'Ranger', 
    FALSE
),
(
    'Julia Fay',
    'Otto',
    'Kobold',
    'Monk',
    FALSE
),
(
    NULL,
    'Nob',
    'Gnome',
    'Warlock',
    TRUE
);

INSERT INTO Sessions (
    caid, 
    date, 
    summary  
)
VALUES (
    (SELECT id FROM Campaigns WHERE title='The Quest for the Data Artifact within the Eldritch Base'), 
    '2024-02-10', 
    'The party begins their journey towards the Mystic Mountains'
),
(
    (SELECT id FROM Campaigns WHERE title='Where the Nerdy Things Are'),
    '2024-01-05',
    'The party wakes up on a desert island.'
),
(
    (SELECT id FROM Campaigns WHERE title='Where the Nerdy Things Are'),
    '2024-01-09',
    'The party fights a hill giant.'
);

INSERT INTO campaign_character (
    caid, 
    chid, 
    join_date, 
    role
) 
VALUES (
    (SELECT id FROM Campaigns WHERE title='The Quest for the Data Artifact within the Eldritch Base'), 
    (SELECT id FROM Characters WHERE name='Draz Len'), 
    '2024-02-10', 
    'Tank'
),
(
    (SELECT id FROM Campaigns WHERE title='Where the Nerdy Things Are'),
    (SELECT id FROM Characters WHERE name='Otto'),
    '2024-01-05',
    NULL
),
(
    (SELECT id FROM Campaigns WHERE title='Where the Nerdy Things Are'),
    (SELECT id FROM Characters WHERE name='Nob'),
    '2024-01-09',
    NULL
);

INSERT INTO character_session (
    chid, 
    sid
)
VALUES (
    (SELECT id from Characters WHERE name='Draz Len'), 
    (SELECT id from Sessions WHERE date='2024-02-10')
),
(
    (SELECT id from Characters WHERE name='Otto'),
    (SELECT id from Sessions WHERE date='2024-01-05')
),
(
    (SELECT id from Characters WHERE name='Otto'),
    (SELECT id from Sessions WHERE date='2024-01-09')
),
(
    (SELECT id FROM Characters WHERE name='Nob'),
    (SELECT id from Sessions WHERE date='2024-01-09')
);

INSERT INTO Quests (
    caid, 
    completed, 
    description, 
    title
)
VALUES (
    (SELECT id FROM Campaigns WHERE title='The Quest for the Data Artifact within the Eldritch Base'), 
    FALSE, 
    'Journey to the Mystic Mountains, abandon all hope', 
    'Journey to the Mystic Mountains'
),
(
    (SELECT id FROM Campaigns WHERE title='Where the Nerdy Things Are'),
    TRUE,
    'Find a way to get off the island and return home',
    'Journey Home'
),
(
    (SELECT id FROM Campaigns WHERE title='Where the Nerdy Things Are'),
    FALSE,
    'Defeat the hill giant that is terrorizing the town',
    'A Giant Problem'
);

INSERT INTO Items (
    name, 
    description, 
    rarity
)
VALUES (
    'Sword of the Slayer', 
    'A mysterious sword that glows with an inner light', 
    'Rare'
),
(
    'Quarterstaff',
    'Deals 1d6 damage',
    'Common'
),
(
    'Necklace',
    'Looks pretty, worth 10 gp',
    'Common'
);

INSERT INTO character_item (
    chid, 
    iid, 
    quantity, 
    acquisition_date
)
VALUES (
    (SELECT id from Characters WHERE name='Draz Len'), 
    (SELECT id from Items WHERE name='Sword of the Slayer'), 
    1, 
    '2024-02-10'
),
(
    (SELECT id from Characters WHERE name='Otto'),
    (SELECT id from Items WHERE name='Quarterstaff'),
    1,
    NULL
),
(
    (SELECT id from Characters WHERE name='Otto'),
    (SELECT id from Items WHERE name='Necklace'),
    1,
    '2024-01-09'
);
