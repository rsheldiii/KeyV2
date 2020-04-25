module OpenSCAD
  def self.expand(filename)
    lines = File.readlines(filename)
    old_dir = Dir.getwd

    Dir.chdir File.dirname(filename)
    lines = lines.flat_map do |line|
      # please note we do not implement `use` at all
      if line =~ /(include|use)\s*<(.*)>/
        # File.readlines("./#{$2}")
        expand("./#{$2}")
      else
        line
      end
    end

    Dir.chdir old_dir

    lines
  end

  def self.expand_openSCAD_file(source, destination)
    lines = OpenSCAD::expand(source)

    f = File.open(destination, 'w')
    f.write lines.join
  end
end
