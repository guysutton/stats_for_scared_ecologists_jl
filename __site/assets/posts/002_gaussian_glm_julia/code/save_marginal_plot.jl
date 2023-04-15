# This file was generated, do not modify it. # hide
# hideall
plt = data(eff_species_ci) * 
        mapping(
            # Plot axes and create new labels for each axis 
            :species => "Species", 
            :body_mass_g => "Body mass (g)"
            ) * 
        (visual(Scatter) + mapping(:err) * visual(Errorbars)) |> 
        draw;
save(joinpath(@OUTPUT, "marginal_plot.png"), plt) # hide