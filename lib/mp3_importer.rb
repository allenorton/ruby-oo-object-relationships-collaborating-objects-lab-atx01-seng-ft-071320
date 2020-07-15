require 'pry'
class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path 
    end
    def files
        #binding.pry 
       @files = Dir.glob("#{path}/*.mp3").map{|i| i.gsub("#{path}/", "")}
 
    end
    #binding.pry 
    def import 
        files.each do |i|
            Song.new_by_filename(i)
        end 
    end 
end