# This file was generated, do not modify it. # hide
# Calculate marginal effects 
design = Dict(:species => unique(df.species))
eff_species = Effects.effects(design, m1)