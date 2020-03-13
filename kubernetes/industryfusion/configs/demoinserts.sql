-- company
insert into company (id, version, description, image_key, name, type) values (1, 0, 'Industry Business Network 4.0 e.V.', 'ibn_logo.png', 'Industry Business Network 4.0', 'ECOSYSTEM_MANAGER');
insert into company (id, version, description, image_key, name, type) values (2, 0, 'IBN 4.0 Smart Factory', 'ibn_logo.png', 'IBN 4.0 Smart Factory', 'MACHINE_CUSTOMER');
insert into company (id, version, description, image_key, name, type) values (3, 0, 'MicroStep Europa GmbH', 'microstep_logo.png', 'MicroStep', 'MACHINE_MANUFACTURER');
insert into company (id, version, description, image_key, name, type) values (4, 0, 'TEKA Absaug- und Entsorgungstechnologie GmbH', 'teka_logo.png', 'TEKA', 'MACHINE_MANUFACTURER');
insert into company (id, version, description, image_key, name, type) values (5, 0, 'IBEDA Sicherheitsgeräte und Gastechnik GmbH & Co. KG', 'ibeda_logo.png', 'Ibeda', 'MACHINE_MANUFACTURER');
-- location
insert into location (id, version, city, country, image_key, latitude, line1, line2, longitude, name, type, zip, company_id) values (1, 0, 'Bad Wörishofen', 'Germany', 'ibn_standort_1.jpg', 48.019644, 'Rudolf-Diesel-Straße 16', 'Vordergebäude', 10.603576, 'CompetenceCenter Süd', 'FABRICATION', '86825', 2);
insert into location (id, version, city, country, image_key, latitude, line1, line2, longitude, name, type, zip, company_id) values (2, 0, 'Bad Wörishofen', 'Germany', 'microstep_standort_1.jpg', 48.021168, 'Messerschmittstraße 10', 'Vordergebäude', 10.604966, 'Firmenzentrale', 'HEADQUARTER', '86825', 3);
insert into location (id, version, city, country, image_key, latitude, line1, line2, longitude, name, type, zip, company_id) values (3, 0, 'Velen', 'Germany', 'teka_standort_1.jpg', 51.895804, 'Industriestraße 13', 'Vordergebäude', 6.997579, 'Firmenzentrale', 'HEADQUARTER', '46342', 4);
insert into location (id, version, city, country, image_key, latitude, line1, line2, longitude, name, type, zip, company_id) values (4, 0, 'Neustadt (Wied)', 'Germany', 'ibeda_standort_1.JPG', 50.625049, 'Bahnhofstraße 27', 'Vordergebäude', 7.43345, 'Firmenzentrale', 'HEADQUARTER', '53577', 5);
-- room 
insert into room (id, version, image_key, name, description, location_id) values (1, 0, null, 'Showroom', 'Showroom', 1);
insert into room (id, version, image_key, name, description, location_id) values (2, 0, null, 'Technikraum', 'Technikraum', 1);
-- quantity_type
insert into quantity_type (id, version, description, label, name) values (1, 0, 'Duration Quantity', 'duration', 'Duration');
insert into quantity_type (id, version, description, label, name) values (2, 0, 'Length Quantity', 'length', 'Length');
insert into quantity_type (id, version, description, label, name) values (3, 0, 'Text', 'text', 'Text');
insert into quantity_type (id, version, description, label, name) values (4, 0, 'Pressure Quantity', 'pressure', 'Pressure');
insert into quantity_type (id, version, description, label, name) values (5, 0, 'Airflow Quatity', 'airflow', 'Airflow');
insert into quantity_type (id, version, description, label, name) values (6, 0, 'Electrical Current Quantity', 'electric_current', 'Electric Current');
-- unit
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (1, 0, 'Duration: Seconds', 'seconds', 'Seconds', 's', 1);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (2, 0, 'Duration: Years', 'years', 'Years', 'y', 1);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (4, 0, 'Text', 'text', 'Text', '', 3);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (5, 0, 'Duration Hours', 'hours', 'Hours', 'h', 1);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (3, 0, 'Length: Millimeter', 'mm', 'Millimeter', 'mm', 2);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (6, 0, 'Pressure: Millibar', 'millibar', 'Millibar', 'mbar', 4);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (8, 0, 'Current: Ampere', 'ampere', 'Ampere', 'A', 6);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (9, 0, 'Pressure: Bar', 'bar', 'Bar', 'bar', 4);
insert into unit (id, version, description, label, name, symbol, quantity_type_id) values (7, 0, 'Airflow Liters per Second', 'liters_per_second', 'Liters per Second', 'l/s', 5);
-- quantity_type.base_unit_id
update quantity_type set base_unit_id = 1 where id = 1;
update quantity_type set base_unit_id = 3 where id = 2;
update quantity_type set base_unit_id = 4 where id = 3;
update quantity_type set base_unit_id = 6 where id = 4;
update quantity_type set base_unit_id = 7 where id = 5;
update quantity_type set base_unit_id = 8 where id = 6;
-- field
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (1, 0, 1, 'Maintenance interval', 'maintenance_interval', 'Maintenance interval', null, 5);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (3, 0, 0, 'Cutting program', 'cutting_program', 'Cutting program', null, 4);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (4, 0, 1, 'Total cutting time', 'total_cutting_time', 'Total cutting time', null, 1);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (5, 0, 1, 'Remaining cutting time', 'remaining_cutting_time', 'Remaining cutting time', null, 1);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (6, 0, 0, 'Material name', 'material_name', 'Material name', null, 4);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (7, 0, 0, 'Material specification', 'material_spec', 'Material specification', null, 4);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (8, 0, 1, 'Plate thickness', 'plate_thickness', 'Plate thickness', null, 3);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (9, 0, 1, 'Hours til maintenance', 'hours_til_mantenance', 'Hours til maintenance', null, 5);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (2, 0, 0, 'Asset status', 'asset_status', 'Asset status', null, 4);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (10, 0, 2, 'Differential pressure', 'differential_pressure', 'Differential pressure', null, 6);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (11, 0, 2, 'Low pressure', 'low_pressure', 'Low pressure', null, 6);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (12, 0, 2, 'Air consumption', 'air_consumption', 'Air consumption', null, 7);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (13, 0, 2, 'Air pressure', 'air_pressure', 'Air pressure', null, 6);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (14, 0, 2, 'Pressure bottle', 'pressure_bottle', 'Pressure bottle', null, 6);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (15, 0, 2, 'Pressure pipe', 'pressure_pipe', 'Pressure pipe', null, 9);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (17, 0, 2, 'Pressure takeoff', 'pressure_takeoff_1', 'Pressure takeoff', null, 9);
insert into field (id, version, accuracy, description, label, name, value, unit_id) values (16, 0, 2, 'Electrical current', 'electric_current', 'Electrical current', null, 8);
-- asset_type
insert into asset_type (id, version, description, label, name) values (1, 0, 'CNC-Laserschneidanlage', 'laserschneidanlage', 'Laserschneidanlage');
insert into asset_type (id, version, description, label, name) values (2, 0, 'Stationäre Filteranlage', 'filteranlage', 'Filteranlage');
insert into asset_type (id, version, description, label, name) values (3, 0, 'Gasversorgungsanlage', 'gasversorgung', 'Gasversorgungsanlage');
-- asset_type_template
insert into asset_type_template (id, version, description, image_key, name, asset_type_id) values (1, 0, 'CNC-Laserschneidanlage', '', 'Laserschneidanlage', 1);
insert into asset_type_template (id, version, description, image_key, name, asset_type_id) values (2, 0, 'Stationäre Filteranlage', '', 'Filteranlage', 2);
insert into asset_type_template (id, version, description, image_key, name, asset_type_id) values (3, 0, 'Gasversorgungsanlage', '', 'Gasversorgung', 3);
-- field_target
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (2, 0, 1, 'asset_status', true, 'Asset status', 1, 2);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (1, 0, 0, 'maintenance_interval', true, 'Maintenance interval', 1, 1);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (3, 0, 1, 'cutting_program', true, 'Cutting program', 1, 3);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (4, 0, 1, 'total_cutting_time', true, 'Total cutting time', 1, 4);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (6, 0, 1, 'material_name', true, 'Material name', 1, 6);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (7, 0, 1, 'material_specification', true, 'Material specification', 1, 7);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (8, 0, 1, 'plate_thickness', true, 'Plate thickness', 1, 8);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (9, 0, 1, 'hours_maintenance', true, 'Hours til maintenance', 1, 9);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (10, 0, 0, 'maintenance_interval', true, 'Maintenance interval', 2, 1);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (11, 0, 1, 'asset_status', true, 'Asset status', 2, 2);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (12, 0, 1, 'differential_pressure', true, 'Differential pressure', 2, 10);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (13, 0, 1, 'low_pressure', true, 'Low pressure', 2, 11);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (14, 0, 1, 'air_consumption', true, 'Air consumption', 2, 12);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (15, 0, 1, 'air_pressure', true, 'Air pressure', 2, 13);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (16, 0, 1, 'electric_current', true, 'Electric current', 2, 16);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (17, 0, 1, 'hours_maintenance', true, 'Hours til maintenance', 2, 9);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (5, 0, 1, 'remaining_cutting_time', true, 'Remaining cutting time', 1, 5);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (18, 0, 0, 'maintenance_interval', true, 'Maintenance interval', 3, 1);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (19, 0, 1, 'asset_status', true, 'Asset status', 3, 2);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (20, 0, 1, 'pressure_bottle_left', true, 'Pressure bottle left', 3, 14);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (21, 0, 1, 'pressure_bottle_right', true, 'Pressure bottle right', 3, 14);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (22, 0, 1, 'pressure_pipe', true, 'Pressure pipe', 3, 15);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (23, 0, 1, 'pressure_takeoff_1', true, 'Pressure takeoff 1', 3, 17);
insert into field_target (id, version, field_type, label, mandatory, name, asset_type_template_id, field_id) values (24, 0, 1, 'hours_maintenance', true, 'Hours til maintenance', 3, 9);
update field_target set description = name;
-- asset_series
insert into asset_series (id, version, description, image_key, name, ce_certified, handbook_key, protection_class, video_key, asset_type_template_id, company_id) values (1, 0, 'MSF', '', 'MSF', true, '', '1', '', 1, 3);
insert into asset_series (id, version, description, image_key, name, ce_certified, handbook_key, protection_class, video_key, asset_type_template_id, company_id) values (2, 0, 'ZPF', '', 'ZPF', true, '', '5', '', 2, 4);
insert into asset_series (id, version, description, image_key, name, ce_certified, handbook_key, protection_class, video_key, asset_type_template_id, company_id) values (3, 0, 'Gasversorgung aus 2x2 Sauerstoffflaschen', '', 'Gasversorgung 2x2 ', true, '', '6', '', 3, 5);
-- field_source
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (1, 0, 'Maintenance interval', 'Maintenance interval', 'maintenance_interval', null, 1, 1, 5);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (2, 0, 'Asset status', 'Asset status', 'asset_status', null, 1, 2, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (3, 0, 'Cutting program', 'Cutting program', 'cutting_program', null, 1, 3, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (4, 0, 'Total cutting time', 'Total cutting time', 'total_cutting_time', null, 1, 4, 1);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (5, 0, 'Remaining cutting time', 'Remaining cutting time', 'remaining_cutting_time', null, 1, 5, 1);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (6, 0, 'Material name', 'Material name', 'material_name', null, 1, 6, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (7, 0, 'Material specification', 'Material specification', 'material_specification', null, 1, 7, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (8, 0, 'Plate thickness', 'Plate thickness', 'plate_thickness', null, 1, 8, 3);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (9, 0, 'Hours til maintenance', 'Hours til maintenance', 'hours_maintenance', null, 1, 9, 5);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (10, 0, 'Maintenance interval', 'Maintenance interval', 'maintenance_interval', null, 2, 10, 5);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (11, 0, 'Asset status', 'Asset status', 'asset_status', null, 2, 11, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (12, 0, 'Differential pressure', 'Differential pressure', 'differential_pressure', null, 2, 12, 6);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (13, 0, 'Low pressure', 'Low pressure', 'low_pressure', null, 2, 13, 6);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (14, 0, 'Air consumption', 'Air consumption', 'air_consumption', null, 2, 14, 7);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (15, 0, 'Air pressure', 'Air pressure', 'air_pressure', null, 2, 15, 6);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (16, 0, 'Electric current', 'Electric current', 'electric_current', null, 2, 16, 8);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (17, 0, 'Hours til maintenance', 'Hours til maintenance', 'hours_maintenance', null, 2, 17, 5);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (18, 0, 'Maintenance interval', 'Maintenance interval', 'maintenance_interval', null, 3, 18, 5);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (19, 0, 'Asset status', 'Asset status', 'asset_status', null, 3, 19, 4);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (20, 0, 'Pressure bottle left', 'Pressure bottle left', 'pressure_bottle_left', null, 3, 20, 6);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (21, 0, 'Pressure bottle right', 'Pressure bottle right', 'pressure_bottle_right', null, 3, 21, 6);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (22, 0, 'Pressure pipe', 'Pressure pipe', 'pressure_pipe', null, 3, 22, 9);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (23, 0, 'Pressure takeoff 1', 'Pressure takeoff 1', 'pressure_takeoff_1', null, 3, 23, 9);
insert into field_source (id, version, description, name, source_sensor_label, value, asset_series_id, field_target_id, source_unit_id) values (24, 0, 'Hours til maintenance', 'Hours til maintenance', 'hours_maintenance', null, 3, 24, 5);
-- asset
insert into asset (id, version, description, image_key, name, ce_certified, construction_date, control_system_type, external_id, gateway_connectivity, guid, handbook_key, has_gateway, installation_date, protection_class, serial_number, video_key, asset_series_id, company_id, room_id) values (1, 0, 'MSF Compact 1001.20L CNC-Laser Cutter Machine', 'microstep_asset_msf.jpg', 'MSF Compact 1001.20L', true, '2019-10-11 00:00:00.000000', 'CNC', 'laserschneider-msf-2551', 'SQL', 'f06ec371-68e9-404e-8cf5-1c8da37ecb3d', null, true, '2019-10-18 00:00:00.000000', '1', '2551', null, 1, 2, 1);
insert into asset (id, version, description, image_key, name, ce_certified, construction_date, control_system_type, external_id, gateway_connectivity, guid, handbook_key, has_gateway, installation_date, protection_class, serial_number, video_key, asset_series_id, company_id, room_id) values (2, 0, 'ZPF 6H Filteranlage', 'teka_asset_zpf.jpg', 'ZPF 6H', true, '2017-10-11 00:00:00.000000', 'PLC S7-1200', 'ubuntu1804', 'PLC', '3a3040fc-3fd5-4cc2-ad98-b9d4e82902f9', null, true, '2019-10-18 00:00:00.000000', '5', '1875', null, 2, 2, 2);
insert into asset (id, version, description, image_key, name, ce_certified, construction_date, control_system_type, external_id, gateway_connectivity, guid, handbook_key, has_gateway, installation_date, protection_class, serial_number, video_key, asset_series_id, company_id, room_id) values (3, 0, 'automatische Gasumschaltung', 'ibeda_asset_umschaltung.jpg', 'Gasversorgung aus 2x2 Sauerstoffflaschen', true, '2019-10-11 00:00:00.000000', 'direct I/O', 'gasversorgung-gms-1523', 'I/O', '68f774e4-bb9e-4cd1-8e77-744d9ad79609', null, true, '2019-10-18 00:00:00.000000', '6', '1523', null, 3, 2, 1);
-- field_instance
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (1, 0, 'Maintenance interval', 'maintenance_interval', 'Maintenance interval', null, null, 1, 1);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (2, 0, 'Asset status', 'asset_status', 'Asset status', null, null, 1, 2);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (3, 0, 'Cutting program', 'cutting_program', 'Cutting program', null, null, 1, 3);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (4, 0, 'Total cutting time', 'total_cutting_time', 'Total cutting time', null, null, 1, 4);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (5, 0, 'Remaining cutting time', 'remaining_cutting_time', 'Remaining cutting time', null, null, 1, 5);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (6, 0, 'Material name', 'material_name', 'Material name', null, null, 1, 6);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (7, 0, 'Material specification', 'material_specification', 'Material specification', null, null, 1, 7);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (8, 0, 'Plate thickness', 'plate_thickness', 'Plate thickness', null, null, 1, 8);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (9, 0, 'Hours til maintenance', 'hours_maintenance', 'Hours til maintenance', null, null, 1, 9);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (10, 0, 'Maintenance interval', 'maintenance_interval', 'Maintenance interval', null, null, 2, 10);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (11, 0, 'Asset status', 'asset_status', 'Asset status', null, null, 2, 11);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (12, 0, 'Differential pressure', 'differential_pressure', 'Differential pressure', null, null, 2, 12);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (13, 0, 'Low pressure', 'low_pressure', 'Low pressure', null, null, 2, 13);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (14, 0, 'Air consumption', 'air_consumption', 'Air consumption', null, null, 2, 14);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (15, 0, 'Air pressure', 'air_pressure', 'Air pressure', null, null, 2, 15);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (16, 0, 'Electric current', 'electric_current', 'Electric current', null, null, 2, 16);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (17, 0, 'Hours til maintenance', 'hours_maintenance', 'Hours til maintenance', null, null, 2, 17);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (18, 0, 'Maintenance interval', 'maintenance_interval', 'Maintenance interval', null, null, 3, 18);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (19, 0, 'Asset status', 'asset_status', 'Asset status', null, null, 3, 19);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (20, 0, 'Pressure bottle left', 'pressure_bottle_left', 'Pressure bottle left', null, null, 3, 20);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (21, 0, 'Pressure bottle right', 'pressure_bottle_right', 'Pressure bottle right', null, null, 3, 21);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (22, 0, 'Pressure pipe', 'pressure_pipe', 'Pressure pipe', null, null, 3, 22);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (23, 0, 'Pressure takeoff 1', 'pressure_takeoff_1', 'Pressure takeoff 1', null, null, 3, 23);
insert into field_instance (id, version, description, external_id, name, source_sensor_label, value, asset_id, field_source_id) values (24, 0, 'Hours til maintenance', 'hours_maintenance', 'Hours til maintenance', null, null, 3, 24);

