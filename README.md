# CommuteTimes
This is a fork of ZacharyST/CommuteTimes, tweaked for the purpose of determining which of a set of potential new offices spaces for our team, has the shortest commute time. To use it:

1. Make sure RStudio (or just R) is installed on your machine.
1. Open an R environment.
1. Install/load the `googleway` library.
1. Get a Google Maps API Key from https://developers.google.com/maps/documentation/javascript/get-api-key, and put it in the script.
1. Tweak the dates/times for which you'd like to measure the commutes, if you'd like.
1. Load up the function in this script, as well as a data frame with the names and addresses of your coworkers.
1. Get a list of the office locations for which you'd like to calculate commutes.
1. Run the script, using something like this:
``` R
# Assumes e is a data frame, with the names/addresses of your coworkers, manually specifies office address.
results <- mapply(processDirections, name=e$First, origin=e$Address, destination='123 Any St, Houston, TX 77002')
write.table(results, "~/Desktop/commutes.csv", sep=",")

````
Note: if you're using an OS other than MacOS, you may need to tweak the Time Zone names in the script.
