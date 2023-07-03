CREATE SCHEMA IF NOT EXISTS geo_test;
	
CREATE TABLE IF NOT EXISTS geo_test.test_point (
	id INTEGER NOT NULL,
	task INTEGER,
	x DOUBLE PRECISION,
	y DOUBLE PRECISION,
	z DOUBLE PRECISION
);
CREATE TABLE IF NOT EXISTS geo_test.task (
	id INTEGER NOT NULL PRIMARY KEY,
	name TEXT
);

CREATE INDEX IF NOT EXISTS test_point_task_id_index
	ON geo_test.test_point(task, id);
	
ALTER TABLE geo_test.test_point DROP CONSTRAINT IF EXISTS test_point_pkey;

ALTER TABLE geo_test.test_point 
	ADD	PRIMARY KEY (id);
	
ALTER TABLE geo_test.test_point DROP CONSTRAINT IF EXISTS fk_task_id;

ALTER TABLE geo_test.test_point
   ADD CONSTRAINT fk_task_id
   FOREIGN KEY (task) 
   REFERENCES geo_test.task(id);
   
INSERT INTO geo_test.task
	VALUES(1, 'task1')
	ON CONFLICT DO NOTHING;
INSERT INTO geo_test.test_point 
	VALUES(1, 1, 1, 0, 0)
	ON CONFLICT DO NOTHING;
INSERT INTO geo_test.test_point
	VALUES(2, 1, 0, 1, 0)
	ON CONFLICT DO NOTHING;
INSERT INTO geo_test.test_point
	VALUES(3, 1, 0, 0, 1)
	ON CONFLICT DO NOTHING;

SELECT * FROM geo_test.test_point WHERE id = 2;
