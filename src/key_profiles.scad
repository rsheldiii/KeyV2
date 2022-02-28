// key profile definitions

// unlike the other files with their own dedicated folders, this one doesn't
// need a selector. I wrote one anyways for customizer support though
include <key_profiles/dcs.scad>
include <key_profiles/oem.scad>
include <key_profiles/dsa.scad>
include <key_profiles/sa.scad>
include <key_profiles/g20.scad>
include <key_profiles/hipro.scad>
include <key_profiles/mt3.scad>
include <key_profiles/grid.scad>
include <key_profiles/regular_polygon.scad>
include <key_profiles/cherry.scad>
include <key_profiles/dss.scad>
include <key_profiles/asa.scad>
include <key_profiles/typewriter.scad>

// man, wouldn't it be so cool if functions were first order
module key_profile(key_profile_type, row, column=0) {
  if (key_profile_type == "dcs") {
    dcs_row(row, column) children();
  } else if (key_profile_type == "oem") {
    oem_row(row, column) children();
  } else if (key_profile_type == "dsa") {
    dsa_row(row, column) children();
  } else if (key_profile_type == "dss") {
    dss_row(row, column) children();
  } else if (key_profile_type == "sa") {
    sa_row(row, column) children();
  } else if (key_profile_type == "asa") {
    asa_row(row, column) children();
  } else if (key_profile_type == "g20") {
    g20_row(row, column) children();
  } else if (key_profile_type == "hipro") {
    hipro_row(row, column) children();
  } else if (key_profile_type == "grid") {
    grid_row(row, column) children();
  } else if (key_profile_type == "typewriter") {
    typewriter_row(row, column) children();
  } else if (key_profile_type == "hexagon") {
    hexagonal_row(row, column) children();
  } else if (key_profile_type == "octagon") {
    octagonal_row(row, column) children();
  } else if (key_profile_type == "cherry") {
    cherry_row(row, column) children();
  } else if (key_profile_type == "mt3") {
    mt3_row(row, column) children();  
  } else if (key_profile_type == "disable") {
    children();
  } else {
    echo("Warning: unsupported key_profile_type");
  }
}
