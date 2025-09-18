CREATE TABLE runner (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    main_distance INTEGER NOT NULL,
    age INTEGER NOT NULL,
    is_female INTEGER NOT NULL
);

CREATE TABLE event (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    start_date TEXT NOT NULL,
    city TEXT NOT NULL
);

CREATE TABLE runner_event (
    runner_id INTEGER NOT NULL,
    event_id INTEGER NOT NULL,
    PRIMARY KEY (runner_id, event_id),
    FOREIGN KEY (runner_id) REFERENCES runner(id),
    FOREIGN KEY (event_id) REFERENCES event(id)
);

-- Insert sample data
INSERT INTO runner (id, name, main_distance, age, is_female) VALUES
(1, 'John Smith', 5000, 25, 0),
(2, 'Emma Johnson', 10000, 32, 1),
(3, 'Mike Brown', 5000, 19, 0),
(4, 'Sarah Davis', 5000, 28, 1),
(5, 'Tom Wilson', 10000, 45, 0),
(6, 'Lisa Anderson', 5000, 22, 1),
(7, 'David Lee', 21000, 35, 0),
(8, 'Amy Chen', 5000, 29, 1),
(9, 'Robert Kim', 5000, 18, 0),
(10, 'Maria Garcia', 10000, 55, 1);

INSERT INTO event (id, name, start_date, city) VALUES
(1, 'London Marathon', '2024-04-21', 'London'),
(2, 'New Year Run', '2024-01-01', 'New York'),
(3, 'Spring Half Marathon', '2024-03-15', 'Chicago'),
(4, 'Autumn 10K', '2024-10-10', 'Boston'),
(5, 'Winter Race', '2024-12-15', 'Seattle'); -- Event with no participants

INSERT INTO runner_event (runner_id, event_id) VALUES
(1, 1), (1, 2),
(2, 1), (2, 3),
(3, 2),
(4, 1), (4, 2), (4, 3),
(5, 1),
(6, 2),
(7, 3),
(8, 2),
(9, 1), (9, 2),
(10, 4);

-- Exercise 4
SELECT
    main_distance,
    COUNT(*) AS runners_number
FROM runner
GROUP BY main_distance
HAVING COUNT(*) > 3
ORDER BY main_distance ASC;
