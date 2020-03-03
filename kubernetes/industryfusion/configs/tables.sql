create table company ( version VARCHAR(255), description VARCHAR(1000), image_key VARCHAR(255), name VARCHAR(255), type VARCHaR(255), id integer)
create table location ( version integer, city VARCHAR(255) , company_id integer, contry VARCHAR(255), latitude real, VARCHAR(255), line1, VARCHAR(255)  line2, VARCHaR(255) longitude real, name VARCHAR(255),tpye VARCHAR(255), zip VARCHAR(255), id integer)
create table room (version integer, location_id integer, name VAR(255), id integer)
create table assert_type_template (version integer, caegory VARCHAR(255), company_id integer, id integer)
create table asset_series (version integer, model_name VARCHaR(255), company_id integer, id integer, asset_type_template_id integer)
create table asset (id integer, version integer, name VARCHAR(255), description VARCHAR(255), category VARCHAR(255), guid uuid , ce_certified BOOLEAN, model_name VARCHAR(255), series_name VARCHAR(255), serial_number VARCHAR(255),
                   construction_date DATE, connection_voltage real, ac_frequency real, max_operating_current real, electrical_rating VARCHAR(255),
                   protection_class VARCHAR(255), image_keyVARCHAR(255), handbook_key VARCHAR(255), video_key VARCHAR(255), installation_date DATE, company_id integer, room_id integer,
                   asset_series_id integer, control_system_type VARCHAR(255), has_gateway BOOLEAN, gateway_connectivity VARCHAR(255), external_id VARCHAR(255))
