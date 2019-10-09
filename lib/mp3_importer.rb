class MP3Importer

  attr_accessor :path, :filename

  @@files = []

  def initialize(path = @path)
    @path = path
  end

  def files
    files = Dir.entries("#{path}").select {|f| !File.directory? f}
    files.each do |song|
      @@files << song
    end
  end

  def import
    @@files.each{ |filename| Song.new_by_filename(filename) }
  end
end