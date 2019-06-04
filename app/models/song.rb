class Song < ApplicationRecord
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs

  has_many :song_awards
  has_many :awards, through: :song_awards

  def self.song_count
    count
  end
end
