require('rspec')
require('album')

describe(Album) do
  before() do
    Album.clear()
    @new_album = Album.new({:name =>'Revolver'})
  end

  describe('#name') do
    it('creates a new album object and returns the album name') do
      expect(@new_album.name).to(eq('Revolver'))
    end
  end

  describe('.all') do
    it('will be empty at first') do
      expect(Album.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('save an album') do
      @new_album.save()
      expect(Album.all()).to(eq([@new_album]))
    end
  end

  describe('.clear') do
    it('clears out all of the albums') do
      Album.new({:name => 'Let It Be'})
      Album.clear()
      expect(Album.all()).to(eq([]))
    end
  end

  describe('#id') do
    it('returns unique id of an album') do
      expect(@new_album.id()).to(eq(1))
    end
  end

  describe('.find') do
    it('returns album based on id number') do
      @new_album.save()
      second_album = Album.new({:name => 'Sgt. Peppers'})
      second_album.save()
      expect(Album.find(@new_album.id)).to(eq(@new_album))
    end
  end
end
