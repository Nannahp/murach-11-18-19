-- ------------------------ kapitel 12 -----------
-- opg 1
CREATE INDEX vendors_zip_code_index on vendors (vendor_zip_code);

-- opg 2
USE EX;
DROP TABLE IF EXISTS members;
DROP TABLE IF EXISTS members_groups;
DROP TABLE IF EXISTS committees;

CREATE  TABLE members
(
	member_id		INT 		PRIMARY KEY	 	AUTO_INCREMENT,
    first_name	 	VARCHAR(20)	NOT NULL,	
    last_name 		VARCHAR(20)	NOT NULL,
    address	  		VARCHAR(20)	NOT NULL,
    city			VARCHAR(20)	NOT NULL,
    state			VARCHAR(20)	NOT NULL,
    phone	INT									default 0
);

CREATE TABLE members_committees
(
member_id	INT	NOT NULL,
committee_id	INT	NOT NULL,
CONSTRAINT members_committees_fk_members
			FOREIGN KEY (member_id)
            REFERENCES members (member_id),
CONSTRAINT members_committes_fk_committees	
			FOREIGN KEY (committee_id)
			REFERENCES committees (committee_id)
);

CREATE TABLE committees
(
committee_id	INT	PRIMARY KEY	AUTO_INCREMENT,
committee_name	VARCHAR(15)	NOT NULL
);

-- opg 3
INSERT INTO members
values(DEFAULT, 'blob','guru','nonofyourbusiness','itsasecret','idk',111222333), 
	(DEFAULT, 'Stan','Stanley', 'paradox street', 'Steam','PC',444555666);

INSERT INTO committees
VALUES(DEFAULT,'white lotus'),(DEFAULT, 'WC');

INSERT INTO members_committees
VALUES(1,2),(2,1),(2,2);

SELECT c.committee_name, m.first_name, m.last_name 
FROM members m
JOIN members_committees mc on m.member_id = mc.member_id
JOIN committees c on mc.committee_id = c.committee_id
ORDER BY committee_name, first_name, last_name;

-- opg 4
ALTER TABLE members
ADD anual_due DECIMAL(5,2) DEFAULT 52.50,
ADD payment_date	DATE DEFAULT NULL;

-- opg 5

ALTER TABLE committees
ADD CONSTRAINT unique_committee_name UNIQUE (committee_name);

INSERT INTO committees
values(DEFAULT, 'niiiiiiice'),(DEFAULT, 'niiiiiiice');

