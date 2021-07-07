class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type 
        @db = db 
    end 

    def self.save(name, type, db)
        sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
        SQL

        db.execute(sql, name, type)
        # @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end 

    def self.find(id, db)
        sql = <<-SQL
        SELECT * 
        FROM pokemon
        WHERE id = ? 
        LIMIT 1
        SQL

        # pokemon = db.execute(sql, id).flatten
        # self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)

        db.execute(sql, id).collect do |row|
            self.new(id: row[0], name: row[1], type: row[2], db: db)
        end.first
    end 

end
