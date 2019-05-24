class Cart
  attr_reader :contents

  def initialize(cart_session)
    @contents = cart_session || Hash.new(0)
  end

  def total_count
    @contents.values.sum
  end

  def add(song_id)
    @contents[song_id.to_s] ||= 0
    @contents[song_id.to_s] += 1
  end

  def songs
    song_and_quantity = {}
    @contents.each do |song_id, quantity|
      song = Song.find(song_id)
      song_and_quantity[song] = quantity
    end
    song_and_quantity
  end
end
