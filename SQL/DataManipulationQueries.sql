

"Characters Table"
-- retrieve all characters
SELECT id, player, name, race, class, npc FROM Characters;

--retrieve single character
SELECT id, player, name, race, class, npc FROM Characters WHERE id = :character_id;

--add new character
INSERT INTO Characters (player, name, race, class, npc) VALUES (:playerInput, :nameInput, :raceInput, :classInput, :npcInput);

--update character
UPDATE Characters SET player = :playerInput, name = :nameInput, race = :raceInput, class = :classInput, npc = :npcInput WHERE id = :character_id;

--delete character
UPDATE Characters SET player = :playerInput, name = :nameInput, race = :raceInput, class = :classInput, npc = :npcInput WHERE id = :character_id;


"Campaigns Table"
-- retrieve all campaigns
SELECT id, title, dungeon_master FROM Campaigns;

-- retrieve single campaign
SELECT id, title, dungeon_master FROM Campaigns WHERE id = :campaign_id;

-- add new campaign
INSERT INTO Campaigns (title, dungeon_master) VALUES (:titleInput, :dungeonMasterInput);

-- update campaign
UPDATE Campaigns SET title = :titleInput, dungeon_master = :dungeonMasterInput WHERE id = :campaign_id;

-- delete campaign
DELETE FROM Campaigns WHERE id = :campaign_id;

"Sessions Table"

-- retrieve all sessions
SELECT id, caid, date, summary FROM Sessions;

-- retrieve single session
SELECT id, caid, date, summary FROM Sessions WHERE id = :session_id;

-- add new session
INSERT INTO Sessions (caid, date, summary) VALUES (:caidInput, :dateInput, :summaryInput);

-- update session
UPDATE Sessions SET caid = :caidInput, date = :dateInput, summary = :summaryInput WHERE id = :session_id;

-- delete session
DELETE FROM Sessions WHERE id = :session_id;

"Campaign_Character"
-- retrieve all campaign-character links
SELECT caid, chid, join_date, role FROM campaign_character;

-- retrieve single campaign-character link
SELECT caid, chid, join_date, role FROM campaign_character WHERE caid = :caid AND chid = :chid;

-- add new campaign-character link
INSERT INTO campaign_character (caid, chid, join_date, role) VALUES (:caidInput, :chidInput, :joinDateInput, :roleInput);

-- update campaign-character link
UPDATE campaign_character SET join_date = :joinDateInput, role = :roleInput WHERE caid = :caid AND chid = :chid;

-- delete campaign-character link
DELETE FROM campaign_character WHERE caid = :caid AND chid = :chid;

"Character_session"
-- retrieve all character-session links
SELECT chid, sid FROM character_session;

-- retrieve single character-session link
SELECT chid, sid FROM character_session WHERE chid = :chid AND sid = :sid;

-- add new character-session link
INSERT INTO character_session (chid, sid) VALUES (:chidInput, :sidInput);

-- delete character-session link
DELETE FROM character_session WHERE chid = :chid AND sid = :sid;

"Quests"
-- retrieve all quests
SELECT id, caid, completed, description, title FROM Quests;

-- retrieve single quest
SELECT id, caid, completed, description, title FROM Quests WHERE id = :quest_id;

-- add new quest
INSERT INTO Quests (caid, completed, description, title) VALUES (:caidInput, :completedInput, :descriptionInput, :titleInput);

-- update quest
UPDATE Quests SET caid = :caidInput, completed = :completedInput, description = :descriptionInput, title = :titleInput WHERE id = :quest_id;

-- delete quest
DELETE FROM Quests WHERE id = :quest_id;

"Items"
-- retrieve all items
SELECT id, name, description, rarity FROM Items;

-- retrieve single item
SELECT id, name, description, rarity FROM Items WHERE id = :item_id;

-- add new item
INSERT INTO Items (name, description, rarity) VALUES (:nameInput, :descriptionInput, :rarityInput);

-- update item
UPDATE Items SET name = :nameInput, description = :descriptionInput, rarity = :rarityInput WHERE id = :item_id;

-- delete item
DELETE FROM Items WHERE id = :item_id;

"Character_Item"
-- retrieve all character-item links
SELECT chid, iid, quantity, acquisition_date FROM character_item;

-- retrieve single character-item link
SELECT chid, iid, quantity, acquisition_date FROM character_item WHERE chid = :chid AND iid = :iid;

-- add new character-item link
INSERT INTO character_item (chid, iid, quantity, acquisition_date) VALUES (:chidInput, :iidInput, :quantityInput, :acquisitionDateInput);

-- update character-item link
UPDATE character_item SET quantity = :quantityInput, acquisition_date = :acquisitionDateInput WHERE chid = :chid AND iid = :iid;

-- delete character-item link
DELETE FROM character_item WHERE chid = :chid AND iid = :iid;
