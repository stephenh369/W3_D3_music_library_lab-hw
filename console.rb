require('pry-byebug')
require_relative('models/Artist')
require_relative('models/Album')

Artist.delete_all()

artist1 = Artist.new({
    'name' => 'Eminem'
})
artist1.save()

album1 = Album.new({
    'title' => 'The Marshall Mathers LP',
    'genre' => 'Hip Hop',
    'artist_id' => artist1.id
})
album1.save()

album2 = Album.new({
    'title' => 'Recovery',
    'genre' => 'Hip Hop',
    'artist_id' => artist1.id
})
album2.save()

artist2 = Artist.new({
    'name' => 'Foo Fighters'
})
artist2.save()

# artist1.delete()

# artist2.name = 'Arctic Monkeys'
# artist2.update()



binding.pry
nil