# This file was generated, do not modify it. # hide
# Loop through all of the occurrences available in GBIF, not just n = 300 limit from above 
while length(observations) < LinearAlgebra.size(observations)
    occurrences!(observations)
end
@info observations