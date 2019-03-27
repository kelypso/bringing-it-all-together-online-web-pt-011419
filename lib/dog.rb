class Dog
  attr_accessor :name, :breed, :id 
  
  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)} # accepts key value pairs as args
    self.id ||= nil # id defaults to nil
  end
  
  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS dogs (
        id INTEGER PRIMARY KEY,
        name TEXT,
        breed TEXT
      )
      SQL

      DB[:conn].execute(sql)
  end


end