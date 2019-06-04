require 'rails_helper'

RSpec.describe "awards index page", type: :feature do
  before :each do
    @artist = create(:artist)
    @song_1, @song_2, @song_3 = create_list(:song, 3, artist: @artist)

    @award_1 = Award.create(name: "Best lighting")
    @award_2 = Award.create(name: "Best vocals")

    @song_award_1 = SongAward.create!(song: @song_1, award: @award_1)
    @song_award_2 = SongAward.create!(song: @song_2, award: @award_1)
    @new_award_name = "New Award"
  end

  it "shows visitor the award show pages which include songs that have won that award" do
    visit awards_path

    within "#awards-list" do
      expect(page).to have_link(@award_1.name)
      expect(page).to have_link(@award_2.name)
    end

    click_link "#{@award_1.name}"

    expect(page).to have_content(@song_1.title)
    expect(page).to have_content(@song_2.title)
  end
end
