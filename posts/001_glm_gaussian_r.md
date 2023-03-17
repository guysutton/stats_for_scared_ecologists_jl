+++
title = " GLM's using R: Part 1, Gaussian GLM"
published = "2021-04-08"
tags = ["R", "Modelling", "GLM"]
rss = " "
image = "/assets/self.jpg"
+++

# Background 

Many scared ecologists worry about which statistical test to use to analyse their hard-earned data. This is natural. Typically, some form of linear model will be used to analyse the data, whereby the relationship between a continuous response variable (`y`) is modelled with respect to one or more explanatory variables (`x1`, `x2`, ...). A general linear model (GLM) is an umbrella term for a linear model for data (residuals) that follow a normal or Gaussian distribution (more on this later). The GLM likely encompasses many, if not all, of the analyses you were taught during undergraduate statistics courses.  

For example: 
- A GLM where our `x` is numeric is analogous to a `linear regression`
- A GLM where our `x` is categorical is analogous to a `analysis of variance (ANOVA)` 

Today, we are going to work through a simple example of a Gaussian General Linear Model (GLM) with a single categorical `x` variable using `R`. In other words, we are going to effectively fit a one-way ANOVA in a GLM framework. 

# Data 


### Session setup 

As always, the first thing we need to do is download and load the required packages to perform these operations. 
 

