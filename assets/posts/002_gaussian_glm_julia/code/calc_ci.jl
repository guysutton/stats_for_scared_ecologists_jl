# This file was generated, do not modify it. # hide
# Calculate 95% confidence interval of the mean marginal effect 
eff_species_ci = @chain eff_species begin
    @group_by(species)
    @summarise(
        body_mass_g = body_mass_g,
        err = 1.96 * err,
        lower_ci = body_mass_g - err,
        upper_ci = body_mass_g + err
        )
end