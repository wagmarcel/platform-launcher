-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
--
--   http://www.apache.org/licenses/LICENSE-2.0
--
-- Unless required by applicable law or agreed to in writing,
-- software distributed under the License is distributed on an
-- "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
-- KIND, either express or implied.  See the License for the
-- specific language governing permissions and limitations
-- under the License.

-- company
insert into company (id, version, description, image_key, name, type) values (1, 0, 'Industry Business Network 4.0 e.V.', 'ibn_logo.png', 'Industry Business Network 4.0', 'ECOSYSTEM_MANAGER');
insert into company (id, version, description, image_key, name, type) values (2, 0, 'IBN 4.0 Smart Factory', 'ibn_logo.png', 'IBN 4.0 Smart Factory', 'MACHINE_CUSTOMER');
insert into company (id, version, description, image_key, name, type) values (3, 0, 'MicroStep Europa GmbH', 'microstep_logo.png', 'MicroStep', 'MACHINE_MANUFACTURER');
insert into company (id, version, description, image_key, name, type) values (4, 0, 'TEKA Absaug- und Entsorgungstechnologie GmbH', 'teka_logo.png', 'TEKA', 'MACHINE_MANUFACTURER');
insert into company (id, version, description, image_key, name, type) values (5, 0, 'IBEDA Sicherheitsgeräte und Gastechnik GmbH & Co. KG', 'ibeda_logo.png', 'Ibeda', 'MACHINE_MANUFACTURER');
insert into company (id, version, description, image_key, name, type) values (6, 0, 'ARKU Maschinenbau GmbH', 'arku_logo.png', 'Arku', 'MACHINE_MANUFACTURER');
insert into company (id, version, description, image_key, name, type) values (7, 0, 'Beuting Metalltechnik GmbH & Co. KG', 'beuting_logo.png', 'Beuting', 'MACHINE_MANUFACTURER');
insert into company (id, version, description, image_key, name, type) values (8, 0, 'Eckert AS Sp. z o. o.', 'eckert_logo.png', 'Eckert', 'MACHINE_MANUFACTURER');
insert into company (id, version, description, image_key, name, type) values (9, 0, 'Kjellberg Finsterwalde Plasma und Maschinen GmbH', 'kjellberg_logo.png', 'Kjellberg', 'MACHINE_MANUFACTURER');
insert into company (id, version, description, image_key, name, type) values (10, 0, 'Novus air GmbH', 'novus_logo.png', 'Novus', 'MACHINE_MANUFACTURER');
insert into company (id, version, description, image_key, name, type) values (11, 0, 'Rösler Oberflächentechnik GmbH', 'roesler_logo.png', 'Rösler', 'MACHINE_MANUFACTURER');
insert into company (id, version, description, image_key, name, type) values (12, 0, 'LISSMAC Maschinenbau GmbH', 'lissmac_logo.png', 'Lissmac', 'MACHINE_MANUFACTURER');
-- location
insert into location (id, version, city, country, image_key, latitude, line1, line2, longitude, name, type, zip, company_id) values (1, 0, 'Bad Wörishofen', 'Germany', 'ibn_standort_1.jpg', 48.019610, 'Rudolf-Diesel-Straße 16', '', 10.603630, 'MicroStep - CompetenceCenter Süd', 'HEADQUARTER', '86825', 2);
insert into location (id, version, city, country, image_key, latitude, line1, line2, longitude, name, type, zip, company_id) values (2, 0, 'Dorsten', 'Germany', 'microstep_standort_1.jpg', 51.677480, 'Wenger Höfe 27', '', 6.997910, 'MicroStep - CompetenceCenter Nord', 'FABRICATION', '46284', 2);
insert into location (id, version, city, country, image_key, latitude, line1, line2, longitude, name, type, zip, company_id) values (3, 0, 'Baden-Baden', 'Germany', 'arku_standort_1.jpg', 48.811990, 'Siemensstrasse 11', '', 8.218150, 'Arku - Smart Factory', 'FABRICATION', '76532', 2);
insert into location (id, version, city, country, image_key, latitude, line1, line2, longitude, name, type, zip, company_id) values (4, 0, 'Goldach', 'Switzerland', 'stuermsfs_standort_1.jpg', 47.482330, 'Langrütistrasse 20', '', 9.476290, 'Stürmsfs - Smart Factory', 'FABRICATION', '9403', 2);
insert into location (id, version, city, country, image_key, latitude, line1, line2, longitude, name, type, zip, company_id) values (5, 0, 'Neustadt (Wied)', 'Germany', 'ibeda_standort_1.jpg', 50.625092, 'Bahnhofstraße 27', '', 7.433166, 'Ibeda - Smart Factory', 'FABRICATION', '53577', 2);
insert into location (id, version, city, country, image_key, latitude, line1, line2, longitude, name, type, zip, company_id) values (6, 0, 'Velen', 'Germany', 'teka_standort_1.jpg', 51.895374, 'Industriestraße 13', '', 6.997759, 'Teka - Smart Factory', 'FABRICATION', '46342', 2);
insert into location (id, version, city, country, image_key, latitude, line1, line2, longitude, name, type, zip, company_id) values (7, 0, 'Legnica', 'Poland', 'eckert_standort_1.jpg', 51.231556, 'Pawicka 4C', '', 16.200273, 'Eckert - Smart Factory', 'FABRICATION', '59-220', 2);
insert into location (id, version, city, country, image_key, latitude, line1, line2, longitude, name, type, zip, company_id) values (8, 0, 'Finsterwalde', 'Germany', 'kjellberg_standort_1.jpg', 51.627571, 'Oscar-Kjellberg-Straße 20', '', 13.705277, 'Kjellberg - Smart Factory', 'FABRICATION', '03238', 2);
insert into location (id, version, city, country, image_key, latitude, line1, line2, longitude, name, type, zip, company_id) values (9, 0, 'Weinböhla', 'Germany', 'novus_standort_1.jpg', 51.159980, 'Zaschendorfer Weg 1', '', 13.562264, 'Novus - Smart Factory', 'FABRICATION', '01689', 2);
insert into location (id, version, city, country, image_key, latitude, line1, line2, longitude, name, type, zip, company_id) values (10, 0, 'Untermerzbach', 'Germany', 'roesler_standort_1.jpg', 50.141405, 'Vorstadt 1', '', 10.853232, 'Rösler - Smart Factory', 'FABRICATION', '96190', 2);
-- room
insert into room (id, version, image_key, name, description, location_id) values (1, 0, null, 'Showroom', 'Showroom', 1);
insert into room (id, version, image_key, name, description, location_id) values (2, 0, null, 'Technikraum', 'Technikraum', 1);
insert into room (id, version, image_key, name, description, location_id) values (3, 0, null, 'Showroom', 'Showroom', 2);
insert into room (id, version, image_key, name, description, location_id) values (4, 0, null, 'Showroom', 'Showroom', 3);
insert into room (id, version, image_key, name, description, location_id) values (5, 0, null, 'Halle 3 Brennbetrieb', 'Halle 3 Brennbetrieb', 4);
insert into room (id, version, image_key, name, description, location_id) values (6, 0, null, 'Showroom', 'Showroom', 5);
insert into room (id, version, image_key, name, description, location_id) values (7, 0, null, 'Showroom', 'Showroom', 6);
insert into room (id, version, image_key, name, description, location_id) values (8, 0, null, 'Showroom', 'Showroom', 7);
insert into room (id, version, image_key, name, description, location_id) values (9, 0, null, 'Showroom', 'Showroom', 8);
insert into room (id, version, image_key, name, description, location_id) values (10, 0, null, 'Showroom', 'Showroom', 9);
insert into room (id, version, image_key, name, description, location_id) values (11, 0, null, 'Showroom', 'Showroom', 10);
-- quantity_type
insert into quantity_type (id, version, description, label, name, data_type) values (1, 0, 'Duration Quantity', 'duration', 'Duration', 1);
insert into quantity_type (id, version, description, label, name, data_type) values (2, 0, 'Length Quantity', 'length', 'Length', 0);
insert into quantity_type (id, version, description, label, name, data_type) values (3, 0, 'Text', 'text', 'Text', 0);
insert into quantity_type (id, version, description, label, name, data_type) values (4, 0, 'Pressure Quantity', 'pressure', 'Pressure', 1);
insert into quantity_type (id, version, description, label, name, data_type) values (5, 0, 'Airflow Quantity', 'airflow', 'Airflow', 1);
insert into quantity_type (id, version, description, label, name, data_type) values (6, 0, 'Electrical Current Quantity', 'electric_current', 'Electric Current', 1);
insert into quantity_type (id, version, description, label, name, data_type) values (7, 0, 'Relative Humidity Quantity', 'relative_humidity', 'Relative Humidity', 1);
insert into quantity_type (id, version, description, label, name, data_type) values (8, 0, 'Noise Quantity', 'noise', 'Noise', 1);
insert into quantity_type (id, version, description, label, name, data_type) values (9, 0, 'Particle Density Quantity', 'particle_density', 'Particle Density', 1);
insert into quantity_type (id, version, description, label, name, data_type) values (10, 0, 'Temperature Quantity', 'temperature', 'Temperature', 1);
-- unit
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (1, 0, 'Duration: Seconds', 'seconds', 'Seconds', 's', 1);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (2, 0, 'Duration: Years', 'years', 'Years', 'y', 1);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (4, 0, 'Text', 'text', 'Text', '', 3);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (5, 0, 'Duration Hours', 'hours', 'Hours', 'h', 1);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (3, 0, 'Length: Millimeter', 'mm', 'Millimeter', 'mm', 2);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (6, 0, 'Pressure: Millibar', 'millibar', 'Millibar', 'mbar', 4);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (8, 0, 'Current: Ampere', 'ampere', 'Ampere', 'A', 6);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (9, 0, 'Pressure: Bar', 'bar', 'Bar', 'bar', 4);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (7, 0, 'Airflow: Liters per Second', 'liters_per_second', 'Liters per Second', 'l/s', 5);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (10, 0, 'Relative Humidity: Percent', 'relative_humidity_percent', 'Percent', '%', 7);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (11, 0, 'Noise: dB', 'noise_db', 'Decibel', 'dB', 8);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (12, 0, 'Particle Density: Density mg/m³', 'milligram_per_cubicmeter', 'Milligram per Cubic Meter', 'mg/m³', 9);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (13, 0, 'Temperature: C', 'degrees_celsius', 'Degrees Celsius', '°C', 10);
-- quantity_type.base_unit_id
update quantity_type set base_unit_id = 1 where id = 1;
update quantity_type set base_unit_id = 3 where id = 2;
update quantity_type set base_unit_id = 4 where id = 3;
update quantity_type set base_unit_id = 6 where id = 4;
update quantity_type set base_unit_id = 7 where id = 5;
update quantity_type set base_unit_id = 8 where id = 6;
update quantity_type set base_unit_id = 10 where id = 7;
update quantity_type set base_unit_id = 11 where id = 8;
update quantity_type set base_unit_id = 12 where id = 9;
update quantity_type set base_unit_id = 13 where id = 10;
-- field
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (1, 0, 1, 'Maintenance interval', 'maintenance_interval', 'Maintenance interval', null, 5);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (3, 0, 0, 'Cutting program', 'cutting_program', 'Cutting program', null, 4);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (4, 0, 1, 'Total cutting time', 'total_cutting_time', 'Total cutting time', null, 1);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (5, 0, 1, 'Remaining cutting time', 'remaining_cutting_time', 'Remaining cutting time', null, 1);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (6, 0, 0, 'Material name', 'material_name', 'Material name', null, 4);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (7, 0, 0, 'Material specification', 'material_spec', 'Material specification', null, 4);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (8, 0, 1, 'Plate thickness', 'plate_thickness', 'Plate thickness', null, 3);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (9, 0, 1, 'Hours till maintenance', 'hours_til_mantenance', 'Hours till maintenance', null, 5);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (2, 0, 0, 'Asset status', 'asset_status', 'Asset status', null, 4);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (10, 0, 2, 'Differential pressure', 'differential_pressure', 'Differential pressure', null, 6);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (11, 0, 2, 'Low pressure', 'low_pressure', 'Low pressure', null, 6);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (12, 0, 2, 'Air consumption', 'air_consumption', 'Air consumption', null, 7);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (13, 0, 2, 'Air pressure', 'air_pressure', 'Air pressure', null, 6);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (14, 0, 2, 'Pressure bottle', 'pressure_bottle', 'Pressure bottle', null, 6);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (15, 0, 2, 'Pressure pipe', 'pressure_pipe', 'Pressure pipe', null, 9);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (17, 0, 2, 'Pressure takeoff', 'pressure_takeoff_1', 'Pressure takeoff', null, 9);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (16, 0, 2, 'Electrical current', 'electric_current', 'Electrical current', null, 8);
    -------------------------------------------------------------
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (18, 0, 2, 'Humidity', 'Humidity', 'Humidity', null, 10);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (19, 0, 2, 'Noise', 'Noise', 'Noise', null, 11);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (20, 0, 2, 'Dust', 'Dust', 'Dust', null, 12);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (21, 0, 2, 'Temperature', 'Temperature', 'Temperature', null, 13);
    --------------------------------------------------------------
-- asset_type
insert into asset_type (id, version, description, label, name) values (1, 0, 'CNC-Laserschneidanlage', 'laserschneidanlage', 'Laserschneidanlage');
insert into asset_type (id, version, description, label, name) values (2, 0, 'Stationäre Filteranlage', 'filteranlage', 'Filteranlage');
insert into asset_type (id, version, description, label, name) values (3, 0, 'Gasversorgungsanlage', 'gasversorgung', 'Gasversorgungsanlage');
insert into asset_type (id, version, description, label, name) values (4, 0, 'CNC-Plasmaschneidanlage', 'plasmaschneidanlage', 'Plasmaschneidanlage');
insert into asset_type (id, version, description, label, name) values (5, 0, 'Plasmastromquelle', 'plasmastromquelle', 'Plasmastromquelle');
insert into asset_type (id, version, description, label, name) values (6, 0, 'Strahlanlage', 'strahlanlage', 'Strahlanlage');
insert into asset_type (id, version, description, label, name) values (7, 0, 'Entgratmaschine', 'entgratmaschine', 'Entgratmaschine');
    -----------------------------------------------------------
insert into asset_type (id, version, description, label, name) values (8, 0, 'Raumluftüberwachungssystem', 'raumluftüberwachung', 'Raumluftüberwachung');
    ----------------------------------------------------------
-- asset_type_template
insert into asset_type_template (id, version, description, image_key, name, asset_type_id) values (1, 0, 'CNC-Laserschneidanlage', '', 'Laserschneidanlage', 1);
insert into asset_type_template (id, version, description, image_key, name, asset_type_id) values (2, 0, 'Stationäre Filteranlage', '', 'Filteranlage', 2);
insert into asset_type_template (id, version, description, image_key, name, asset_type_id) values (3, 0, 'Gasversorgungsanlage', '', 'Gasversorgung', 3);
insert into asset_type_template (id, version, description, image_key, name, asset_type_id) values (4, 0, 'CNC-Plasmaschneidanlage', '', 'Plasmaschneidanlage', 4);
insert into asset_type_template (id, version, description, image_key, name, asset_type_id) values (5, 0, 'Plasmastromquelle', '', 'Plasmastromquelle', 5);
insert into asset_type_template (id, version, description, image_key, name, asset_type_id) values (6, 0, 'Strahlanlage', '', 'Strahlanlage', 6);
insert into asset_type_template (id, version, description, image_key, name, asset_type_id) values (7, 0, 'Entgratmaschine', '', 'Entgratmaschine', 7);
    ---------------------------------------------
insert into asset_type_template (id, version, description, image_key, name, asset_type_id) values (8, 0, 'Raumluftüberwachungssystem', '', 'Raumluftüberwachung', 8);
    -------------------------------------------------------
-- field_target
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (2, 0, 1, 'asset_status', true, 'Asset status', 1, 2);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (1, 0, 0, 'maintenance_interval', true, 'Maintenance interval', 1, 1);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (3, 0, 1, 'cutting_program', true, 'Cutting program', 1, 3);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (4, 0, 1, 'total_cutting_time', true, 'Total cutting time', 1, 4);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (6, 0, 1, 'material_name', true, 'Material name', 1, 6);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (7, 0, 1, 'material_specification', true, 'Material specification', 1, 7);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (8, 0, 1, 'plate_thickness', true, 'Plate thickness', 1, 8);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (9, 0, 1, 'hours_maintenance', true, 'Hours till maintenance', 1, 9);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (10, 0, 0, 'maintenance_interval', true, 'Maintenance interval', 2, 1);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (11, 0, 1, 'asset_status', true, 'Asset status', 2, 2);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (12, 0, 1, 'differential_pressure', true, 'Differential pressure', 2, 10);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (13, 0, 1, 'low_pressure', true, 'Low pressure', 2, 11);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (14, 0, 1, 'air_consumption', true, 'Air consumption', 2, 12);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (15, 0, 1, 'air_pressure', true, 'Air pressure', 2, 13);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (16, 0, 1, 'electric_current', true, 'Electric current', 2, 16);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (17, 0, 1, 'hours_maintenance', true, 'Hours till maintenance', 2, 9);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (5, 0, 1, 'remaining_cutting_time', true, 'Remaining cutting time', 1, 5);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (18, 0, 0, 'maintenance_interval', true, 'Maintenance interval', 3, 1);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (19, 0, 1, 'asset_status', true, 'Asset status', 3, 2);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (20, 0, 1, 'pressure_bottle_left', true, 'Pressure bottle left', 3, 14);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (21, 0, 1, 'pressure_bottle_right', true, 'Pressure bottle right', 3, 14);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (22, 0, 1, 'pressure_pipe', true, 'Pressure pipe', 3, 15);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (23, 0, 1, 'pressure_takeoff_1', true, 'Pressure takeoff 1', 3, 17);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (24, 0, 1, 'hours_maintenance', true, 'Hours till maintenance', 3, 9);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (25, 0, 0, 'maintenance_interval', true, 'Maintenance interval', 4, 1);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (26, 0, 1, 'asset_status', true, 'Asset status', 4, 2);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (27, 0, 1, 'cutting_program', true, 'Cutting program', 4, 3);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (28, 0, 1, 'total_cutting_time', true, 'Total cutting time', 4, 4);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (29, 0, 1, 'remaining_cutting_time', true, 'Remaining cutting time', 4, 5);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (30, 0, 1, 'material_name', true, 'Material name', 4, 6);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (31, 0, 1, 'material_specification', true, 'Material specification', 4, 7);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (32, 0, 1, 'plate_thickness', true, 'Plate thickness', 4, 8);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (33, 0, 1, 'hours_maintenance', true, 'Hours till maintenance', 4, 9);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (34, 0, 1, 'asset_status', true, 'Asset status', 5, 2);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (35, 0, 1, 'asset_status', true, 'Asset status', 6, 2);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (36, 0, 1, 'asset_status', true, 'Asset status', 7, 2);
---------------------------------------
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (37, 0, 1, 'humidity', true, 'Humidity', 8, 18);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (38, 0, 1, 'noise', true, 'Noise', 8, 19);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (39, 0, 1, 'dust', true, 'Dust', 8, 20);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (40, 0, 1, 'temperature', true, 'Temperature', 8, 21);
--------------------------------------------
update field_target set description = name;
-- asset_series
insert into asset_series (id, version, description, image_key, name, ce_certified, handbook_key, protection_class, video_key, asset_type_template_id, company_id) values (1, 0, 'MSF', '', 'MSF', true, '', '1', '', 1, 3);
insert into asset_series (id, version, description, image_key, name, ce_certified, handbook_key, protection_class, video_key, asset_type_template_id, company_id) values (2, 0, 'ZPF', '', 'ZPF', true, '', '5', '', 2, 4);
insert into asset_series (id, version, description, image_key, name, ce_certified, handbook_key, protection_class, video_key, asset_type_template_id, company_id) values (3, 0, 'Gasversorgung aus 2x2 Sauerstoffflaschen', '', 'Gasversorgung 2x2 ', true, '', '6', '', 3, 5);
insert into asset_series (id, version, description, image_key, name, ce_certified, handbook_key, protection_class, video_key, asset_type_template_id, company_id) values (4, 0, 'MG', '', 'MG', true, '', '1', '', 4, 3);
insert into asset_series (id, version, description, image_key, name, ce_certified, handbook_key, protection_class, video_key, asset_type_template_id, company_id) values (5, 0, 'Q', '', 'Q', true, '', '1', '', 5, 9);
insert into asset_series (id, version, description, image_key, name, ce_certified, handbook_key, protection_class, video_key, asset_type_template_id, company_id) values (6, 0, 'RHB', '', 'RHB', true, '', '1', '', 6, 11);
insert into asset_series (id, version, description, image_key, name, ce_certified, handbook_key, protection_class, video_key, asset_type_template_id, company_id) values (7, 0, 'EdgeBreaker', '', 'EdgeBreaker', true, '', '1', '', 7, 6);
insert into asset_series (id, version, description, image_key, name, ce_certified, handbook_key, protection_class, video_key, asset_type_template_id, company_id) values (8, 0, 'SBM-M', '', 'SBM-M', true, '', '1', '', 7, 12);
insert into asset_series (id, version, description, image_key, name, ce_certified, handbook_key, protection_class, video_key, asset_type_template_id, company_id) values (9, 0, 'PFM', '', 'PFM', true, '', '5', '', 2, 7);
--------------------------------------------------
insert into asset_series (id, version, description, image_key, name, ce_certified, handbook_key, protection_class, video_key, asset_type_template_id, company_id) values (10, 0, 'Airtracker', '', 'Airtracker', true, '', '5', '', 8, 4);
    --------------------------------------------------
-- field_source
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (1, 0, 'Maintenance interval', 'Maintenance interval', 'maintenance_interval', null, 1, 1, 5);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (2, 0, 'Asset status', 'Asset status', 'asset_status', null, 1, 2, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (3, 0, 'Cutting program', 'Cutting program', 'cutting_program', null, 1, 3, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (4, 0, 'Total cutting time', 'Total cutting time', 'total_cutting_time', null, 1, 4, 1);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (5, 0, 'Remaining cutting time', 'Remaining cutting time', 'remaining_cutting_time', null, 1, 5, 1);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (6, 0, 'Material name', 'Material name', 'material_name', null, 1, 6, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (7, 0, 'Material specification', 'Material specification', 'material_specification', null, 1, 7, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (8, 0, 'Plate thickness', 'Plate thickness', 'plate_thickness', null, 1, 8, 3);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (9, 0, 'Hours till maintenance', 'Hours till maintenance', 'hours_maintenance', null, 1, 9, 5);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (10, 0, 'Maintenance interval', 'Maintenance interval', 'maintenance_interval', null, 2, 10, 5);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (11, 0, 'Asset status', 'Asset status', 'asset_status', null, 2, 11, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (12, 0, 'Differential pressure', 'Differential pressure', 'differential_pressure', null, 2, 12, 6);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (13, 0, 'Low pressure', 'Low pressure', 'low_pressure', null, 2, 13, 6);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (14, 0, 'Air consumption', 'Air consumption', 'air_consumption', null, 2, 14, 7);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (15, 0, 'Air pressure', 'Air pressure', 'air_pressure', null, 2, 15, 6);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (16, 0, 'Electric current', 'Electric current', 'electric_current', null, 2, 16, 8);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (17, 0, 'Hours till maintenance', 'Hours till maintenance', 'hours_maintenance', null, 2, 17, 5);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (18, 0, 'Maintenance interval', 'Maintenance interval', 'maintenance_interval', null, 3, 18, 5);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (19, 0, 'Asset status', 'Asset status', 'asset_status', null, 3, 19, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (20, 0, 'Pressure bottle left', 'Pressure bottle left', 'pressure_bottle_left', null, 3, 20, 6);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (21, 0, 'Pressure bottle right', 'Pressure bottle right', 'pressure_bottle_right', null, 3, 21, 6);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (22, 0, 'Pressure pipe', 'Pressure pipe', 'pressure_pipe', null, 3, 22, 9);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (23, 0, 'Pressure takeoff 1', 'Pressure takeoff 1', 'pressure_takeoff_1', null, 3, 23, 9);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (24, 0, 'Hours till maintenance', 'Hours till maintenance', 'hours_maintenance', null, 3, 24, 5);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (25, 0, 'Maintenance interval', 'Maintenance interval', 'maintenance_interval', null, 4, 25, 5);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (26, 0, 'Asset status', 'Asset status', 'asset_status', null, 4, 26, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (27, 0, 'Cutting program', 'Cutting program', 'cutting_program', null, 4, 27, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (28, 0, 'Total cutting time', 'Total cutting time', 'total_cutting_time', null, 4, 28, 1);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (29, 0, 'Remaining cutting time', 'Remaining cutting time', 'remaining_cutting_time', null, 4, 29, 1);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (30, 0, 'Material name', 'Material name', 'material_name', null, 4, 30, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (31, 0, 'Material specification', 'Material specification', 'material_specification', null, 4, 31, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (32, 0, 'Plate thickness', 'Plate thickness', 'plate_thickness', null, 4, 32, 3);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (33, 0, 'Hours till maintenance', 'Hours till maintenance', 'hours_maintenance', null, 4, 33, 5);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (34, 0, 'Asset status', 'Asset status', 'asset_status', null, 5, 34, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (35, 0, 'Asset status', 'Asset status', 'asset_status', null, 6, 35, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (36, 0, 'Asset status', 'Asset status', 'asset_status', null, 7, 36, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (37, 0, 'Asset status', 'Asset status', 'asset_status', null, 8, 36, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (38, 0, 'Maintenance interval', 'Maintenance interval', 'maintenance_interval', null, 9, 10, 5);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (39, 0, 'Asset status', 'Asset status', 'asset_status', null, 9, 11, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (40, 0, 'Differential pressure', 'Differential pressure', 'differential_pressure', null, 9, 12, 6);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (41, 0, 'Low pressure', 'Low pressure', 'low_pressure', null, 9, 13, 6);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (42, 0, 'Air consumption', 'Air consumption', 'air_consumption', null, 9, 14, 7);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (43, 0, 'Air pressure', 'Air pressure', 'air_pressure', null, 9, 15, 6);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (44, 0, 'Electric current', 'Electric current', 'electric_current', null, 9, 16, 8);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (45, 0, 'Hours till maintenance', 'Hours till maintenance', 'hours_maintenance', null, 9, 17, 5);
    --------------------------------------------------------
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (46, 0, 'Humidity', 'Humidity', 'humidity', null, 8, 37, 10);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (47, 0, 'Noise', 'Noise', 'noise', null, 8, 38, 11);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (48, 0, 'Dust', 'Dust', 'dust', null, 8, 39, 12);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (49, 0, 'Temperature', 'Temperature', 'temperature', null, 8, 40, 13);
    -----------------------------------------------------------------------------------------
-- asset
insert into asset (id, version, description, image_key, name, ce_certified, construction_date, control_system_type, external_id, gateway_connectivity, guid, handbook_key, has_gateway, installation_date, protection_class, serial_number, video_key, asset_series_id, company_id, room_id) values (1, 0, 'MSF Compact 1001.20L CNC-Laser Cutting Machine', 'microstep_asset_msf.jpg', 'MSF Compact 1001.20L', true, '2019-10-11 00:00:00.000000', 'CNC', 'laserschneider-msf-2551', 'SQL', 'f06ec371-68e9-404e-8cf5-1c8da37ecb3d', null, true, '2019-10-18 00:00:00.000000', '1', '2551', null, 1, 2, 1);
insert into asset (id, version, description, image_key, name, ce_certified, construction_date, control_system_type, external_id, gateway_connectivity, guid, handbook_key, has_gateway, installation_date, protection_class, serial_number, video_key, asset_series_id, company_id, room_id) values (2, 0, 'ZPF 6H Filteranlage', 'teka_asset_zpf.jpg', 'ZPF 6H', true, '2017-10-11 00:00:00.000000', 'PLC S7-1200', 'ubuntu1804', 'PLC', '3a3040fc-3fd5-4cc2-ad98-b9d4e82902f9', null, true, '2019-10-18 00:00:00.000000', '5', '1875', null, 2, 2, 2);
insert into asset (id, version, description, image_key, name, ce_certified, construction_date, control_system_type, external_id, gateway_connectivity, guid, handbook_key, has_gateway, installation_date, protection_class, serial_number, video_key, asset_series_id, company_id, room_id) values (3, 0, 'automatische Gasumschaltung', 'ibeda_asset_umschaltung.jpg', 'Gasversorgung aus 2x2 Sauerstoffflaschen', true, '2019-10-11 00:00:00.000000', 'direct I/O', 'gasversorgung', 'I/O', '68f774e4-bb9e-4cd1-8e77-744d9ad79609', null, true, '2019-10-18 00:00:00.000000', '6', '1523', null, 3, 2, 1);
insert into asset (id, version, description, image_key, name, ce_certified, construction_date, control_system_type, external_id, gateway_connectivity, guid, handbook_key, has_gateway, installation_date, protection_class, serial_number, video_key, asset_series_id, company_id, room_id) values (4, 0, 'MG 1501.15 CNC-Plasma Cutting Machine', 'microstep_asset_mg.jpg', 'MG 1501.15L', true, '2019-10-11 00:00:00.000000', 'CNC', 'laserschneider-msf-2551-2', 'SQL', '23f652de-c48b-4d5b-a5fd-bb4ea6d4d388', null, true, '2019-10-18 00:00:00.000000', '1', '1964', null, 4, 2, 1);
-----------------------------------------------
insert into asset (id, version, description, image_key, name, ce_certified, construction_date, control_system_type, external_id, gateway_connectivity, guid, handbook_key, has_gateway, installation_date, protection_class, serial_number, video_key, asset_series_id, company_id, room_id) values (5, 0, 'intelligentes Raumluftüberwachung-System', 'ibeda_asset_airtracker.jpg', 'Airtracker Raumluftüberwachung', true, '2019-10-11 00:00:00.000000', 'direct I/O', 'laserschneider-msf-2551-3', 'I/O', '321f2848-0d38-4a01-a65f-7e72149670a6', null, true, '2019-10-18 00:00:00.000000', '6', '1700221523', null, 8, 2, 1);
--------------------------------------------------
-- field_instance
---- MSF
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (1, 0, 'Maintenance interval', 'maintenance_interval', 'Maintenance interval', null, null, 1, 1);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (2, 0, 'Asset status', 'status', 'Asset status', null, null, 1, 2);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (3, 0, 'Cutting program', 'cutting_program', 'Cutting program', null, null, 1, 3);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (4, 0, 'Total cutting time', 'total_cutting_time', 'Total cutting time', null, null, 1, 4);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (5, 0, 'Remaining cutting time', 'remaining_cutting_time', 'Remaining cutting time', null, null, 1, 5);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (6, 0, 'Material name', 'material_name', 'Material name', null, null, 1, 6);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (7, 0, 'Material specification', 'material_specification', 'Material specification', null, null, 1, 7);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (8, 0, 'Plate thickness', 'plate_thickness', 'Plate thickness', null, null, 1, 8);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (9, 0, 'Hours till maintenance', 'hours_maintenance', 'Hours till maintenance', null, null, 1, 9);
---- ZPF
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (10, 0, 'Maintenance interval', 'maintenance_interval', 'Maintenance interval', null, null, 2, 10);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (11, 0, 'Asset status', 'Mld_Betrieb', 'Asset status', null, null, 2, 11);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (12, 0, 'Differential pressure', 'differential_pressure', 'Differential pressure', null, null, 2, 12);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (13, 0, 'Low pressure', 'low_pressure', 'Low pressure', null, null, 2, 13);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (14, 0, 'Air consumption', 'air_consumption', 'Air consumption', null, null, 2, 14);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (15, 0, 'Air pressure', 'air_pressure', 'Air pressure', null, null, 2, 15);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (16, 0, 'Electric current', 'electric_current', 'Electric current', null, null, 2, 16);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (17, 0, 'Hours till maintenance', 'hours_maintenance', 'Hours till maintenance', null, null, 2, 17);
---- Gasversorgung
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (18, 0, 'Maintenance interval', 'maintenance_interval', 'Maintenance interval', null, null, 3, 18);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (19, 0, 'Asset status', 'asset_status', 'Asset status', null, null, 3, 19);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (20, 0, 'Pressure bottle left', 'pressure_bottle_left', 'Pressure bottle left', null, null, 3, 20);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (21, 0, 'Pressure bottle right', 'pressure_bottle_right', 'Pressure bottle right', null, null, 3, 21);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (22, 0, 'Pressure pipe', 'pressure_pipe', 'Pressure pipe', null, null, 3, 22);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (23, 0, 'Pressure takeoff 1', 'pressure_takeoff_1', 'Pressure takeoff 1', null, null, 3, 23);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (24, 0, 'Hours till maintenance', 'hours_maintenance', 'Hours till maintenance', null, null, 3, 24);
---- MG
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (25, 0, 'Maintenance interval', 'maintenance_interval', 'Maintenance interval', null, null, 4, 25);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (26, 0, 'Asset status', 'status', 'Asset status', null, null, 4, 26);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (27, 0, 'Cutting program', 'cutting_program', 'Cutting program', null, null, 4, 27);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (28, 0, 'Total cutting time', 'total_cutting_time', 'Total cutting time', null, null, 4, 28);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (29, 0, 'Remaining cutting time', 'remaining_cutting_time', 'Remaining cutting time', null, null, 4, 29);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (30, 0, 'Material name', 'material_name', 'Material name', null, null, 4, 30);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (31, 0, 'Material specification', 'material_specification', 'Material specification', null, null, 4, 31);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (32, 0, 'Plate thickness', 'plate_thickness', 'Plate thickness', null, null, 4, 32);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (33, 0, 'Hours till maintenance', 'hours_maintenance', 'Hours till maintenance', null, null, 4, 33);
---- Airtracker
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (34, 0, 'Humidity', 'humidity', 'Humidity', null, null, 5, 46);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (35, 0, 'Noise', 'noise', 'Noise', null, null, 5, 47);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (36, 0, 'Dust', 'dust', 'Dust', null, null, 5, 48);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (37, 0, 'Temperature', 'temperature', 'Temperature', null, null, 5, 49);