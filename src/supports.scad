include <supports/flared.scad>
include <supports/flat.scad>
include <supports/bars.scad>

module supports(type, stem_type, loft, height) {
  if (type == "flared") {
    flared_support(stem_type, loft, height);
  } else if (type == "flat") {
    flat_support(stem_type, loft, height);
  } else if (type == "bars") {
    bars_support(stem_type, loft, height);
  } else {
    echo("Warning: unsupported $support_type");
  }
}
