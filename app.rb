require('sinatra')
require('sinatra/reloader')
require('./lib/artist')
require('./lib/album')
also_reload('lib/**/*.rb')

get('/') do
  erb(:index)
end

get('/artists/new') do
  erb(:artists_form)
end

get('/artists') do
  @artists = Artist.all()
  erb(:artists)
end

post('/artists') do
  album_name = params.fetch('name')
  Artist.new({:name => album_name}).save()
  @artists = Artist.all()
  erb(:success)
end

get('/artists/:id') do
  @artist = Artist.find(params.fetch('id').to_i())
  # @albums = Artist.find(params.fetch('id').to_i()).albums
  erb(:artist)
end

get('/albums/:id') do
  @albums = Album.find(params.fetch('id').to_i())
  erb(:album)
end

get('/artists/:id/album/new') do
  @artist = Artist.find(params.fetch('id').to_i())
  erb(:artists_albums_form)
end

post('/albums') do
  name = params.fetch('name')
  @album = Album.new({:name => name})
  @album.save()
  @artist = Artist.find(params.fetch('artist_id').to_i())
  @artist.add_album(@album)
  erb(:success)
end
