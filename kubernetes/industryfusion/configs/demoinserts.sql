select nextval('hibernate_sequence');
insert into company (version, description, image_key, name, type, id)
values (0, 'IBN 4.0 Smart Factory', 'ibn_logo.png', 'IBN 4.0 Smart Factory', 'MACHINE_CUSTOMER', 1);
select nextval('hibernate_sequence');
insert into company (version, description, image_key, name, type, id)
values (0, 'MicroStep Europa GmbH', 'microstep_logo.png', 'MicroStep', 'MACHINE_MANUFACTURER', 2);
select nextval('hibernate_sequence');
insert into company (version, description, image_key, name, type, id)
values (0, 'TEKA Absaug- und Entsorgungstechnologie GmbH', 'teka_logo.png', 'TEKA', 'MACHINE_MANUFACTURER', 3);
select nextval('hibernate_sequence');
insert into company (version, description, image_key, name, type, id)
values (0, 'IBEDA Sicherheitsgeräte und Gastechnik GmbH & Co. KG', 'ibeda_logo.png', 'Ibeda', 'MACHINE_MANUFACTURER',
        4);
select nextval('hibernate_sequence');
insert into company (version, description, image_key, name, type, id)
values (0, 'Industry Business Network 4.0 e.V.', 'ibn_logo.png', 'Industry Business Network 4.0', 'ECOSYSTEM_MANAGER',
        5);
select nextval('hibernate_sequence');
insert into location (version, city, company_id, country, latitude, line1, line2, longitude, name, type, zip, id)
values (0, 'Bad Wörishofen', 1, 'Germany', 48.019644, 'Rudolf-Diesel-Straße 16', 'Vordergebäude', 10.603576,
        'CompetenceCenter Süd', 'FABRICATION', '86825', 6);
select nextval('hibernate_sequence');
insert into location (version, city, company_id, country, latitude, line1, line2, longitude, name, type, zip, id)
values (0, 'Bad Wörishofen', 2, 'Germany', 48.021168, 'Messerschmittstraße 10', 'Vordergebäude', 10.604966,
        'Firmenzentrale', 'HEADQUARTER', '86825', 7);
select nextval('hibernate_sequence');
insert into location (version, city, company_id, country, latitude, line1, line2, longitude, name, type, zip, id)
values (0, 'Velen', 3, 'Germany', 51.895804, 'Industriestraße 13', 'Vordergebäude', 6.997579, 'Firmenzentrale',
        'HEADQUARTER', '46342', 8);
select nextval('hibernate_sequence');
insert into location (version, city, company_id, country, latitude, line1, line2, longitude, name, type, zip, id)
values (0, 'Neustadt (Wied)', 4, 'Germany', 50.625049, 'Bahnhofstraße 27', 'Vordergebäude', 7.433450, 'Firmenzentrale',
        'HEADQUARTER', '53577',
        9);
select nextval('hibernate_sequence');
insert into room (version, location_id, name, id)
values (0, 6, 'Showroom', 10);
select nextval('hibernate_sequence');
insert into room (version, location_id, name, id)
values (0, 6, 'Technikraum', 11);
select nextval('hibernate_sequence');
insert into asset_type_template (version, category, company_id, id)
values (0, 'CNC-Laserschneidanlage', 1, 12);
select nextval('hibernate_sequence');
insert into asset_type_template (version, category, company_id, id)
values (0, 'Stationäre Filteranlage', 1, 13);
select nextval('hibernate_sequence');
insert into asset_type_template (version, category, company_id, id)
values (0, 'Gasversorgungsanlage', 1, 14);
select nextval('hibernate_sequence');
insert into asset_series (version, model_name, company_id, id, asset_type_template_id)
values (0, 'MSF', 2, 15, 12);
select nextval('hibernate_sequence');
insert into asset_series (version, model_name, company_id, id, asset_type_template_id)
values (0, 'ZPF', 3, 16, 13);
select nextval('hibernate_sequence');
insert into asset_series (version, model_name, company_id, id, asset_type_template_id)
values (0, 'Gasversorgung aus 2x2 Sauerstoffflaschen', 4, 17, 14);
select nextval('hibernate_sequence');
insert into asset (id, version, name, description, category, guid, ce_certified, model_name, series_name, serial_number,
                   construction_date, connection_voltage, ac_frequency, max_operating_current, electrical_rating,
                   protection_class, image_key, handbook_key, video_key, installation_date, company_id, room_id,
                   asset_series_id, control_system_type, has_gateway, gateway_connectivity, external_id)
values (18, 1, 'MSF Compact 1001.20L', 'MSF CNC-Laser Cutter Machine', 'CNC-Laserschneidanlage',
        'f06ec371-68e9-404e-8cf5-1c8da37ecb3d', true, 'MSF Fiberlas Compact', 'MSF', '2551',
        '2019-10-11 00:00:00.000000', 400, 60, 80, 12, 43, 'microstep_asset_msf.jpg', null, null,
        '2019-10-18 00:00:00.000000', 1, 10, 15, 'CNC', true, 'SQL', 'laserschneider-msf-2551');
select nextval('hibernate_sequence');
insert into asset (id, version, name, description, category, guid, ce_certified, model_name, series_name, serial_number,
                   construction_date, connection_voltage, ac_frequency, max_operating_current, electrical_rating,
                   protection_class, image_key, handbook_key, video_key, installation_date, company_id, room_id,
                   asset_series_id, control_system_type, has_gateway, gateway_connectivity, external_id)
values (19, 1, 'ZPF 6H', 'ZPF 6H Filteranlage', 'Stationäre Filteranlage', '3a3040fc-3fd5-4cc2-ad98-b9d4e82902f9',
        true, 'ZPF 6H', 'ZPF', '1875', '2017-10-11 00:00:00.000000', 230, 60, 11, 5, 5, 'teka_asset_zpf.jpg',
        null, null, '2019-10-18 00:00:00.000000', 1, 11, 16, 'PLC S7-1200', true, 'PLC', 'ubuntu1804');
select nextval('hibernate_sequence');
insert into asset (id, version, name, description, category, guid, ce_certified, model_name, series_name, serial_number,
                   construction_date, connection_voltage, ac_frequency, max_operating_current, electrical_rating,
                   protection_class, image_key, handbook_key, video_key, installation_date, company_id, room_id,
                   asset_series_id, control_system_type, has_gateway, gateway_connectivity)
values (20, 1, 'Gasversorgung aus 2x2 Sauerstoffflaschen', 'automatische Gasumschaltung', 'automatische Gasumschaltung',
        '68f774e4-bb9e-4cd1-8e77-744d9ad79609', true, 'Gasversorgung aus 2x2 Sauerstoffflaschen',
        'Gasversorgung aus 2x2 Sauerstoffflaschen', '1523', '2019-10-11 00:00:00.000000', 230, 60, 1, 0, 23,
        'ibeda_asset_umschaltung.jpg', null, null, '2019-10-18 00:00:00.000000', 1, 10, 17, 'direct I/O', true, 'I/O');
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 0, 'Maintenance intervall', 18, 0, true, 'Maintenance intervall', true, 'number', 'h', 1500, 21);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 0, 'Maintenance intervall', 18, 0, true, 'Maintenance intervall', true, 'number', 'h', 1500, 22);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 0, 'Maintenance intervall', 18, 0, true, 'Maintenance intervall', true, 'number', 'h', 1500, 23);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 0, 'Asset status', 18, 0, true, 'asset_status', true, 'operatingstatus', null, 0, 24);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 0, 'Cutting program', '5ce55367-3402-4f4f-b57b-0ee4ed476d2e', 1, true, 'cutting_program', true, 'string',
        null, 0, 25);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 0, 'Total cutting time', 18, 0, true, 'total_cutting_time', true, 'number', 's', 0, 26);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 0, 'Remaining cutting time', '70db147e-d405-4323-ab31-3ecb922880e1', 1, true, 'remaining_cutting_time', true,
        'number', 's', 0, 27);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 0, 'Material name', '9b769fdd-97fc-40f6-b66a-4cd0c40af52b', 1, true, 'material_name', true, 'string', null,
        0, 28);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 0, 'Material specification', ' 07e531da-229b-440c-b970-24f13645db98', 1, true, 'material_specification',
        true, 'string', null, 0, 29);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 0, 'Plate thickness', '69d74b90-502f-4626-b88f-ee12ad993713', 1, true, 'plate_thickness', true, 'number',
        'mm', 0, 30);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 0, 'Hours till maintenance', '97dfcfae-a721-4bc4-860d-427e96e5c5be', 1, true, 'hours_maintenance', true,
        'number', 'h', 0, 31);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 0, 'Asset status', '', 0, true, 'asset_status', true, 'operatingstatus', null, 0, 32);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 2, 'Differential pressure', '10ea9395-df55-47c1-a7fa-96e3a7796734', 1, true, 'differential_pressure', true,
        'number', 'mbar', 0, 33);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 2, 'Low pressure', 'f7e9395b-b20d-4be0-a82e-9f6dd3e50023', 1, true, 'low_pressure', true, 'number', 'mbar',
        0, 34);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 2, 'Air consumption', '16184c6a-9511-4478-8ca3-9ceb05e449d8', 1, true, 'air_consumption', true, 'number',
        'l/min', 0, 35);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 4, 'Air pressure', 'dbd06f9f-1ffa-431f-bb81-bf1e0f9e1f9c', 1, true, 'air_pressure', true, 'number', 'bar', 0,
        36);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 4, 'Electric current', 'e7b5b2aa-501f-41f5-99f4-50a988ee1f43', 1, true, 'electric_current', true, 'number',
        'A', 0, 37);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 0, 'Hours till maintenance', '75829171-131b-4e50-b9ec-0094bc0386ca', 1, true, 'hours_maintenance', true,
        'number', 'h', 0, 38);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 0, 'Asset status', 20, 0, true, 'asset_status', true, 'operatingstatus', null, 0, 39);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 4, 'Pressure bottle left', 20, 0, true, 'pressure_bottle_left', true, 'number', 'bar', 0, 40);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 4, 'Pressure bottle right', 20, 0, true, 'pressure_bottle_right', true, 'number', 'bar', 0, 41);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 4, 'Pressure pipe', 20, 0, true, 'pressure_pipe', true, 'number', 'bar', 0, 42);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 4, 'Pressure takeoff 1', 20, 0, true, 'pressure_takeoff_1', true, 'number', 'bar', 0, 43);
select nextval('hibernate_sequence');
insert into field (version, accuracy, description, external_id, field_type, mandatory, name, overrideable, type, unit,
                   value, id)
values (0, 0, 'Hours till maintenance', 20, 0, true, 'hours_maintenance', true, 'number', 'h', 0, 44);
insert into asset_fields (asset_id, fields_id)
values (18, 21);
insert into asset_fields (asset_id, fields_id)
values (18, 24);
insert into asset_fields (asset_id, fields_id)
values (18, 25);
insert into asset_fields (asset_id, fields_id)
values (18, 26);
insert into asset_fields (asset_id, fields_id)
values (18, 27);
insert into asset_fields (asset_id, fields_id)
values (18, 28);
insert into asset_fields (asset_id, fields_id)
values (18, 29);
insert into asset_fields (asset_id, fields_id)
values (18, 30);
insert into asset_fields (asset_id, fields_id)
values (18, 31);
insert into asset_fields (asset_id, fields_id)
values (19, 22);
insert into asset_fields (asset_id, fields_id)
values (19, 32);
insert into asset_fields (asset_id, fields_id)
values (19, 33);
insert into asset_fields (asset_id, fields_id)
values (19, 34);
insert into asset_fields (asset_id, fields_id)
values (19, 35);
insert into asset_fields (asset_id, fields_id)
values (19, 36);
insert into asset_fields (asset_id, fields_id)
values (19, 37);
insert into asset_fields (asset_id, fields_id)
values (19, 38);
insert into asset_fields (asset_id, fields_id)
values (20, 23);
insert into asset_fields (asset_id, fields_id)
values (20, 39);
insert into asset_fields (asset_id, fields_id)
values (20, 40);
insert into asset_fields (asset_id, fields_id)
values (20, 41);
insert into asset_fields (asset_id, fields_id)
values (20, 42);
insert into asset_fields (asset_id, fields_id)
values (20, 43);
insert into asset_fields (asset_id, fields_id)
values (20, 44);