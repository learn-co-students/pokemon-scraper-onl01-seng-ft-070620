class Pokemon
    attr_accessor :name, :type, :db, :id

    def initialize(attrs)
        attrs.each{|key, value| self.send(("#{key}="),value)}
    end

    def self.save(name, type, db)
        @db = db
        sql = <<-SQL
            INSERT INTO pokemon (name, type)
            VALUES (?,?)
        SQL
        @db.execute(sql, name, type)
    end

    def self.new_from_db(row)
        attrs = {:id => row[0], :name => row[1], :type => row[2]}
        new_pokemon = self.new(attrs)
    end

    def self.find(id, db)
        @db = db
        sql = <<-SQL
            SELECT * FROM pokemon WHERE id = ?
            LIMIT 1
        SQL
        @db.execute(sql, id).map {|row| Pokemon.new_from_db(row)}.first
    end
end
