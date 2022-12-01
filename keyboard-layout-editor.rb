require 'json'

json = JSON.load(File.read('./keyboard-layout-editor.json'))
file = File.open("./keyboard-layout-editor.scad", "w")

file.write("include <./includes.scad>\n")
file.write("$stem_support_type=\"disable\";\n")

# puts json



# TODO add theses
name = "unnamed"
author = "unknown"

def sanitize_legend(legend)
  return legend.gsub("\\", "\\\\\\").gsub('"', '\"')
end

y = 0
num_rows = json.reduce(0) { |coll, row| coll + (row.is_a?(Hash) ? 0 : 1) }

json.each_with_index do |row, index|
  x = 0
  w = 1
  next if row.is_a? Hash

  row_sculpt = [(index + 5 - num_rows), 4].min;

  row.each do |potential_keycap|
    if potential_keycap.is_a? Hash
      y += (potential_keycap['y'] || 0)
      x += (potential_keycap['x'] || 0)
      w = (potential_keycap['w'] || w)
    else
      first_legend = sanitize_legend(potential_keycap.split("\n").first || "")
      first_legend_x_position = (2 - first_legend.length**0.25).round(2)
      first_legend_font_size = ((4 + w) - 1.25 * first_legend.length**0.5).round(2)

      second_legend = sanitize_legend(potential_keycap.split("\n")[1] || "")
      second_legend_x_position = (2 - second_legend.length**0.25).round(2)
      second_legend_font_size = ((4 + w) - 1.25 * second_legend.length**0.5).round(2)

      # puts([legend, x, y, w, (w - 1)/2].inspect)
      key_x_position = (x + ((w - 1) / 2.0)).round(2)

      stabilized_or_spacebar =
        if w >= 6
          "spacebar()"
        elsif w >= 1.75
          "stabilized()"
        else
          ""
        end


      file.write("translate_u(#{key_x_position}, -#{y}) u(#{w}) dcs_row(#{row_sculpt}) legend(\"#{first_legend}\", [-#{first_legend_x_position},-1], #{first_legend_font_size}) #{stabilized_or_spacebar} legend(\"#{second_legend}\", [-#{second_legend_x_position},1], #{second_legend_font_size}) key();\n")

      x += w
      w = 1
    end
  end

  y += 1
end