# Netflix movies and tv shows using SQL 

[Netflix Logo](netflix logo.png)

## Objective

🎯 Project Objective
The primary goal of this SQL project is to perform comprehensive data analysis on a content catalog (such as Netflix, Prime Video, etc.) to uncover insights about content types, ratings, release trends, and more. Through structured queries and data exploration, the project aims to:

🔍 Content Type Distribution
Analyze the proportion of Movies vs. TV Shows.

Understand how different content types are distributed across the platform.

⭐ Rating Analysis
Identify the most frequently occurring ratings for both Movies and TV Shows.

Explore how ratings differ between content types and potentially across regions.

📅 Release Year Trends
Investigate content trends over the years to determine:

Which years saw the most releases.

Whether there has been an increase in content production in recent years.

🌍 Country-wise Breakdown
List and analyze top contributing countries in terms of content production.

Understand geographic diversity in the catalog.

⏱️ Duration Analysis
Explore duration data to:

Categorize movies by length (e.g., short, medium, long).

Compare average durations between Movies and TV Shows.

🧠 Keyword & Criteria-based Categorization
Search and filter content based on specific keywords (e.g., "crime", "drama", "romance").

Apply conditional logic to categorize or tag content by themes or other attributes.

By the end of this analysis, the project delivers valuable insights into how streaming content is structured and distributed, helping inform decisions in content strategy, platform design, or user recommendation systems.



## Dataset
The data for this project is sourced from the Kaggle dataset:

Dataset Link:https://www.kaggle.com/datasets/shivamb/netflix-shows?resource=download

## Schema 
CREATE TABLE netflix_titles (
    show_id VARCHAR(20),
    type VARCHAR(7),
    title VARCHAR(104),
    director VARCHAR(208),
    cast TEXT,
    country VARCHAR(123),
    date_added VARCHAR(19),
    release_year INT,
    rating VARCHAR(8),
    duration VARCHAR(10),
    listed_in VARCHAR(79),
    description TEXT
);

 

