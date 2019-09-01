DROP TABLE IF EXISTS tasks;

CREATE TABLE tasks (
    ID SERIAL PRIMARY KEY, 
    title VARCHAR(255) NOT NULL, 
    description TEXT, 
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
    updated_at TIMESTAMP, 
    completed BOOLEAN NOT NULL DEFAULT false
    );

ALTER TABLE tasks
DROP COLUMN completed;

ALTER TABLE tasks
ADD COLUMN completed_at TIMESTAMP;

ALTER TABLE tasks
ALTER COLUMN updated_at SET NOT NULL;

ALTER TABLE tasks
ALTER COLUMN updated_at SET DEFAULT CURRENT_TIMESTAMP;

INSERT INTO tasks (title, description, created_at, updated_at, completed_at)
VALUES ('Study SQL', 'Complete this exercise', now(), now(), NULL);

INSERT INTO tasks (title, description)
VALUES ('Study PostgreSQL', 'Read all the documentation');

SELECT title
FROM tasks
WHERE completed_at IS NULL;

UPDATE tasks
SET completed_at = now()
WHERE title = 'Study SQL';

SELECT title, description
FROM tasks
WHERE completed_at IS NULL;

SELECT * 
FROM tasks
ORDER BY created_at DESC;

INSERT INTO tasks (title, description)
VALUES ('mistake 1', 'a test entry');

INSERT INTO tasks (title, description)
VALUES ('mistake 2', 'another test entry');

INSERT INTO tasks (title, description)
VALUES ('third mistake', 'another test entry');

SELECT title
FROM tasks
WHERE title LIKE '%mistake%';

DELETE FROM tasks
WHERE title = 'mistake 1';

SELECT title, description
FROM tasks
WHERE title LIKE '%mistake%';

DELETE FROM tasks
WHERE title LIKE '%mistake%';

SELECT * 
FROM tasks
ORDER BY title ASC;

