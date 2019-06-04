class CreateSongAwards < ActiveRecord::Migration[5.1]
  def change
    create_table :song_awards do |t|
      t.references :song, foreign_key: true
      t.references :award, foreign_key: true
    end
  end
end
