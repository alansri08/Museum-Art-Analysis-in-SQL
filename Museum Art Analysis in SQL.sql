/*
What museums have the highest proportion of cubist paintings? 
What other styles of art do these museums typically display?
*/

with Top_museums (museum_name, museum_id) as
	(select a.name as museum_name, a.museum_id
	,avg(case when b.style= 'Cubism' then 1 else 0 end) as prop_of_cubist
	from public.museum a
	inner join public.work b on a.museum_id = b.museum_id
	group by 1,2
	order by (prop_of_cubist) desc
	limit 5)
	
select tp.museum_name, w.style, count(w.style) as style_count
from Top_museums tp
join public.work w 
on tp.museum_id=w.museum_id
group by 1,2
order by 1 desc
 

/*
Which artists have their work displayed in museums in many different countries?
*/
	
select a.full_name, a.artist_id, count(distinct(country))
from public.artist a
join public.work w 
on a.artist_id = w.artist_id
join public.museum m 
on w.museum_id= m.museum_id
group by 1, 2
having count(distinct m.country) > 1
order by 3 desc


/*
Create a table that shows the most frequently painted subject for each style of painting, 
how many paintings there were for the most frequently painted subject in that style, 
how many paintings there are in that style overall, and the percent of paintings in that style
with the most frequent subject. Exclude cases where there is no information on the subject of the painting. 
*/

WITH subject_count AS (
SELECT style, 
	subject,
	COUNT (*) as count_of_subject
    FROM public.work w
    JOIN public.subject s
    ON w.work_id = s.work_id
    GROUP BY 1,2
)
,maximium_count AS(
	SELECT style, 
       Max(count_of_subject) as max_count_subject
    FROM subject_count
	GROUP BY 1
)
,most_frequent_subject AS (
	SELECT 
	  sc.style,
	  sc.subject,
	  sc.count_of_subject
	FROM subject_count sc
	JOIN maximium_count mc
	ON sc.style = mc.style 
	AND sc.count_of_subject = mc.max_count_subject
) 
,total_painitng_in_style AS (
	SELECT w.style, 
	COUNT (*) as total_painting_count 
	FROM public.work w
	JOIN public.subject s ON w.work_id=s.work_id
	WHERE s.subject IS NOT NULL
	GROUP BY 1
)
SELECT 
	mfs.style,
    mfs.subject,
    mfs.count_of_subject,
    tps.total_painting_count,
    (count_of_subject::decimal/total_painting_count::decimal * 100) AS percent_painting_in_style
FROM most_frequent_subject mfs
JOIN total_painitng_in_style tps
ON mfs.style=tps.style


	     
	   