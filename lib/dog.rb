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
      );
      SQL

      DB[:conn].execute(sql)
  end
  
  def self.drop_table
    sql = <<-SQL
      DROP TABLE dogs;
      SQL

      DB[:conn].execute(sql)
  end
  
  def save
    sql = <<-SQL
      INSERT INTO dogs (name, breed) 
      VALUES (?, ?);
      SQL

    DB[:conn].execute(sql, self.name, self.breed)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM dogs")[0][0]

    self
  end
  
  def self.create(attrs_hash)
    dog = self.new(attrs_hash)
    dog.save
    dog
  end

  
  
  def update 
    sql = <<-SQL
      UPDATE dogs
      SET name = ?, breed = ?
      WHERE id = ?;
    SQL
    
    DB[:conn].execute(sql, self.name, self.breed, self.id)
  end

end