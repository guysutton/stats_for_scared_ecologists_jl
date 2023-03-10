# This file was generated, do not modify it. # hide
# Download required packages, if necessary (remove # to evaluate code)
# Pkg.add(["GBIF", "Shapefile", "CairoMakie", "AlgebraOfGraphics", "DataFrames"])

# Load required packages into current session 
using GBIF                   # Query and download species GPS data from GBIF 
using Shapefile              # Import and manipulate raster data (e.g. .shp files)
using CairoMakie             # Plotting utilities 
using AlgebraOfGraphics      # Plotting utilities
using DataFrames             # Create and manipulate DataFrame objects