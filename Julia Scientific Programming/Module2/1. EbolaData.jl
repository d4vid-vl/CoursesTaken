# Using Ebola data from Wikipedia, we will plot the number of cases and deaths over time.
# The data is stored in a CSV file, which we will read in and convert to a format that can be plotted.
# First, we will import the necessary packages and read in the data.
using Pkg
Pkg.add("DelimitedFiles")
Pkg.add("Dates")
using DelimitedFiles
using Dates

# Read in the data from the CSV file
wikiEVDraw = DelimitedFiles.readdlm("wikipediaEVDraw.csv", ',')
allcases = wikiEVDraw[:, 2] # Number of cases
datechange = Dates.DateTime(wikiEVDraw[1, 1], "d u y") # Convert the date to a DateTime object, this is a test

# Now we convert all dates to DateTime objects
dates = wikiEVDraw[:,1]
for i = 1:length(dates)
    dates[i] = Dates.DateTime(dates[i], "d u y")
end

# Convert the DateTime object to a RataDie object, this is a test
datechange2 = Dates.datetime2rata(dates[1]) 

# Now we convert all dates to RataDie objects
dayspostday0(x) = Dates.datetime2rata(x) - Dates.datetime2rata(dates[length(dates)])
epidays = Array{Int64}(undef, length(dates))
for i = 1:length(epidays)
  epidays[i] = dayspostday0(dates[i])
end

# We write the new dates and the number of cases and deaths to a new CSV file
wikiEVDraw[:, 1] = epidays
DelimitedFiles.writedlm("ebolaData.csv", wikiEVDraw, ',')