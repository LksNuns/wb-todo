require 'rails_helper'

feature "user register and login", js: true  do

  let(:user) {FactoryGirl.create(:user)}

  scenario "create a new user" do
    register_form = RegisterForm.new
    register_form.visit_page.fill.submit

    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario "sign in with a existent user" do
    # user = FactoryGirl.create(:user)

    sign_in_form = SignInForm.new
    sign_in_form.visit_page.fill(user).submit

    expect(page).to have_content("Signed in successfully.")
  end

end
