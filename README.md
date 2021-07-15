# Bike Sharing 

## Overview
In a matter of a few years, bike sharing has become an increasingly popular service for several reasons. Not only is it a fast, convenient, and eco-friendly transportation option for city residents, but it is also a low-cost and fun option for tourists. Despite how popular this service has become, there are various opportunities to streamline the rental process and improve user experience. This starts by addressing common issues (bike build-up at certain docks, lack of user guidance, uneven bike traffic, etc.) and brainstorming potential solutions, which I explored through the analysis of given data.

## Data
![ER Diagram](https://github.com/rahatchoudery/bike-sharing/blob/cbf56c42dfab8ff03cf75449ae6240acda19a9cc/ER_Diagram.png)

The ER Diagram pictured above outlines the design of the database. As represented in the image:
- one user can have many trips, but a trip can be assigned to only one user,
- one station can have many trips, but a trip can only be assigned one start and end station, 
- one bike can have many trips, but each trip can only be taken on one bike.  

Data was sourced from [Citi Bike NYC](https://www.citibikenyc.com/system-data) and manually broken in four databases: Trip Info, User Info, Bike Info, and Station Info

## Queries
- [Total Seconds a Bike Has Been Ridden](https://github.com/rahatchoudery/bike-sharing/blob/b786232879e29e0346a86ca5fa635c2ddf3c3341/bikeSharing.sql#L12)
    - With poorly maintained bikes being one of Citi Bike’s biggest issues, this query helps keep track of how many seconds a bike has been ridden. Using this information, bikes that have been ridden longer can be tracked and maintained accordingly.

- [Most Popular Paths Between Stations](https://github.com/rahatchoudery/bike-sharing/blob/b786232879e29e0346a86ca5fa635c2ddf3c3341/bikeSharing.sql#L33)
    - Improving user experience has been a major focus. Using this query to determine the most popular paths allows the company to recommend these paths to new or curious riders, especially since tourists make up a large percentage of users. There also might be reasoning behind some paths' popularity (scenic route, does not have a lot of pesky hills, is some kind of shortcut, etc.).

- [Most Popular End Stations Among Women](https://github.com/rahatchoudery/bike-sharing/blob/b786232879e29e0346a86ca5fa635c2ddf3c3341/bikeSharing.sql#L48)
    - According to the results, women are more likely to end their rides at stations located in nicer, busier areas. This information can be used for many reasons. For example, if a male rider is headed towards a crowded station that is typically popular among women, Citi Bike can recommend another station nearby. Another interesting use of this information is advertising. If a station is more popular among women, businesses that target a female audience may be interested in advertising there.

- [Most Popular Start Station Between Specific Time Period](https://github.com/rahatchoudery/bike-sharing/blob/b786232879e29e0346a86ca5fa635c2ddf3c3341/bikeSharing.sql#L71)
    - This query has a focus on improving user experience and distributing bikes evenly among stations. The most popular start station between specific times can lead to the assumption that that station will have plenty of open docks for bike drop-offs. So, if there is a rider in-transit looking to end their ride soon, an added feature on the app can suggest a popular start station around that time. This will ultimately help balance out the number of bikes leaving and entering a dock.

- [Customers Who Rode a Classic Bike for Over 15 Mins](https://github.com/rahatchoudery/bike-sharing/blob/b786232879e29e0346a86ca5fa635c2ddf3c3341/bikeSharing.sql#L80)
    - This query shows patterns in the data while focusing on a specific group of people – customers who rode a Classic Bike for over 15 minutes. For example, if a majority of the people in this category are between the ages of 20 and 40, the company can look into reaching out to people in that age range to offer discounts because they are more likely to be interested. This would eventually result in stronger business and more customers.
