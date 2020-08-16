class Pokemon

    attr_accessor :name, :type, :db
    attr_reader :id

    def initialize(keywords)
        @id, @name, @type, @db = keywords.values[0], keywords.values[1], keywords.values[2], keywords.values[3]
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
    end

    def self.find(id, db)
        row = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        self.new(id:row[0], name:row[1], type:row[2], db:db)
    end
    
end