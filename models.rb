require './openscad.rb'
require 'tempfile'

ROWS = [5,1,2,3,4].freeze # [5,1,2,3,4]
SIZES = [1, 1.25, 1.5, 1.75, 2, 2.25, 2.75, 6.25].freeze
PROFILES = ['dcs', 'dsa', 'g20', 'oem', 'sa'].freeze

# can't get include statements to work dynamically so we'll just use a file
def make_file(command)
  lines = OpenSCAD::expand('model_base.scad')
  lines << command
  f = Tempfile.new('models.scad')
  f.write lines.join
  f.close
  f.path
end

# length is not used in the command here to get the automatic stabilizers from the script
def make_command(row, length, profile)
  "key_profile(\"#{profile}\", #{row}) { union() { #{length == 6.25 ? '$dish_type = "sideways cylindrical"; $inverted_dish=true;' : ''} key(); } }"
end

ROWS.each do |row|
  SIZES.each do |length|
    PROFILES.each do |profile|
      command = make_command(row, length, profile)
      filename = "#{profile}_row-#{row}_length-#{length.to_s.sub('.', '_')}.stl"
      puts "rendering #{filename}:"
      puts "\tcommand: #{command} \n\n"
      path = make_file(command)
      `openscad -o ./models/#{filename} -D "\\\$key_length = #{length};" #{path}`
    end
  end
end
