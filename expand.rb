require './openscad.rb'

OpenSCAD::expand_openSCAD_file(ARGV[1] || 'customizer_base.scad', 'customizer.scad')
