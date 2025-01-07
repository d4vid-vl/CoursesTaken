# Having all the data extracted and converted, we can now plot it.
# First, same as before, we need to install the Plots package.
using Pkg
Pkg.add("DelimitedFiles")
Pkg.add("Plots")
using DelimitedFiles
using Plots

# Read in the data from the CSV file
ebolaData = DelimitedFiles.readdlm("ebolaData.csv", ',')
epidays = ebolaData[:, 1] # Days since the start of the epidemic
allcases = ebolaData[:, 2] # Number of cases

# Now we can plot the data
# First we specify the backend for the plot, in this case GR
Plots.GRBackend()

# Now we plot the data
# plot(epidays, allcases) --- A basic plot of the number of cases over time
# plot(epidays, allcases, linetype = :scatter, marker = :diamond) --- Scattered number of cases over time with diamond markers
plot(epidays, allcases,
  title = "West African Ebola Virus Epidemic",
  xlabel = "Days since 22 March 2014",
  ylabel = "Number of cases (3 countries)",
  marker = (:diamond, 3, "gray"),

  line = (:path, "red"),
  legend = false,
  grid = false)

# Save the plot to a file
savefig("ebolaCases.png")