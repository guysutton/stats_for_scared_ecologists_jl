# This file was generated, do not modify it. # hide
# Convert GBIF observations to Dataframe object
df = DataFrames.DataFrame(observations)

# Remove rows where lat or long == 0
df = filter(df -> !(df.latitude == 0.0 || df.latitude == 00),  df);

# Show just the first 10 rows of GPS data
first(df, 10)