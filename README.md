This project examines the relationship between government actions and quality of life in North Carolina by analyzing representatives, legislative activities, expenditures, demographics, and voting patterns, aiming to track and illustrate this connection over time. To accomplish this, we require additional data and analytical reports to create a detailed view that allows for in-depth analysis across various dimensions. See the project list better understand the need and scope: <https://www.directedfusion.com/NC_project>

The database contains state finances, revenues, federal transfers, budget, demographics, individual income levels, household data, county facts, school evaluations, tax rates, voter registration, vote stats, government representatives, districts, and legislative activities. The data is meticulously extracted and prepped from many sources, transformed, and prepared for Looker Studio reporting and infographics.

# Questions / Goal examples
Primary goal is acquire a complete undersanding of NC counties.
- At the NC county level, is there a difference between voting party preferences and quality of life?
- Is there a correlation between tax rates and wealth?, education perfromance?
- Where are the top 5 and bottom 5 counties housing vacany rates?
- How have house values changed over time?

# Getting Started

## Tools:

- Python / Jupyter notebook
- SQL dB
- Excel
- Looker Studio

## Python
used to scrape data from the North Carolina General Assembly (State Legislature) website. The script populates the data into a MySQL database hosted on Windows 11 machine (using localhost server). Another Python script scrapes the aggregated NC county data from greatschools.org for the MySQL dB, but this data can only be used for personal use. This data will need to be replaced by the primary source available at the NC Department of Public Instruction site, <https://www.dpi.nc.gov/data-reports>. This site will need to be scraped.

Python script updates need to access your local MySQL instance (assumes you keep the same schema as provided with the SQL scripts). Replace with your info:

- **NCGov GreatSchools MySQL Importer.ipynb**: \[1 instance\]
  - &lt;<username&gt;>
  - &lt;<password&gt;>
- **NCLeg MySQL Importer.ipjnb**: \[11 instances\]
  - &lt;<username&gt;>
  - &lt;<password&gt;>

## MySQL
used to store and to manipulate data. The schemas with tables are stored in this repository. This database is structured:
### ncdata.sql.zip:
- **ncfin\\** \[state financial data\]
  - **acfr** \[Annual Comprehensive Financial Report 2014-2023\]
  - **budget** \[budget passed 10/2023\]
- **ncgov\\** \[county-level data\]
  - **acs_kpis** \[selected metrics from the US Census American Community Survey reports\]
  - **counties** \[facts about NC’s 100 counties: county seat, square miles, region, urbanization\]
  - **greatschools** \[aggregated county-level school performance data from Great Schools.org\]
- **ncleg\\** \[information and activities from the NC General Assembly site\]
  - **bills** \[list of all house and senate bills with last activity\]
  - **committees_2023** \[committee names in each chamber\]
  - **docs_2023** \[session laws\]
  - **filed_bills_house_2023** \[house bill titles, file date, short description, sponsor names, categorizations\]
  - **filed_bills_senate_2023** \[senate bill titles, file date, short description, sponsor names, categorizations\]
  - **house_members_with_titles** \[includes districts and counties represented\]
  - **laws_modified** \[bills becoming laws with effective date\]
  - **member_contact_info** \[office, phone, email\]
  - **member_titles** \[all titled members by member ID\]
  - **members_house** \[house members, district, counties, party, id, urls\]
  - **members_senate** \[senate members, district, counties, party, id, urls\]
  - **news_2023** \[links to significant activity info\]
- **ncvotes\\** \[vote information\]
  - **results** \[grouped by county, election, results, vote type categories\]
  - **stats** \[totals grouped by county, party, rate, ethnicity, gender, and age\]

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The **NC voter registration file** is too large for this repository (which would appear in as ncvotes\\voters).  
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; But you can download directly it from: <https://s3.amazonaws.com/dl.ncsbe.gov/data/ncvoter_Statewide.zip>

## Excel / Google Sheets 
Either may be used to further refine datasets. Power Query in Excel is also used. If needed, xlsx files can become available.

## Google Looker Studio
used for publishing insights. Data are tied together and presented here. Drill-down is limited until data is gathered to the municipality-level. <https://lookerstudio.google.com/u/0/reporting/054ddd1d-dcc8-4da9-a7ab-dde8f0bdfe2f/page/p_emc25ivaed>

## Project activity tracker
<https://www.directedfusion.com/NC_project>

If you would like to collaborate on gathering and discovering insights, please contact **Kurt Selden** at kurt >at< kurtselden -dot- com

*readme last updated 6-Apr-2024*
