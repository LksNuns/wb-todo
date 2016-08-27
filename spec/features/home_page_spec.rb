require 'rails_helper'

feature 'home page' do

  scenario "visit home page" do
    visit('/')
    expect(page).to have_content("Welcome to WP-TODO")
  end

end
