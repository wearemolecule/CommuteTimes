#!usr/bin/Rscript

############
# LIBRARIES
############
library(googleway)

############
# FUNCTIONS
############
processDirections <- function(name, origin, destination){

	api_key <- 'your_api_key_here'
	morning_time = ISOdatetime(2017, 09, 13, 09, 00, 00, tz="America/Chicago")
	evening_time = ISOdatetime(2017, 09, 13, 18, 00, 00, tz="America/Chicago")

	#print(name)

	result_morning <- google_directions(origin=origin, destination=destination, key=api_key, departure_time = morning_time)  # May need to process to get into desired dataframe.  May need to make time of day
	time <- result_morning$routes$legs[[1]]$duration_in_traffic$value/60  # Given in seconds
	miles <- result_morning$routes$legs[[1]]$distance$value/1600  # Given in meters, this converts to miles

	result_evening <- google_directions(origin=destination, destination=origin, key=api_key, departure_time = evening_time)  # May need to process to get into desired dataframe.  May need to make time of day
	time_evening <- result_evening$routes$legs[[1]]$duration_in_traffic$value/60  # Given in seconds
	miles_evening <- result_evening$routes$legs[[1]]$distance$value/1600  # Given in meters, this converts to miles

	return(data.frame(person=name, office=destination, commute_distance=round(miles, digits=1), morning_commute=round(time, digits=2), evening_commute=round(time_evening, digits=2)))



}
