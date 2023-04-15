# This file was generated, do not modify it. # hide
# Fit Gaussian GLM
m1 = fit(
         # We want a GLM 
         GeneralizedLinearModel,
         # Specify the model formula
         @formula(body_mass_g ~ 1 + species),
         # Where is the data stored? 
         df,
         # Which statistical distribution should we fit?
         Normal(),
         # Which link function should be applied?
         GLM.IdentityLink(),
         # Specify effects coding (more on this in later posts)
         contrasts = Dict(:species => EffectsCoding()));