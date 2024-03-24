SELECT
    result.election_year ,
    result.county        ,
    result.vote_total_dem,
    result.vote_total_rep,
    result.vote_total_oth,
    stat.registered_voters_dem    ,
    stat.registered_voters_rep    ,
    stat.registered_voters_oth    ,
    stat.registered_voters_dem + stat.registered_voters_rep + stat.registered_voters_oth AS registered_voters
FROM
    (
        SELECT
            county,
            election_year,
            CONCAT(ROUND((SUM(vote_democratic) / SUM(vote_total)) * 100, 1), '%') AS vote_total_dem,
            CONCAT(ROUND((SUM(vote_republican) / SUM(vote_total)) * 100, 1), '%') AS vote_total_rep,
            CONCAT(ROUND((SUM(vote_total - vote_democratic - vote_republican) / SUM(vote_total)) * 100, 1), '%') AS vote_total_oth
        FROM
            ncvotes.results
        WHERE
            type_partisan = 'Y'
        GROUP BY
            county,
            election_year) AS result
LEFT JOIN
    (
        SELECT
            county,
            YEAR(election_date) AS election_year,
            SUM(CASE WHEN choice_party = 'DEM' THEN total_voters ELSE 0 END) AS registered_voters_dem,
            SUM(CASE WHEN choice_party = 'REP' THEN total_voters ELSE 0 END) AS registered_voters_rep,
            SUM(CASE WHEN choice_party NOT IN ('DEM', 'REP') THEN total_voters ELSE 0 END) AS registered_voters_oth
        FROM
            ncvotes.stats
        GROUP BY
            county,
            election_year) AS stat
ON
    result.county        = stat.county
AND result.election_year = stat.election_year;