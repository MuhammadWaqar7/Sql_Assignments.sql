
CREATE TABLE runner (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    main_distance INT NOT NULL,
    age INT NOT NULL,
    is_female BOOLEAN NOT NULL
);

CREATE TABLE event (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    start_date DATE NOT NULL,
    city VARCHAR(100) NOT NULL
);

CREATE TABLE runner_event (
    runner_id INT NOT NULL,
    event_id INT NOT NULL,
    PRIMARY KEY (runner_id, event_id),
    FOREIGN KEY (runner_id) REFERENCES runner(id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

-- After Data inserting exercise#4 Organize Runners Into Groups
SELECT
    main_distance,
    COUNT(*) AS runners_number
FROM runner
GROUP BY main_distance
HAVING COUNT(*) > 3
ORDER BY main_distance ASC;
