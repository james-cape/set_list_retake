require 'rails_helper'

RSpec.describe "awards index page", type: :feature do
  before :each do
    @award_1 = Award.create(name: "Best lighting")
    @award_2 = Award.create(name: "Best vocals")
    @new_award_name = "New Award"
  end

  it "shows admin a button which creates new award" do
    admin_1 = User.create!(role: 'admin', password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_1)

    visit awards_path

    expect(page).to have_button("Create a new award")

    fill_in :Name, with: @new_award_name

    click_button "Create a new award"
    within "#awards-list" do
      expect(page).to have_link(@new_award_name)
    end
  end

  it "shows visitor no button which creates new award" do
    visit awards_path

    expect(page).to_not have_button("Create a new award")
  end

  it "shows visitor existing awards" do
    visit awards_path

    within "#awards-list" do
      expect(page).to have_link(@award_1.name)
      expect(page).to have_link(@award_2.name)
    end
  end

  it "shows visitor award names as links to award show pages" do
    visit awards_path

    within "#awards-list" do
      expect(page).to have_link(@award_1.name)
      expect(page).to have_link(@award_2.name)
    end
  end
end
