# As a visitor
# When I visit /songs/1 (where 1 is the id of a song in my database)
# Then I see that song's title, and artist
# And I do not see any of the other songs in my database

require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit a song's show page" do
    it "I see that song's title and artist" do
      artist = Artist.create!(name: '1903')
      song_1 = artist.songs.create!(title: "Don't stop belivin'", length: 303, play_count: 12345)
      song_2 = artist.songs.create!(title: "Bohemian Rhapsody", length: 540, play_count: 67829348)

      visit "/songs/#{song_1.id}"

      expect(page).to have_content(song_1.title)
      expect(page).to have_content("By: #{song_1.artist.name}")
      expect(page).to_not have_content(song_2.title)
    end

    it "I see that song's awards" do
      artist = Artist.create!(name: '1903')
      song_1 = artist.songs.create!(title: "Don't stop belivin'", length: 303, play_count: 12345)
      song_2 = artist.songs.create!(title: "Bohemian Rhapsody", length: 540, play_count: 67829348)

      visit "/songs/#{song_1.id}"

      expect(page).to have_content(song_1.title)
      expect(page).to have_content("By: #{song_1.artist.name}")
      expect(page).to_not have_content(song_2.title)
    end
  end

  before :each do
    @artist = create(:artist)
    @song_1, @song_2, @song_3 = create_list(:song, 3, artist: @artist)

    @award_1 = Award.create(name: "Best lighting")
    @award_2 = Award.create(name: "Best vocals")

    @song_award_1 = SongAward.create!(song: @song_1, award: @award_1)
    @song_award_2 = SongAward.create!(song: @song_1, award: @award_2)
    @new_award_name = "New Award"
  end

  it "shows visitor the award show pages which include songs that have won that award" do
    visit "/songs/#{@song_1.id}"

    expect(page).to have_content("Awards for this song")
    
    expect(page).to have_content(@award_1.name)
    expect(page).to have_content(@award_2.name)
  end
end
