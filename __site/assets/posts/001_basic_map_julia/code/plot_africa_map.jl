# This file was generated, do not modify it. # hide
# Step 1: Create a raster layer with the African shapefile (.shp)
africa_map = geodata(table) * 
        mapping(
            :geometry
            ) * 
        visual(
            Poly,
            strokecolor = :black,
            strokewidth = 1,
            linestyle = :solid,
            color = "white"
            )      

draw(africa_map)