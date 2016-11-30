class Artist
  attr_reader(:name,:id, :albums)
  @@artists = []

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = @@artists.length + 1
    @albums = []
  end

  define_singleton_method(:all) do
    @@artists
  end

  define_singleton_method(:clear) do
    @@artists = []
  end

  define_method(:save) do
    @@artists.push(self)
  end

  define_singleton_method(:find) do |id_artist|
    found_artist = nil
    @@artists.each do |artist|
      if artist.id == id_artist
        found_artist = artist
      end
    end
    found_artist
  end

  define_method(:add_album) do |album|
    @albums.push(album)
  end
end
