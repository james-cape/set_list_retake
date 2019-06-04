require 'rails_helper'

RSpec.describe "awards index page", type: :feature do
  before :each do
    @award_1 = Award.create(name: "Best lighting")
    @award_2 = Award.create(name: "Best vocals")
  end

  it "shows button which creates new award" do
    admin_1 = User.create!(role: 'admin', password: "password")

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(admin_1)

    visit admin_awards_path

    expect(page).to have_button("Create a new award (enter award name): ", )
  end
end
