# Geospatial Notes

Using PostGIS, there are a few things to consider:

* PostGIS locks me into Postgres. This is well-enough developed that I'm OK with the tradeoff.
* There is H3 from Uber that is globe-based with wrappes in many languages. This will be used to normalize per capita metrics.
* There is ST_HexagonGrid that works with PostGIS for planes. I won't use this in early iterations.

## Location

Generically, I'm using a Location model:

* name
* abbreviation
* level
* parent_id
* centroid
* border

This should work to create a tree of locations, with alternate geographies available at any level (e.g. a hex or a county or an electoral district).
