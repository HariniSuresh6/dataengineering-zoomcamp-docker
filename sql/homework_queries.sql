-- Question 3
SELECT COUNT(*)
FROM green_taxi_trips
WHERE lpep_pickup_datetime >= '2025-11-01'
AND lpep_pickup_datetime < '2025-12-01'
AND trip_distance <= 1;

--Question 4
SELECT DATE(lpep_pickup_datetime) AS day,
MAX(trip_distance) AS max_distance
FROM green_trips
WHERE trip_distance < 100
GROUP BY day
ORDER BY max_distance DESC
LIMIT 1;

--Question 5
SELECT z.zone,
SUM(t.total_amount) AS total
FROM green_trips t
JOIN zones z
ON t.PULocationID = z.LocationID
WHERE DATE(t.lpep_pickup_datetime) = '2025-11-18'
GROUP BY z.zone
ORDER BY total DESC
LIMIT 1;

--Question 6
SELECT dz.zone,
MAX(t.tip_amount) AS max_tip
FROM green_trips t
JOIN zones pz
ON t.PULocationID = pz.LocationID
JOIN zones dz
ON t.DOLocationID = dz.LocationID
WHERE pz.zone = 'East Harlem North'
AND t.lpep_pickup_datetime >= '2025-11-01'
AND t.lpep_pickup_datetime < '2025-12-01'
GROUP BY dz.zone
ORDER BY max_tip DESC
LIMIT 1;

--Question 7 Terraform
terraform init
terraform apply -auto-approve
terraform destroy