SELECT c.NAME, COUNT(p.ID) AS project_count
FROM client c
LEFT JOIN project p ON c.ID = p.CLIENT_ID
GROUP BY c.ID
HAVING COUNT(p.ID) = (
  SELECT COUNT(ID)
  FROM project
  GROUP BY CLIENT_ID
  ORDER BY COUNT(ID) DESC
  LIMIT 1
);