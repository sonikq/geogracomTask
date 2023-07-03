CREATE EXTENSION IF NOT EXISTS postgis;

ALTER TABLE geo_test.test_point 
	ADD COLUMN IF NOT EXISTS geom geometry(PointZ);
	
UPDATE geo_test.test_point
	SET geom = ST_SetSRID(ST_MakePoint(x, y, z), 4326);

SELECT ST_AsGeoJSON(geom) from geo_test.test_point;