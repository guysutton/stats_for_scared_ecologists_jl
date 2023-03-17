+++
title = " GLM's using Julia: Part 1, Gaussian GLM"
published = "2023-03-01"
tags = ["Julia", "Modelling", "GLM", "GLM.jl"]
rss = " "
image = "/assets/self.jpg"
+++


### Session setup 

As always, the first thing we need to do is download and load the required packages to perform these operations. 

```julia:session_setup
# Download required packages, if necessary (remove # to evaluate code)
# Pkg.add(["DataFrames", "CSV", "PalmerPenguins", "GLM", "Tidier.jl", "CairoMakie", "AlgebraOfGraphics"])

# Load required packages into current session 
using DataFrames             # Create and manipulate DataFrame objects 
using CSV                    # Import and process .csv files 
using PalmerPenguins         # Access PalmerPenguins dataset 
using GLM                    # Fit linear models 
using Tidier                 # Tidyverse-like syntax for data manipulation
using CairoMakie             # Plotting utilities 
using AlgebraOfGraphics      # Plotting utilities
```
\show{session_setup}  

### Load data 

The next step is to load the data we are going to analyse. We are going use the built-in [Palmer penguins dataset](https://github.com/devmotion/PalmerPenguins.jl) ([Gorman et al. 2014](https://journals.plos.org/plosone/article?id=10.1371/journal.pone.0090081)) that is made available through the `PalmerPenguins.jl` package ([Horst *et al*. 2020](https://github.com/devmotion/PalmerPenguins.jl)). It contains body morphology measurements for 344 individual penguins from three species of penguins collected from three different islands in the Palmer Archpelago in Antarctica. There are 11 rows of data with missing data that we will remove from the dataset prior to analysis. 

```julia:import_data
# Load PalmerPenguins data
df = DataFrame(PalmerPenguins.load(; raw = false))

# Drop the rows containing NA values 
df = dropmissing(df, [:body_mass_g, :sex])
df = disallowmissing!(df)

# Show first 10 rows 
first(df, 10)
```
\show{import_data}

### Research question 

To illustrate how to fit and interpret a simple Gaussian GLM in Julia, we need to define our research question/hypothesis. Let's say that we are interested in whether the body mass (given as `body_mass_g` in `df`) of the three different penguins species is different. In other words, are one or more of the penguin species that were sampled either significantly lighter or heavier than the other species? 

### Exploratory data analysis 

The first thing we should always be doing when analysing a new dataset is checking that the data is correct (e.g. there are no transcription errors, the data imported correctly, all the data is labelled correctly, ect...). 

For example, one of the first things I always do is make sure that all the groups of interest are present in the dataset and the sample sizes are correct. We know from reading the help file for the [Palmer penguins dataset](https://github.com/devmotion/PalmerPenguins.jl) that there should be three penguin species (Adelie, Gentoo and Chinstrap) and the total sample size across all penguins is n = 333. 

```julia:eda_check_n
# Count number of samples per penguin species 
@chain df begin
    @group_by(species)
    @summarise(n = nrow())
end
```
\show{eda_check_n}

Brilliant. We have confirmed that the data was imported correctly - the data for all three penguin species are available, and we have confirmed that the sample sizes for the different penguin species are 146 (Adelie), 68 (Chinstrap) and 119 (Gentoo). 

The next step is to visualise the data. Let's plot the distribution of body mass values for the three different penguin species. Below, we use the syntax `:x => "x"` to relabel each variable during the plotting procedure.  

```julia:eda_plot
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
```
\show{eda_plot}

```julia:save_eda_plot
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
save(joinpath(@OUTPUT, "eda_plot.png"), eda_plot, resolution = (1500, 1500)) # hide  
```
\fig{eda_plot.png}

It looks like the median body mass (indicated by the bold black line in the middle of the boxes) is quite a bit higher for Gentoo penguins than either Adelie or Chinstrap penguins. Indeed, Gentoo penguins appear to weigh just over 1000g more than the other two species.  The variance (i.e. spread of body mass values along the y-axis) appears to be relatively similar between the three penguin species.




