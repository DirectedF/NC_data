# Explore Government Impact on Life Quality in North Carolina

## Project Overview
This project delves into how government actions influence quality of life in North Carolina by analyzing legislative activities, expenditures, demographics, and voting patterns. We aim to uncover trends and insights to inform public policy and enhance citizen understanding. Learn more about our project scope here: <https://www.directedfusion.com/NC_project>

## Data Repository
We* compile and analyze a wealth of data including:
- **State Finances**: Budgets, revenues, and federal transfers.
- **Demographics**: County-specific data including income levels and household statistics.
- **Education**: School evaluations and tax rates.
- **Political Dynamics**: Voter registration stats and legislative activities.

## Project Goals
Our mission is to provide data-driven insights into how governmental decisions affect North Carolina's residents and who those residents are. This project aims to be a resource for policymakers, academics, and the public to foster informed decision-making.

## Key Questions
We seek to answer questions like:
- Do voting party preferences correlate with quality of life at the county level?
- What is the relationship between tax rates and wealth or public school performance?
- How effective are the most tenured state legislators in representing their districts?
- Which areas benefit the most from state and federal funding?

## Help Wanted
**Join our team of data-driven enthusiasts!** We're looking for expertise in data collection, analysis, and visualization. Specific needs include:
- **Data Acquisition**: Documenting and sourcing data.
- **Data Transformation**: Preparing data for Looker Studio and infographics.
- **Process Design**: Implementing routines for data updates.

Learn more about how you can contribute contact kurt@kurtselden.com.

# Getting Started -Details

## Tools Utilized:
- **Python / Jupyter Notebook**: For data scraping and analysis.
- **SQL Database**: To manage and manipulate our extensive datasets.
- **Excel / Google Sheets**: For data refinement using Power Query.
- **Google Looker Studio**: For visualizing and publishing insights.

### Python
used to scrape data from the North Carolina General Assembly (State Legislature) website. The script populates the data into a MySQL database hosted on Windows 11 machine (using localhost server). Another Python script scrapes the aggregated NC county data from greatschools.org for the MySQL dB, but this data can only be used for personal use. This data will need to be replaced by the primary source available at the NC Department of Public Instruction site, <https://www.dpi.nc.gov/data-reports>. This site will need to be scraped.

Python script updates need to access your local MySQL instance (assumes you keep the same schema as provided with the SQL scripts). Replace with your info:

- **NCGov GreatSchools MySQL Importer.ipynb**: \[1 instance\]
  - &lt;<username&gt;>
  - &lt;<password&gt;>
- **NCLeg MySQL Importer.ipjnb**: \[11 instances\]
  - &lt;<username&gt;>
  - &lt;<password&gt;>

### MySQL
used to store and to manipulate data. The database installation scripts, with data, and its structure is within:
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

### Excel / Google Sheets 
Either may be used to further refine datasets. Power Query in Excel is also used. If needed, xlsx files can become available.

### Google Looker Studio
used for publishing insights. Data are tied together and presented here. Drill-down is limited until data is gathered to the municipality-level. <https://lookerstudio.google.com/u/0/reporting/054ddd1d-dcc8-4da9-a7ab-dde8f0bdfe2f/page/p_emc25ivaed>

### Project activity tracker
<https://www.directedfusion.com/NC_project>

*readme last updated 12-Apr-2024*
* Note: the use of the word 'we' and 'our' is currently the royal usage.
