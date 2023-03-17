# This file was generated, do not modify it. # hide
# Make boxplot of body mass by penguin species
data(df) *
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