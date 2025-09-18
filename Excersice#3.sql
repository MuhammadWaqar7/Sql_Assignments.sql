-- Exercise 3: Suppose to table data of Exercise 1
SELECT
    parent.name AS category,
    child.name AS subcategory
FROM category parent
LEFT JOIN category child ON parent.id = child.parent_id
WHERE parent.parent_id IS NULL
ORDER BY parent.name ASC, child.name ASC;
