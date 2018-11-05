require "rails_helper"

feature "Registered user books flight" do
  let(:user) { create(:user) }

  before(:all) do
    create(:flight)
  end

  scenario "not signed in" do
    visit root_path
    expect(page).not_to have_content "My Booking"
    expect(page).to have_content "Sign in"
  end

  scenario "signing in", js: true do
    visit root_path
    click_link "Sign up"
    fill_in "reg-email", with: "femi.senjobi@andela.com"
    fill_in "reg-password", with: "1qw23er45t"
    fill_in "reg-confirm", with: "1qw23er45t"
    click_button "Sign up"
    expect(page).to have_content "My Booking"
    click_link "Book Flight"
    click_link "Add Passenger"
    fill_in "name", with: "Femi"
    fill_in "email", with: "femi@mine.com"
    fill_in "phone", with: "0803531312"
    fill_in "address", with: "Yaba"
    click_button "submit"
    expect(page).to have_content "Lagos to Abuja Aero Contractors"
    click_link "My Booking"
    expect(page).to have_content "Nnamdi Azikwe, Lagos to Sam Ewang, Abuja"
  end

  scenario "loging in", js: true do
    visit root_path
    click_link "Sign in"
    fill_in "login-email", with: user.email
    fill_in "login-password", with: "1qw23er45ty6"
    click_button "Log in"
    expect(page).to have_content "My Booking"
    expect(page).not_to have_content "Sign up"
  end

  scenario "logged in user books flight", js: true do
    visit root_path
    click_link "Sign in"
    fill_in "login-email", with: user.email
    fill_in "login-password", with: "1qw23er45ty6"
    click_button "Log in"
    click_link "Book Flight"
    click_link "Add Passenger"
    fill_in "name", with: "Femi"
    fill_in "email", with: "femi@mine.com"
    fill_in "phone", with: "0803531312"
    fill_in "address", with: "Yaba"
    click_button "submit"
    expect(page).to have_content "Lagos to Abuja Aero Contractors"
    click_link "My Booking"
    expect(page).to have_content "Nnamdi Azikwe, Lagos to Sam Ewang, Abuja"
  end
end
