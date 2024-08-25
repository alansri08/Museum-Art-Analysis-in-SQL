# Museum Art Analysis SQL Project

## Description
This project contains a series of SQL queries aimed at analyzing museum art collections. The analysis includes identifying museums with a high proportion of Cubist paintings, determining artists whose works are displayed in multiple countries, and examining the most frequently painted subjects across different art styles.

## Table of Contents
1. [Queries](#queries)
2. [Usage](#usage)
3. [License](#license)

## Queries

### 1. Museums with the Highest Proportion of Cubist Paintings
- **Objective:** Identify the museums with the highest proportion of Cubist paintings and explore other art styles typically displayed in these museums.
- **SQL Query:**
  ```sql
  WITH Top_museums (museum_name, museum_id) AS (
      SELECT a.name AS museum_name, a.museum_id,
      AVG(CASE WHEN b.style = 'Cubism' THEN 1 ELSE 0 END) AS prop_of_cubist
      FROM public.museum a
      INNER JOIN public.work b ON a.museum_id = b.museum_id
      GROUP BY 1, 2
      ORDER BY prop_of_cubist DESC
      LIMIT 4
  )
  SELECT tp.museum_name, w.style, COUNT(w.style) AS style_count
  FROM Top_museums tp
  JOIN public.work w ON tp.museum_id = w.museum_id
  GROUP BY 1, 2
  ORDER BY 3 DESC;

### 2. Artists with Work Displayed in Multiple Countries
**Objective** Identify artists whose works are displayed in museums across multiple countries.
- **SQL Query:**
```sql
SELECT a.full_name, a.artist_id, COUNT(DISTINCT(m.country))
FROM public.artist a
JOIN public.work w ON a.artist_id = w.artist_id
JOIN public.museum m ON w.museum_id = m.museum_id
GROUP BY 1, 2
HAVING COUNT(DISTINCT m.country) > 1
ORDER BY 3 DESC;


