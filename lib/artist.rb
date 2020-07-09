require 'pry'

class Artist

  # # extend Memorable
  # extend Findable::ClassMethods
  # include Findable::InstanceMethods
  # # extend Findable
  # # include Paramable


attr_accessor :name, :songs

@@all = []


def initialize(name)

  @name = name
  @songs = []
  save
end

def save
  @@all << self
end

def self.all
  return @@all
end


def self.create(name)
return self.new(name)
end

def self.destroy_all
@@all.clear
end

def genres
  @genres = []
  @songs = Song.all.select {|song| song.artist == self}
  @songs.each {|song|  @genres << song.genre   }
  @genres.uniq!
  return @genres
end

def add_song(song)

  unless (@songs.include?(song)) || !(song.artist == nil)

  @songs << song
    song.artist = self
  end
end
end
