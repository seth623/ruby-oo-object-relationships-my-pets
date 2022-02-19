class Owner
  
  @@all = []
  attr_reader :name, :species
  attr_accessor :mood 

  def initialize(name, species = "human")
    @name = name 
    @species = species
    @@all << self  
  end

  def buy_cat(name)
    Cat.new(name, self) 
  end 

  def buy_dog(name)
    Dog.new(name, self) 
  end 

  def cats
    Cat.all.select { |cat| cat.owner == self }
  end 

  def dogs
    Dog.all.select { |dog| dog.owner == self }
  end
  
  def feed_cats
    self.cats.collect { |cat| cat.mood = "happy" }
  end
  
  def list_pets 
    return "I have #{self.dogs.size} dog(s), and #{cats.size} cat(s)."
  end 
  
  def say_species
    return "I am a #{@species}."
  end 

  def self.all 
    @@all
  end 

  def self.count
    @@all.size
  end 

  def self.reset_all
    @@all.clear 
  end

  def sell_pets 
    self.dogs.collect { |dog| dog.mood = "nervous" }
    self.cats.collect { |cat| cat.mood = "nervous" }
    self.dogs.collect { |dog| dog.owner = nil }
    self.cats.collect { |cat| cat.owner = nil }
  end 
  
  def walk_dogs
    self.dogs.collect { |dog| dog.mood = "happy"}
  end 

end