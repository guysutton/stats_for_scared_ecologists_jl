# This file was generated, do not modify it. # hide
# Step 2: Create a layer with points for the GPS data 
layer_gps = data(df) * 
        mapping(  
            :longitude,
            :latitude,
            # Changes the legend name 
            color = :scientific => "Species"
        ) * 
        visual(
            Scatter,
            marker = :circle,
            markersize = 12.5,
);