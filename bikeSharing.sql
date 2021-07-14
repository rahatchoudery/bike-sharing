use BikeSharing;

-- Query 01
-- Duration for Users Above 50
SELECT UserInfo.UserID, UserInfo.Gender, UserInfo.BirthYear, UserInfo.Country,
TripInfo.TripDuration
FROM TripInfo INNER JOIN UserInfo on (TripInfo.UserID = UserInfo.UserID)
WHERE UserInfo.BirthYear <= 1969
ORDER BY UserInfo.BirthYear ASC;

-- Query 02
-- Total Seconds a Bike Has Been Ridden
SELECT TripInfo.BikeID, BikeInfo.BikeType,
SUM(TripInfo.TripDuration) as TotalDuration
FROM BikeInfo INNER JOIN TripInfo on (BikeInfo.BikeID = TripInfo.BikeID)
GROUP BY TripInfo.BikeID
ORDER BY TotalDuration DESC;

-- Query 03
-- Longest Trip
SELECT *
FROM TripInfo
ORDER BY TripDuration DESC
LIMIT 1;

-- Query 04
-- Find Average Duration of Customers vs Subscribers
SELECT UserInfo.UserType, ROUND(AVG(TripInfo.TripDuration)) as 'AverageDuration'
FROM UserInfo INNER JOIN TripInfo on (UserInfo.UserID = TripInfo.UserID)
GROUP BY UserInfo.UserType;

-- Query 05*
-- Most Popular Paths Between Stations
SELECT TripInfo.StartStationID, TripInfo.EndStationID, Count(*) as Count
FROM TripInfo
GROUP BY StartStationID, EndStationID
ORDER BY Count DESC
LIMIT 5;

-- Query 06*
-- Male/Female Count for Each Station
SELECT TripInfo.EndStationID, UserInfo.Gender, Count(*) as Count
FROM UserInfo INNER JOIN TripInfo ON (UserInfo.UserID = TripInfo.UserID)
GROUP BY TripInfo.EndStationID, UserInfo.Gender
ORDER BY TripInfo.EndStationID;

-- Query 07*
-- Which End Stations are Most Popular Among Women?
SELECT TripInfo.EndStationID, UserInfo.Gender, Count(*) as Count
FROM UserInfo INNER JOIN TripInfo ON (UserInfo.UserID = TripInfo.UserID)
WHERE UserInfo.Gender = 'F'
GROUP BY TripInfo.EndStationID
ORDER BY Count DESC
LIMIT 5;

-- Query 08
-- Average Duration Ridden on Classic vs. E-Bike
SELECT BikeInfo.BikeType,
ROUND(AVG(TripInfo.TripDuration)) as 'AverageDuration'
FROM TripInfo INNER JOIN BikeInfo ON (TripInfo.BikeID = BikeInfo.BikeID)
GROUP BY BikeInfo.BikeType;

-- Query 09
-- What Type of Bike is More Popular for Morning Rides?
SELECT BikeInfo.BikeType, Count(TripInfo.StartTime) as Count
FROM TripInfo INNER JOIN BikeInfo ON (TripInfo.BikeID = BikeInfo.BikeID)
WHERE StartTime BETWEEN '00:00:00' AND '12:00:00'
GROUP BY BikeInfo.BikeType;

-- Query 10*
-- Find Most Popular Start Station Between Specific Time Period
SELECT TripInfo.StartStationID, StationInfo.StationName, Count(StartTime) as Count
FROM TripInfo INNER JOIN StationInfo on (TripInfo.StartStationID = StationInfo.StationID)
WHERE StartTime BETWEEN '12:00:00' AND '18:00:00'
GROUP BY TripInfo.StartStationID
ORDER BY Count DESC
LIMIT 5;

-- Query 11
-- Customers who rode a Classic bike for over 15 mins
SELECT UserInfo.UserID, BikeInfo.BikeID, UserInfo.UserType,
BikeInfo.BikeType, TripInfo.TripDuration
FROM BikeInfo
LEFT JOIN TripInfo ON (BikeInfo.BikeID = TripInfo.BikeID)
RIGHT JOIN UserInfo ON (TripInfo.UserID = UserInfo.UserID)
WHERE UserInfo.UserType = "Customer" AND BikeInfo.BikeType = "Classic"
AND TripInfo.TripDuration > 900
ORDER BY TripInfo.TripDuration DESC;