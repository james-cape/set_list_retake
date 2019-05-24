require 'rails_helper'

RSpec.describe "When a visitor adds songs to their cart" do
  it "displays a message" do
    artist = Artist.create(name: 'Rick Astley')
    song = artist.songs.create(title: 'Never Gonna Give You Up', length: 250, play_count: 1000000)

    visit songs_path

    within("#song-#{song.id}") do
      click_button "Add Song"
    end

    expect(page).to have_content("You now have 1 copy of #{song.title} in your cart.")
  end

  it "the message correctly increments for multiple songs" do
    artist = Artist.create(name: 'Rick Astley')
    song_1 = artist.songs.create(title: 'Never Gonna Give You Up', length: 250, play_count: 1000000)
    song_2 = artist.songs.create(title: "Don't Stop Believin'", length: 300, play_count: 1)

    visit songs_path

    # expect(page).to have_content('Cart: 0')

    within("#song-#{song_1.id}") do
      click_button "Add Song"
    end
    expect(page).to have_content('Cart: 1')

    within("#song-#{song_2.id}") do
      click_button "Add Song"
    end
    expect(page).to have_content('Cart: 2')


    within("#song-#{song_1.id}") do
      click_button "Add Song"
    end
    expect(page).to have_content('Cart: 3')


    expect(page).to have_content("You now have 2 copies of #{song_1.title} in your cart.")
  end

  it "visitors can see all songs in their cart" do
    artist = Artist.create(name: 'Rick Astley')
    song_1 = artist.songs.create(title: 'Never Gonna Give You Up', length: 250, play_count: 1000000)
    song_2 = artist.songs.create(title: "Don't Stop Believin'", length: 300, play_count: 1)

    visit songs_path

    within("#song-#{song_1.id}") do
      click_button "Add Song"
    end

    within("#song-#{song_2.id}") do
      click_button "Add Song"
    end

    within("#song-#{song_1.id}") do
      click_button "Add Song"
    end

    visit cart_path

    within("#song-#{song_1.id}") do
      expect(page).to have_content("#{song_1.title}: 2")
    end

    within("#song-#{song_2.id}") do
      expect(page).to have_content("#{song_2.title}: 1")
    end
  end
end
