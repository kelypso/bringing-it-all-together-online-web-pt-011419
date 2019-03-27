class Dog
  attr_accessor :name, :breed, :id 
  
  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)} # accepts key value pairs as args
    self.id ||= nil # id defaults to nil
  end
  
  


end