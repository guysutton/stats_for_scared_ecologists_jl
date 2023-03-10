# This file was generated, do not modify it. # hide
# Set all points labelled as Senecio madagascariensis to black colour
colors = ["Senecio madagascariensis" => colorant"#000000"]

# Step 3: Combine layers to make map 
map_final = draw(
    # Pass layer containing base layer shapefile 
    layer_map + 
    # Pass layer containing GPS points 
    layer_gps, 
    # Define x and y axis limits, axis tick range and axis labels 
    axis = (
        limits = ((-20, 55), (-38, 40)),
        xticks = -20:10:55,
        yticks = -38:10:40,
        aspect = 1, 
        xlabel = "Longitude",
        ylabel = "Latitude", 
    ),
    figure = (
        resolution = (750, 750),
    ), 
    # Place the legend on top of the figure (position = :top)
    legend = (position = :top, titleposition = :left, ),
    palettes = (color = colors, )
);