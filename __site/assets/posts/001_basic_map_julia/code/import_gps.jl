# This file was generated, do not modify it. # hide
# Import .csv file containing GPS data
df = DataFrames.DataFrame(CSV.File(".\\_assets\\data\\001_drawing_maps\\senecio_gps.csv"));

# Show just the first 10 rows of GPS data
first(df, 10)