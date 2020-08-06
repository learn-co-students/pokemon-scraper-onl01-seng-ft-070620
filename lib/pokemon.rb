class Pokemon
  attr_accessor :name, :type
  attr_reader :id, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @db = db
    @name = name
    @type = type
  end

# parameterize a SQL query to insert a row into the pokemon database table
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end

# uses an id number to find a pokemon from the database table and returns that Pokemon instance
  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE pokemon.id = ? LIMIT 1", [id]).map do |row|
      self.new(id: row[0], name: row[1], type: row[2], db: db)
    end.first
  end

end
