CREATE SCHEMA IF NOT exists dms_sample;

SET search_path TO dms_sample;

-- dms_sample.mlb_data definition

-- Drop table

-- DROP TABLE dms_sample.mlb_data;

CREATE TABLE IF NOT EXISTS dms_sample.mlb_data (
	mlb_id float8 NULL,
	mlb_name varchar(30) NULL,
	mlb_pos varchar(30) NULL,
	mlb_team varchar(30) NULL,
	mlb_team_long varchar(30) NULL,
	bats varchar(30) NULL,
	throws varchar(30) NULL,
	birth_year varchar(30) NULL,
	bp_id float8 NULL,
	bref_id varchar(30) NULL,
	bref_name varchar(30) NULL,
	cbs_id varchar(30) NULL,
	cbs_name varchar(30) NULL,
	cbs_pos varchar(30) NULL,
	espn_id float8 NULL,
	espn_name varchar(30) NULL,
	espn_pos varchar(30) NULL,
	fg_id varchar(30) NULL,
	fg_name varchar(30) NULL,
	lahman_id varchar(30) NULL,
	nfbc_id float8 NULL,
	nfbc_name varchar(30) NULL,
	nfbc_pos varchar(30) NULL,
	retro_id varchar(30) NULL,
	retro_name varchar(30) NULL,
	debut varchar(30) NULL,
	yahoo_id float8 NULL,
	yahoo_name varchar(30) NULL,
	yahoo_pos varchar(30) NULL,
	mlb_depth varchar(30) NULL
);

-- dms_sample.name_data definition

-- Drop table

-- DROP TABLE dms_sample.name_data;

CREATE TABLE IF NOT EXISTS dms_sample.name_data (
	name_type varchar(15) NOT NULL,
	"name" varchar(45) NOT NULL,
	CONSTRAINT name_data_pk PRIMARY KEY (name_type, name)
);

-- dms_sample.nfl_data definition

-- Drop table

-- DROP TABLE dms_sample.nfl_data;

CREATE TABLE IF NOT EXISTS dms_sample.nfl_data (
	"position" varchar(5) NULL,
	player_number numeric(3) NULL,
	"name" varchar(40) NULL,
	status varchar(10) NULL,
	stat1 varchar(10) NULL,
	stat1_val varchar(10) NULL,
	stat2 varchar(10) NULL,
	stat2_val varchar(10) NULL,
	stat3 varchar(10) NULL,
	stat3_val varchar(10) NULL,
	stat4 varchar(10) NULL,
	stat4_val varchar(10) NULL,
	team varchar(10) NULL
);

-- dms_sample.nfl_stadium_data definition

-- Drop table

-- DROP TABLE dms_sample.nfl_stadium_data;

CREATE TABLE IF NOT EXISTS dms_sample.nfl_stadium_data (
	stadium varchar(60) NULL,
	seating_capacity float8 NULL,
	"location" varchar(40) NULL,
	surface varchar(80) NULL,
	roof varchar(30) NULL,
	team varchar(40) NULL,
	opened varchar(10) NULL,
	sport_location_id float8 NULL
);

-- dms_sample.person definition

-- Drop table

-- DROP TABLE dms_sample.person;

CREATE TABLE IF NOT EXISTS dms_sample.person (
	id float8 NOT NULL,
	full_name varchar(60) NOT NULL,
	last_name varchar(30) NULL,
	first_name varchar(30) NULL,
	CONSTRAINT person_pk PRIMARY KEY (id)
);

-- dms_sample.player definition

-- Drop table

-- DROP TABLE dms_sample.player;

CREATE TABLE IF NOT EXISTS dms_sample.player (
	id float8 NOT NULL,
	sport_team_id float8 NOT NULL,
	last_name varchar(30) NULL,
	first_name varchar(30) NULL,
	full_name varchar(30) NULL,
	CONSTRAINT player_pk PRIMARY KEY (id)
);

-- dms_sample.seat definition

-- Drop table

-- DROP TABLE dms_sample.seat;

CREATE TABLE IF NOT EXISTS dms_sample.seat (
	sport_location_id float8 NOT NULL,
	seat_level numeric(1) NOT NULL,
	seat_section varchar(15) NOT NULL,
	seat_row varchar(10) NOT NULL,
	seat varchar(10) NOT NULL,
	seat_type varchar(15) NULL
);
CREATE INDEX seat_sport_location_idx ON dms_sample.seat USING btree (sport_location_id);

-- dms_sample.seat_type definition

-- Drop table

-- DROP TABLE dms_sample.seat_type;

CREATE TABLE IF NOT EXISTS dms_sample.seat_type (
	"name" varchar(15) NOT NULL,
	description varchar(120) NULL,
	relative_quality numeric(2) NULL,
	CONSTRAINT st_seat_type_pk PRIMARY KEY (name)
);

-- dms_sample.sport_division definition

-- Drop table

-- DROP TABLE dms_sample.sport_division;

CREATE TABLE IF NOT EXISTS dms_sample.sport_division (
	sport_type_name varchar(15) NOT NULL,
	sport_league_short_name varchar(10) NOT NULL,
	short_name varchar(10) NOT NULL,
	long_name varchar(60) NULL,
	description varchar(120) NULL,
	CONSTRAINT sport_division_pk PRIMARY KEY (sport_type_name, sport_league_short_name, short_name)
);

-- dms_sample.sport_league definition

-- Drop table

-- DROP TABLE dms_sample.sport_league;

CREATE TABLE IF NOT EXISTS dms_sample.sport_league (
	sport_type_name varchar(15) NOT NULL,
	short_name varchar(10) NOT NULL,
	long_name varchar(60) NOT NULL,
	description varchar(120) NULL,
	CONSTRAINT sport_league_pk PRIMARY KEY (short_name)
);

-- dms_sample.sport_location definition

-- Drop table

-- DROP TABLE dms_sample.sport_location;

CREATE TABLE IF NOT EXISTS dms_sample.sport_location (
	id numeric(3) NOT NULL,
	"name" varchar(60) NOT NULL,
	city varchar(60) NOT NULL,
	seating_capacity numeric(7) NULL,
	levels numeric(1) NULL,
	sections numeric(4) NULL,
	CONSTRAINT sport_location_pk PRIMARY KEY (id)
);

-- dms_sample.sport_team definition

-- Drop table

-- DROP TABLE dms_sample.sport_team;

CREATE TABLE IF NOT EXISTS dms_sample.sport_team (
	id float8 NOT NULL,
	"name" varchar(30) NOT NULL,
	abbreviated_name varchar(10) NULL,
	home_field_id numeric(3) NULL,
	sport_type_name varchar(15) NOT NULL,
	sport_league_short_name varchar(10) NOT NULL,
	sport_division_short_name varchar(10) NULL,
	CONSTRAINT sport_team_pk PRIMARY KEY (id)
);
CREATE UNIQUE INDEX sport_team_u ON dms_sample.sport_team USING btree (sport_type_name, sport_league_short_name, name);

-- dms_sample.sport_type definition

-- Drop table

-- DROP TABLE dms_sample.sport_type;

CREATE TABLE IF NOT EXISTS dms_sample.sport_type (
	"name" varchar(15) NOT NULL,
	description varchar(120) NULL,
	CONSTRAINT sport_type_pk PRIMARY KEY (name)
);

-- dms_sample.sporting_event definition

-- Drop table

-- DROP TABLE dms_sample.sporting_event;

CREATE TABLE IF NOT EXISTS dms_sample.sporting_event (
	id int8 NOT NULL,
	sport_type_name varchar(15) NOT NULL,
	home_team_id int4 NOT NULL,
	away_team_id int4 NOT NULL,
	location_id int2 NOT NULL,
	start_date_time timestamp NOT NULL,
	start_date date NOT NULL,
	sold_out int2 NOT NULL DEFAULT 0,
	CONSTRAINT chk_sold_out CHECK ((sold_out = ANY (ARRAY[0, 1]))),
	CONSTRAINT sporting_event_pk PRIMARY KEY (id)
);
CREATE INDEX se_start_date_fcn ON dms_sample.sporting_event USING btree (date(start_date_time));

-- dms_sample.sporting_event_ticket definition

-- Drop table

-- DROP TABLE dms_sample.sporting_event_ticket;

CREATE TABLE IF NOT EXISTS dms_sample.sporting_event_ticket (
	id float8 NOT NULL,
	sporting_event_id float8 NOT NULL,
	sport_location_id float8 NOT NULL,
	seat_level numeric(1) NOT NULL,
	seat_section varchar(15) NOT NULL,
	seat_row varchar(10) NOT NULL,
	seat varchar(10) NOT NULL,
	ticketholder_id float8 NULL,
	ticket_price numeric(8, 2) NOT NULL,
	CONSTRAINT sporting_event_ticket_pk PRIMARY KEY (id)
);
CREATE INDEX set_ev_id_tkholder_id_idx ON dms_sample.sporting_event_ticket USING btree (sporting_event_id, ticketholder_id);
CREATE INDEX set_seat_idx ON dms_sample.sporting_event_ticket USING btree (sport_location_id, seat_level, seat_section, seat_row, seat);
CREATE INDEX set_sporting_event_idx ON dms_sample.sporting_event_ticket USING btree (sporting_event_id);
CREATE INDEX set_ticketholder_idx ON dms_sample.sporting_event_ticket USING btree (ticketholder_id);

-- dms_sample.ticket_purchase_hist definition

-- Drop table

-- DROP TABLE dms_sample.ticket_purchase_hist;

CREATE TABLE IF NOT EXISTS dms_sample.ticket_purchase_hist (
	sporting_event_ticket_id float8 NOT NULL,
	purchased_by_id float8 NOT NULL,
	transaction_date_time timestamp(0) NOT NULL,
	transferred_from_id float8 NULL,
	purchase_price numeric(8, 2) NOT NULL,
	CONSTRAINT ticket_purchase_hist_pk PRIMARY KEY (sporting_event_ticket_id, purchased_by_id, transaction_date_time)
);
CREATE INDEX tph_purch_by_id ON dms_sample.ticket_purchase_hist USING btree (purchased_by_id);
CREATE INDEX tph_trans_from_id ON dms_sample.ticket_purchase_hist USING btree (transferred_from_id);