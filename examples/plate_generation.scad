include <../includes.scad>

// plates are currently generated via the same layout arrays as layouts are.
// just pass the layout to plate() and it'll do it's job using hull().
// still in beta
plate(60_percent_default_layout);