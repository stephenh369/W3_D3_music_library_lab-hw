require_relative('../db/SqlRunner')
require_relative('Album')

class Artist

    def initialize(options)
        @id = options['id'] if options['id']
        @name = options['name']
    end

    def self.all()
        sql = "SELECT * FROM artists"
        result = SqlRunner.run(sql)
        return result.map() {|artist| Artist.new(artist)}
    end

    def self.delete_all()
        sql = "DELETE From artists"
        SqlRunner.run(sql)
    end

    def save()
        sql = "INSERT INTO artists (name) VALUES ($1) RETURNING id"
        values = [@name]
        result = SqlRunner.run(sql, values)
        @id = result[0]["id"].to_i()
    end
end