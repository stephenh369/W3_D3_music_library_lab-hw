require_relative('../db/SqlRunner')
require_relative('Artist')

class Album

    attr_reader :id, :artist_id
    attr_accessor :title, :genre

    def initialize(options)
        @id = options['id'] if options['id']
        @title = options['title']
        @genre = options['genre']
        @artist_id = options['artist_id']
    end

    def self.all()
        sql = "SELECT * FROM albums"
        result = SqlRunner.run(sql)
        return result.map() {|album| Album.new(album)}
    end

    def self.delete_all()
        sql = "DELETE From albums"
        SqlRunner.run(sql)
    end

    def save()
        sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
        values = [@title, @genre, @artist_id]
        result = SqlRunner.run(sql, values)
        @id = result[0]["id"].to_i()
    end

    def update()
        sql = "UPDATE albums SET (title, genre, artist_id) = ($1, $2, $3) WHERE id = $4"
        values = [@title, @genre, @artist_id, @id]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM albums WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

end