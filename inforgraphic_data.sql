SELECT
	counties.county, 
	county_sqmi, county_seat, 3_regions, urbanization, 
	YEAR(greatschools_update) - 1 AS year_schools,
    students, total_schools, 
	below_average, average, above_average, 
	below_average_state, average_state, above_average_state,
	Reg_Part.election_year AS year_election,
	Reg_Part.county AS reg_part_county,
	Reg_Part.registered_voters,
	Reg_Part.registered_voters_dem,
	Reg_Part.vote_total_dem,
	Reg_Part.registered_voters_rep,
	Reg_Part.vote_total_rep,
	Reg_Part.registered_voters_oth, 
	Reg_Part.vote_total_oth,
	acs_kpis.Year AS year_demo, 
	pop_all, pop_voting_age, pop_age_median, individuals_FT_pop, 
	households_occupied_owner_value_median, households_rent_median_cost, 
	individuals_FT_income_average, individuals_FT_income_poor, individuals_FT_income_middle, individuals_FT_income_upper, 
	individuals_unemployed, individuals_health_coverage, individuals_poverty_rate, 
	(students_private_K12 / (students_public_K12 + students_private_K12)) AS students_private_pct,
	(1 - (students_private_K12 / (students_public_K12 + students_private_K12))) AS students_public_pct, 
	((pop_adult_white - `pop_white_hs>=`) / pop_adult_white) AS students_white_dropouts_pct, 
	((`pop_white_hs>=` - `pop_white_bas>=`) / pop_adult_white) AS students_white_hsgrads_pct, 
	(`pop_white_bas>=` / pop_adult_white) AS students_white_bgrads_pct, 
	((pop_adult_black - `pop_black_hs>=`) / pop_adult_black) AS students_black_dropouts_pct, 
	((`pop_black_hs>=` - `pop_black_bas>=`) / pop_adult_black) AS students_black_hsgrads_pct, 
	(`pop_black_bas>=` / pop_adult_black) AS students_black_bgrads_pct, 
	((pop_adult_asian - `pop_asian_hs>=`) / pop_adult_asian) AS students_asian_dropouts_pct, 
	((`pop_asian_hs>=` - `pop_asian_bas>=`) / pop_adult_asian) AS students_asian_hsgrads_pct, 
	(`pop_asian_bas>=` / pop_adult_asian) AS students_asian_bgrads_pct, 
	((pop_adult_multi - `pop_multi_hs>=`) / pop_adult_multi) AS students_multi_dropouts_pct, 
	((`pop_multi_hs>=` - `pop_multi_bas>=`) / pop_adult_multi) AS students_multi_hsgrads_pct, 
	(`pop_multi_bas>=` / pop_adult_multi) AS students_multi_bgrads_pct, 
	((pop_adult_other - `pop_other_hs>=`) / pop_adult_other) AS students_other_dropouts_pct, 
	((`pop_other_hs>=` - `pop_other_bas>=`) / pop_adult_other) AS students_other_hsgrads_pct, 
	(`pop_other_bas>=` / pop_adult_other) AS students_other_bgrads_pct, 
	((pop_adult_hispanic - `pop_hispanic_hs>=`) / pop_adult_hispanic) AS students_hispanic_dropouts_pct, 
	((`pop_hispanic_hs>=` - `pop_hispanic_bas>=`) / pop_adult_hispanic) AS students_hispanic_hsgrads_pct, 
	(`pop_hispanic_bas>=` / pop_adult_hispanic) AS students_hispanic_bgrads_pct, 
	(pop_adult_white + pop_adult_black + pop_adult_asian + pop_adult_multi + pop_adult_other) AS pop_adult_total, 
	(pop_adult_white / (pop_adult_white + pop_adult_black + pop_adult_asian + pop_adult_multi + pop_adult_other)) AS pop_adult_white_pct, 
	(pop_adult_black / (pop_adult_white + pop_adult_black + pop_adult_asian + pop_adult_multi + pop_adult_other)) AS pop_adult_black_pct, 
	(pop_adult_asian / (pop_adult_white + pop_adult_black + pop_adult_asian + pop_adult_multi + pop_adult_other)) AS pop_adult_asian_pct, 
	(pop_adult_multi / (pop_adult_white + pop_adult_black + pop_adult_asian + pop_adult_multi + pop_adult_other)) AS pop_adult_multi_pct, 
	(pop_adult_other / (pop_adult_white + pop_adult_black + pop_adult_asian + pop_adult_multi + pop_adult_other)) AS pop_adult_other_pct, 
	(pop_adult_hispanic / (pop_adult_white + pop_adult_black + pop_adult_asian + pop_adult_multi + pop_adult_other)) AS pop_adult_hispanic_pct
FROM ncgov.acs_kpis

LEFT JOIN
	ncgov.counties
	ON ncgov.acs_kpis.county = counties.county

LEFT JOIN
	ncgov.greatschools
	ON greatschools.county_ID = counties.county_ID

LEFT JOIN
	(
	SELECT
		result.election_year ,
		result.county        ,
        result.vote_total_dem,
		result.vote_total_rep,
		result.vote_total_oth,
        stat.registered_voters_dem,
		stat.registered_voters_rep,
		stat.registered_voters_oth,
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
		AND result.election_year = stat.election_year
	) AS Reg_Part
	ON  Reg_Part.county =  counties.county
	AND Reg_Part.election_year = acs_kpis.Year
;