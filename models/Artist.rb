require_relative('../db/SqlRunner')
require_relative('Album')

class Artist

    attr_reader :id
    attr_accessor :name

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

    def update()
        sql = "UPDATE artists SET name = $1 WHERE id = $2"
        values = [@name, @id]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM artists WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def albums()
        sql = "SELECT * FROM albums WHERE artist_id = $1"
        values = [@id]
        result = SqlRunner.run(sql, values)
        albums = result.map() {|album| Album.new(album)}
        return albums
    end

end