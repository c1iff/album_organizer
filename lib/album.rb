class Album
  @@albums = []

  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = @@albums.length + 1
  end

  define_singleton_method(:all) do
    @@albums
  end

  define_method(:save) do
    @@albums.push(self)
  end

  define_singleton_method(:clear) do
    @@albums = []
  end

  define_singleton_method(:find) do |id_number|
    found_album = nil
    @@albums.each do |album|
      if album.id == id_number
        found_album = album
      end
    end
    found_album
  end
end
