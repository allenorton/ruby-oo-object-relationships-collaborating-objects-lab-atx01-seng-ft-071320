require 'pry'
class Artist
    attr_accessor :name
    @@all = []
    
    def self.all
        @@all 
    end


    def initialize(name)
        @name = name
        self.class.all << self
    end
    def add_song(song) #passed in song instance
        song.artist = self 
    end  
    def songs #collects songs by self(artist)
        Song.all.select {|song| song.artist == self}
    end 
    def self.find_self(name) #xtra method to lookup if self is in Artist.all
        self.all.find {|artist| artist.name == name }
    end 
    def self.find_or_create_by_name(name)
        if self.find_self(name) == nil
            self.new(name)
        else 
            self.find_self(name)
        end 
    end
    def print_songs
        songs.each {|song| puts song.name}
    end
    #binding.pry 

end