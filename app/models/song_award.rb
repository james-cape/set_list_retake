class SongAward < ApplicationRecord
  belongs_to :song
  belongs_to :award
end
