class Dog
  attr_accessor :name, :breed, :id 
  
  def initialize(name, breed, id=nil)
    attributes.each {|key, value| self.send(("#{key}="), value)} # accepts key value pairs as args
    self.id ||= nil
  end
  
  


end