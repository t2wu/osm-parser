--
--
-- This SQL script creates the DB model used to store information extracted during a .osm file parsing.
--
-- 
SELECT InitSpatialMetaData();
INSERT INTO spatial_ref_sys (srid, auth_name, auth_srid, ref_sys_name, proj4text) VALUES (4326, 'epsg', 4326,'WGS 84', '+proj=longlat +ellps=WGS84 +datum=WGS84 +no_defs');
CREATE TABLE "main"."nodes" ("nodeid" INTEGER PRIMARY KEY  NOT NULL , "latitude" DOUBLE NOT NULL , "longitude" DOUBLE NOT NULL );
CREATE TABLE "main"."ways" ("wayid" INTEGER PRIMARY KEY NOT NULL, "wayinfoid" INTEGER);
CREATE TABLE "main"."ways_nodes" ("wayid" INTEGER NOT NULL , "nodeid" INTEGER NOT NULL);
CREATE TABLE "main"."nodes_tags" ("nodeid" INTEGER NOT NULL , "key" VARCHAR[100], "value" TEXT);
CREATE TABLE "main"."ways_tags" ("wayid" INTEGER NOT NULL , "key" VARCHAR[100], "value" TEXT);
CREATE TABLE "main"."relations" ("relationid" INTEGER NOT NULL);
CREATE TABLE "main"."relations_members" ("relationid" INTEGER NOT NULL, "type" VARCHAR[100], "ref" INTEGER NOT NULL , "role" VARCHAR[100]);
CREATE TABLE "main"."relations_tags" ("relationid" INTEGER NOT NULL , "key" VARCHAR[100], "value" TEXT);
SELECT AddGeometryColumn('ways', 'geom', 4326, 'LINESTRING', 2);
--CREATE TABLE roadsDefinitions ("ref" VARCHAR[10], "name" VARCHAR[100], "course" VARCHAR[2], "section" VARCHAR[2]);
CREATE TABLE ways_info ("ref" VARCHAR[10], "name" VARCHAR[100]);
