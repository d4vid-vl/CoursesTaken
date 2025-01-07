# With the data filtered in the new ebolaFilteredData.csv, we can now plot with all the countries taken in mind.
using Pkg
Pkg.add("DelimitedFiles")
Pkg.add("Plots")
using DelimitedFiles
using Plots

# Read in the data from the CSV file
ebolaData = DelimitedFiles.readdlm("ebolaFilteredData.csv", ',')
epidays = ebolaData[:, 1] # Days since the start of the epidemic
casespercountry = ebolaData[:, [4,6,8]] # Number of cases per country

# Now we can plot the data
Plots.PyPlotBackend()
plot(epidays, casespercountry,
  title = "West African Ebola Virus Epidemic",
  xlabel = "Days since 22 March 2014",
  ylabel = "Number of cases",
  label = ["Guinea" "Liberia" "Sierra Leone"],
  line = (:path, ["red" "blue" "green"]),
  legend = :topleft,
  grid = false)

# Save the plot to a file
savefig("ebolaCasesPerCountry.png")