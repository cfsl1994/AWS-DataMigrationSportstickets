-- Load data into mlb_data table
COPY dms_sample.mlb_data FROM '/content/mlb_data_202311071148.csv' WITH CSV HEADER DELIMITER ',';

-- Load data into name_data table
COPY dms_sample.name_data FROM '/content/name_data_202311071150.csv' WITH CSV HEADER DELIMITER ',';

-- Load data into nfl_data table
COPY dms_sample.nfl_data FROM '/content/nfl_data_202311071151.csv' WITH CSV HEADER DELIMITER ',';

-- Load data into nfl_stadium_data table
COPY dms_sample.nfl_stadium_data FROM '/content/nfl_stadium_data_202311071152.csv' WITH CSV HEADER DELIMITER ',';

-- Load data into person table
-- COPY dms_sample.person FROM '/content/person_202311071152.csv' WITH CSV HEADER DELIMITER ',';

-- Load data into player table
COPY dms_sample.player FROM '/content/player_202311071155.csv' WITH CSV HEADER DELIMITER ',';

-- Load data into seat table
-- COPY dms_sample.seat FROM '/content/seat_202311071155.csv' WITH CSV HEADER DELIMITER ',';

-- Load data into seat_type table
COPY dms_sample.seat_type FROM '/content/seat_type_202311071155.csv' WITH CSV HEADER DELIMITER ',';

-- Load data into sport_division table
COPY dms_sample.sport_division FROM '/content/sport_division_202311071156.csv' WITH CSV HEADER DELIMITER ',';

-- Load data into sport_league table
COPY dms_sample.sport_league FROM '/content/sport_league_202311071156.csv' WITH CSV HEADER DELIMITER ',';

-- Load data into sport_location table
COPY dms_sample.sport_location FROM '/content/sport_location_202311071156.csv' WITH CSV HEADER DELIMITER ',';

-- Load data into sport_team table
COPY dms_sample.sport_team FROM '/content/sport_team_202311071157.csv' WITH CSV HEADER DELIMITER ',';

-- Load data into sport_type table
COPY dms_sample.sport_type FROM '/content/sport_type_202311071157.csv' WITH CSV HEADER DELIMITER ',';

-- Load data into sporting_event table
COPY dms_sample.sporting_event FROM '/content/sporting_event_202311071157.csv' WITH CSV HEADER DELIMITER ',';

-- Load data into sporting_event_ticket table
-- COPY dms_sample.sporting_event_ticket FROM '/content/sporting_event_ticket_202311071157.csv' WITH CSV HEADER DELIMITER ',';

-- Load data into ticket_purchase_hist table
-- COPY dms_sample.ticket_purchase_hist FROM '/content/ticket_purchase_hist_202311071202.csv' WITH CSV HEADER DELIMITER ',';
