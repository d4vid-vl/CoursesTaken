# With the data in ebolaData.csv, we can plot the number of cases and deaths over time.
# However, there is an error in this csv, where we have some rows with "-" values.
# We will filter these out and plot the data.
using Pkg
Pkg.add("DelimitedFiles")
using DelimitedFiles

# Read in the data from the CSV file
ebolaData = DelimitedFiles.readdlm("ebolaData.csv", ',')

# Filter out rows with "-" values
rows, cols = size(ebolaData)
for i = 1:rows
    for j = 1:cols
        if !isdigit(string(ebolaData[i, j])[1])
            ebolaData[i, j] = 0
        end
    end
end

# Save the filtered data to a new CSV file
DelimitedFiles.writedlm("ebolaFilteredData.csv", ebolaData, ',')