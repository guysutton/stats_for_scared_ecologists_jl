# This file was generated, do not modify it. # hide
# hideall
eda_plot = data(df) *
    # Provide the column names to plot on the x and y axis 
    mapping(
        :species => "Species", 
        :body_mass_g => "Body mass (g)") * 
    # Colour the bars by 'species'
    mapping(color = :species => "Species") * 
    # Draw a boxplot 
    visual(BoxPlot) |> 
    # Make the final figure 
    draw;
save(joinpath(@OUTPUT, "eda_plot.png"), eda_plot) # hide