require 'pry'
class Song
    attr_accessor :name, :artist
    @@all = []
    
    def self.all
        @@all
    end 

    def initialize(name)
        @name = name
        self.class.all << self 
    end 
    def self.new_by_filename(file_name)
        song = self.new(name)
        song.name = file_name.split(" - ")[1]
        song.artist = Artist.new(file_name.split(" - ")[0])
        song 
    end
    def artist_name=(a_name)
        self.artist = Artist.find_or_create_by_name(a_name)
    end 
end 