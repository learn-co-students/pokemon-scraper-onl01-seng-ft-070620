class Pokemon
  attr_accessor :id, :name, :type, :db
  # attr_reader :id
  
  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?,?);
    SQL
    db.execute(sql, name, type)
  end
  
  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = poke[1]
    type = poke[2]
    
    pokemon = Pokemon.new(id: id, name: name, type: type, db: db)
  end
end
