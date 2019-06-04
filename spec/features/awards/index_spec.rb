require 'rails_helper'

RSpec.describe "awards index page", type: :feature do
  before :each do
    @award_1 = Award.create(name: "Best lighting")
    @award_2 = Award.create(name: "Best vocals")
    @new_award_name = "New Award"
  end

  it "shows button which creates new award" do
    admin_1 = User.create!(role: 'admin', password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_1)

    visit admin_awards_path

    expect(page).to have_button("Create a new award")

    fill_in :Name, with: @new_award_name

    click_button "Create a new award"

    expect(page).to have_content(@new_award_name)
  end
end
