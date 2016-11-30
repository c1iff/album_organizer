require('rspec')
require('artist')
require('album')

describe(Artist) do
  before() do
    Artist.clear()
    @new_artist = Artist.new({:name =>'The Beatles'})
  end

  describe('#name') do
    it('creates a new album object and returns the album name') do
      expect(@new_artist.name).to(eq('The Beatles'))
    end
  end

  describe('.all') do
    it('is empty at first') do
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#save') do
    it('save an album') do
      @new_artist.save()
      expect(Artist.all()).to(eq([@new_artist]))
    end
  end

  describe('.clear') do
    it('clears the artist array') do
      @new_artist.save()
      second_artist = Artist.new(:name => 'The Rolling Stones')
      second_artist.save()
      Artist.clear()
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#id') do
    it('returns the id of an artist') do
      expect(@new_artist.id).to(eq(1))
    end
  end

  describe('.find') do
    it('returns an artist object based on an id') do
      @new_artist.save()
      second_artist = Artist.new(:name => 'The Rolling Stones')
      second_artist.save()
      expect(Artist.find(@new_artist.id)).to(eq(@new_artist))
    end
  end

  describe('#add_album') do
    it('adds an album to the artist') do
      second_album = Album.new({:name => 'Sgt. Peppers'})
      @new_artist.add_album(second_album)
      expect(@new_artist.albums()).to(eq([second_album]))
    end
  end
end
