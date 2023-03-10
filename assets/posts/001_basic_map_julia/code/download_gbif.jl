# This file was generated, do not modify it. # hide
# Download occurences data from GBIF - 
# - Can use bounding box to only extract data from the native range of Brachiaria arrecta (Africa)
lat, lon = (-35, 10), (0, 45)
observations = GBIF.occurrences(
    GBIF.taxon("Brachiaria arrecta"; strict = false),
    "hasCoordinate" => "true",
    "decimalLatitude" => lat,
    "decimalLongitude" => lon,
    "limit" => 300,
)