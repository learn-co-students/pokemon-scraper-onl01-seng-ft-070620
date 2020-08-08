class Pokemon
    attr_accessor :name, :type, :db, :id

    def initialize(id = nil, name = nil, type = nil, db = nil)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id_num, db)
        pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
        Pokemon.new(pokemon_info[0], pokemon_info[1], pokemon_info[2], db)
    end
end
