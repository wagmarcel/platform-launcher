create table if not exists machinesstate
(
	machineserialno integer,
	machinenameint varchar,
	machineactualoperationmode integer,
	programname varchar,
	materialname varchar
);

alter table machinesstate owner to postgresadmin;

create table if not exists company
(
	id bigint not null
		constraint company_pkey
			primary key,
	version bigint,
	description varchar(255),
	image_key varchar(255),
	name varchar(255),
	type varchar(255) not null
);

alter table company owner to postgresadmin;

create table if not exists asset_type_template
(
	id bigint not null
		constraint asset_type_template_pkey
			primary key,
	version bigint,
	ac_frequency real,
	category varchar(255),
	ce_certified boolean,
	connection_voltage real,
	construction_date timestamp,
	description varchar(255),
	electrical_rating real,
	guid uuid,
	handbook_key varchar(255),
	image_key varchar(255),
	installation_date timestamp,
	max_operating_current real,
	model_name varchar(255),
	name varchar(255),
	protection_class varchar(255),
	serial_number varchar(255),
	series_name varchar(255),
	video_key varchar(255),
	company_id bigint not null
		constraint fk2tp2uh92bso7x8ag7rbprq5hq
			references company
);

alter table asset_type_template owner to postgresadmin;

create table if not exists asset_series
(
	id bigint not null
		constraint asset_series_pkey
			primary key,
	version bigint,
	ac_frequency real,
	category varchar(255),
	ce_certified boolean,
	connection_voltage real,
	construction_date timestamp,
	description varchar(255),
	electrical_rating real,
	guid uuid,
	handbook_key varchar(255),
	image_key varchar(255),
	installation_date timestamp,
	max_operating_current real,
	model_name varchar(255),
	name varchar(255),
	protection_class varchar(255),
	serial_number varchar(255),
	series_name varchar(255),
	video_key varchar(255),
	asset_type_template_id bigint not null
		constraint fkj0662el86i6rsuj1gyhgsq55r
			references asset_type_template,
	company_id bigint not null
		constraint fktfuf4avwd4enyq6nu865lcouw
			references company
);

alter table asset_series owner to postgresadmin;

create table if not exists field
(
	id bigint not null
		constraint field_pkey
			primary key,
	version bigint,
	accuracy double precision,
	description varchar(255),
	external_id varchar(255),
	field_type integer,
	mandatory boolean,
	name varchar(255),
	overrideable boolean,
	type varchar(255),
	unit varchar(255),
	value varchar(255)
);

alter table field owner to postgresadmin;

create table if not exists asset_series_fields
(
	asset_series_id bigint not null
		constraint fkcx44s5029bgwyn7n2int9cs5t
			references asset_series,
	fields_id bigint not null
		constraint uk_pwo602sitctue1ojv4v2xcs6w
			unique
		constraint fk16g9ohvq5bfk27lnjnqpu4dgi
			references field,
	constraint asset_series_fields_pkey
		primary key (asset_series_id, fields_id)
);

alter table asset_series_fields owner to postgresadmin;

create table if not exists asset_type_template_fields
(
	asset_type_template_id bigint not null
		constraint fkcs221w9uln420fiy8kqvtuaw4
			references asset_type_template,
	fields_id bigint not null
		constraint uk_3j3htiypr1j9aumx7wurkaxyv
			unique
		constraint fkt3qr8fhf0tmcs7oihpyt1u7t2
			references field,
	constraint asset_type_template_fields_pkey
		primary key (asset_type_template_id, fields_id)
);

alter table asset_type_template_fields owner to postgresadmin;

create table if not exists field_value_override
(
	id bigint not null
		constraint field_value_override_pkey
			primary key,
	version bigint,
	value varchar(255),
	field_id bigint not null
		constraint fkkjrrory1m1l541qe6k0cdkvkw
			references field
);

alter table field_value_override owner to postgresadmin;

create table if not exists location
(
	id bigint not null
		constraint location_pkey
			primary key,
	version bigint,
	city varchar(255),
	country varchar(255),
	image_key varchar(255),
	latitude double precision,
	line1 varchar(255),
	line2 varchar(255),
	longitude double precision,
	name varchar(255),
	type varchar(255) not null,
	zip varchar(255),
	company_id bigint not null
		constraint fkbxoiqd2lmvk7c3r3qhfoou2py
			references company
);

alter table location owner to postgresadmin;

create table if not exists room
(
	id bigint not null
		constraint room_pkey
			primary key,
	version bigint,
	image_key varchar(255),
	name varchar(255),
	location_id bigint not null
		constraint fkrqejnp96gs9ldf7o6fciylxkt
			references location
);

alter table room owner to postgresadmin;

create table if not exists asset
(
	id bigint not null
		constraint asset_pkey
			primary key,
	version bigint,
	ac_frequency real,
	category varchar(255),
	ce_certified boolean,
	connection_voltage real,
	construction_date timestamp,
	description varchar(255),
	electrical_rating real,
	guid uuid,
	handbook_key varchar(255),
	image_key varchar(255),
	installation_date timestamp,
	max_operating_current real,
	model_name varchar(255),
	name varchar(255),
	protection_class varchar(255),
	serial_number varchar(255),
	series_name varchar(255),
	video_key varchar(255),
	control_system_type varchar(255),
	external_id varchar(255),
	gateway_connectivity varchar(255),
	has_gateway boolean,
	asset_series_id bigint not null
		constraint fkkmi7kne0t0s5t27pemap8r0so
			references asset_series,
	company_id bigint not null
		constraint fkbnbckrvy4gleqsugkauihx7d7
			references company,
	room_id bigint
		constraint fk3wluo9ljton4rckdhy9sxpdaq
			references room
);

alter table asset owner to postgresadmin;

create table if not exists asset_fields
(
	asset_id bigint not null
		constraint fkfjsbwn70lcoykrkmbxey0pf51
			references asset,
	fields_id bigint not null
		constraint uk_54s7h0xfg7ifw33e9887mnxdu
			unique
		constraint fkb2nqxggjxcey5if5sd7269gis
			references field,
	constraint asset_fields_pkey
		primary key (asset_id, fields_id)
);

alter table asset_fields owner to postgresadmin;

