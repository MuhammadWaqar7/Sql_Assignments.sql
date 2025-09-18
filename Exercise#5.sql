-- Assuming Data from Exercise 4
SELECT
    CAST(e.name AS VARCHAR(100)) AS event_name,
    COUNT(re.runner_id) AS runner_count
FROM event e
LEFT JOIN runner_event re ON e.id = re.event_id
GROUP BY CAST(e.name AS VARCHAR(100)), e.id
ORDER BY runner_count DESC, CAST(e.name AS VARCHAR(100)) ASC;
