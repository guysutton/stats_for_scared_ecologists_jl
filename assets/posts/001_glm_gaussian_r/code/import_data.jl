# This file was generated, do not modify it. # hide
# Load PalmerPenguins data
df = DataFrame(PalmerPenguins.load(; raw = false))

# Drop the rows containing NA values 
df = dropmissing(df, [:body_mass_g, :sex])
df = disallowmissing!(df)

# Show first 10 rows 
first(df, 10)