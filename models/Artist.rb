require_relative('../db/SqlRunner')
require_relative('Album')

class Artist

    def initialize(options)
        @id = options['id'] if options['id']
        @name = options['name']
    end

end