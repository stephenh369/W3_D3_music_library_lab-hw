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

end