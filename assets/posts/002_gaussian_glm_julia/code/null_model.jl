# This file was generated, do not modify it. # hide
# Define null model to assess effect of 'species` on penguin body mass 
# - Fit a random intercept only (indicated by y ~ 1)
mnull = fit(
         GeneralizedLinearModel,
         @formula(body_mass_g ~ 1),
         df,
         Normal(),
         GLM.IdentityLink());