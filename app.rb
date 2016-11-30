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
