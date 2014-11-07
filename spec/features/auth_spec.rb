require 'rails_helper'
require 'capybara/rails'

feature 'Auth' do

  scenario 'Users can login and out' do
    create_user email: "user@example.com"

    visit root_path
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("Username / password is invalid")

    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "password"
    within(".signin-form") { click_on "Login" }
    expect(page).to have_content("user@example.com")
  end

  scenario 'Users can signup' do
    visit root_path
    click_on "Register"
    fill_in "Email", with: "test@test.com"
    fill_in "Name", with: "Test Test"
    fill_in "Password", with: "test"
    fill_in "Confirm", with: "test"
    within(".registration-form") {click_on "Register"}
    expect(page).to have_content("test@test.com")
  end

end
