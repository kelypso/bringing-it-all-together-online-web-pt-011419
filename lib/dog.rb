class Dog
  attr_accessor :name, :breed, :id 
  
  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)} # accepts key value pairs
    self.id ||= nil
  end
  
  


end