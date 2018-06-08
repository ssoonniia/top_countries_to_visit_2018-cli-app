
require 'pry'
class Country
  attr_accessor :name, :information
  @@all = []

  def initialize(name, information)
    @name =name
    @information =information
  end

  def save
    @@all << self
  end


  def self.create(name, information)
    country = self.new(name, information)
    country.save
    country
  end

  def self.all
    @@all
  end

end
