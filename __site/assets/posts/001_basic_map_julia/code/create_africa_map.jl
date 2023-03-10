# This file was generated, do not modify it. # hide
# Step 1: Create a raster layer with the African shapefile (.shp)
layer_map = geodata(table) * 
        mapping(
            :geometry
            ) * 
        visual(
            Poly,
            strokecolor = :black,
            strokewidth = 1,
            linestyle = :solid,
            color = "white"
);    

# Print Africa map
draw(layer_map);