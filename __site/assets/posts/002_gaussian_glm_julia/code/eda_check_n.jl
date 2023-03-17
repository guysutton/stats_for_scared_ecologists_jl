# This file was generated, do not modify it. # hide
# Count number of samples per penguin species 
@chain df begin
    @group_by(species)
    @summarise(n = nrow())
end