class Pokemon

    attr_accessor :id, :name, :type, :db

    def initialize (id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save (name, type, db)
        # binding.pry
        sql = "INSERT INTO pokemon (name, type) VALUES (?, ?)"

        @db.execute(sql, [name, type])
    end

    def find 

    end

end
