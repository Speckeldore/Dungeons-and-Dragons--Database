Julia Fay
Skyler Santos
D&D Campaign Manager
Actions Based on the Feedback
We did not receive any critical feedback from the peer reviewers. We did, however, receive
feedback from our TA who recommended that we reduce the number of tables. We did so
accordingly as detailed in the next section.
Upgrades to the Draft Version
Our TA recommended that we reduce the number of tables, so we decided to eliminate
Encounters and Monsters as separate tables. Based on our own experiences with playing DnD,
we concluded that these entities are less essential for keeping track of a campaign. Instead,
encounters and the monsters involved will be recorded as attributes of Sessions. We also added
a relationship between Characters and Sessions (M:M).
Overview
A database driven website will assist with campaign management for games of Dungeons and
Dragons. Campaigns can be as short as a single session, or last for years.
As of 2023, Dungeons and Dragons has captivated over 50 million players globally. DnD was
first launched in 1974, has experienced substantial growth, especially with various online
versions. This immense and diverse player base demonstrates the need for a sophisticated
database-driven website to manage the intricate aspects of DnD campaigns, characters, quests,
items, and more.
DnD serves as the framework that many role playing-games use to this day to craft memorable
worlds and experiences. Our database serves as a scalable and adaptable platform for
organizing these RPG elements. Whether used as a starter template for the broader RPG
ecosystem or for individuals organizing their DnD sessions with friends, this database will serve
as a robust foundation for either scenario.
Database Outline
● Campaigns: Series of adventures that characters embark upon. They serve as an
overarching narrative where sessions are played and quests occur. They also link to
various characters participating in the campaign. Campaigns are run by a dungeon
master who tells the story.
○ id: int, unique, not NULL, PK
○ title: varchar
○ dungeon_master: varchar
○ Relationship: a 1:M relationship between Campaigns and Quests
○ Relationship: a 1:M relationship between Campaigns and Sessions
○ Relationship: an M:M relationship between Campaigns and Characters
● Characters: This serves as the players ‘avatar’ that the player will use to interact with
the world: campaign story elements, encounters, and the items at their disposal.
Characters can also be NPC’s controlled by the dungeon master.
○ id: int, unique, not NULL, PK
○ name: varchar
○ player: varchar
○ race: varchar
○ class: varchar
○ npc: boolean
○ Relationship: an M:M relationship between Characters and Items
○ Relationship: an M:M relationship between Characters and Sessions
○ Relationship: an M:M relationship between Characters and Campaigns
● Quests: These serve as specific adventures or challenges that exist within a given
campaign.
○ id: int, unique, not NULL, PK
○ cid: int, FK
○ description: text
○ complete: boolean
○ Relationship: an M:1 relationship between Quests and Campaigns
● Items: This entity represents discoverables that the player can earn, find and use
throughout their adventures. Items vary in terms of function and significantly impact the
game as a whole.
○ id: int, unique, not NULL, PK
○ name: varchar
○ rarity: varchar
○ description: text
○ Relationship: an M:M relationship between Items and Characters
● Sessions: When players sit down to actually play the game, they engage in a session
that starts when they start playing and ends when they conclude that session. This is an
individual play session and key to progressing the campaign.
○ id: int, unique, not NULL, PK
○ date: date
○ summary: text
○ Relationship: an M:M relationship between Sessions and Characters
○ Relationship: an M:M relationship between Sessions and Campaigns
● Campaign_Character: Intersection table for the characters that are progressing through
different campaigns
○ Caid(campaign id): int FK
○ Chid(Character Id): int FK
○ join_date: date
○ role: varchar
○ Primary Key (caid, chid)
○ Relationship: Handles the M:N of campaigns to characters
● Character_session: Intersection table for the characters that are progressing through
different campaigns
○ chid(character id): int FK
○ sid(session id): int FK
○ Primary Key(chid, sid)
○ Relationship: Handles the M:N of sessions to characters
● Character_item: Intersection table for the characters that are progressing through
different campaigns
○ chid(Character id): int FK
○ iid(item id): int FK
○ Quantity: int, NOT NULL
○ Primary Key(chid,sid)
○ Relationship: Handles the M:N of items to characters
Entity Relationship Diagram
Schema
Example Data
Campaigns:
Characters:
Sessions:
Quests:
Items:
campaign_character:
character_item:
character_session
