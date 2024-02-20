-- Creates the Campaigns table with id, title, and dungeon_master attributes
CREATE TABLE Campaigns (
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    dungeon_master VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

-- Creates the Characters table with id, player, name, race, class, and npc attributes
CREATE TABLE Characters (
    id INT NOT NULL AUTO_INCREMENT,
    player VARCHAR(255),
    name VARCHAR(255) NOT NULL,
    race VARCHAR(255),
    class VARCHAR(255),
    npc BOOLEAN,
    PRIMARY KEY(id)
);

-- Creates the Sessions table with id, campaign ID (caid), date, and summary attributes
CREATE TABLE Sessions (
    id INT NOT NULL AUTO_INCREMENT,
    caid INT,
    date DATE NOT NULL,
    summary TEXT NOT NULL,
    FOREIGN KEY (caid) REFERENCES Campaigns(id),
    PRIMARY KEY(id)
);

-- Creates the campaign_character table to establish a many-to-many relationship between Campaigns and Characters
CREATE TABLE campaign_character (
    caid INT,
    chid INT,
    join_date DATE,
    role VARCHAR(255),
    PRIMARY KEY (caid, chid),
    FOREIGN KEY (caid) REFERENCES Campaigns(id),
    FOREIGN KEY (chid) REFERENCES Characters(id)
);

-- Creates the character_session table to track which characters participate in which sessions
CREATE TABLE character_session (
    chid INT,
    sid INT,
    PRIMARY KEY (chid, sid),
    FOREIGN KEY (chid) REFERENCES Characters(id),
    FOREIGN KEY (sid) REFERENCES Sessions(id)
);

-- Creates the Quests table with id, campaign ID (caid), completion status, description, and title attributes
CREATE TABLE Quests (
    id INT NOT NULL AUTO_INCREMENT,
    caid INT NOT NULL,
    completed BOOLEAN,
    description TEXT NOT NULL,
    title VARCHAR(255) NOT NULL,
    FOREIGN KEY (caid) REFERENCES Campaigns(id),
    PRIMARY KEY(id)
);

-- Creates the Items table with id, name, description, and rarity attributes
CREATE TABLE Items (
    id INT NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    rarity VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
);

-- Creates the character_item table to manage the inventory of items held by characters
CREATE TABLE character_item (
    chid INT,
    iid INT,
    quantity INT NOT NULL,
    acquisition_date DATE,
    PRIMARY KEY (chid, iid),
    FOREIGN KEY (chid) REFERENCES Characters(id),
    FOREIGN KEY (iid) REFERENCES Items(id)
);




