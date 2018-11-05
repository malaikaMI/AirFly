require "rails_helper"

feature "User books flight" do
  before(:all) do
    create(:flight)
  end

  scenario "visit homepage" do
    visit root_path
    expect(page).to have_content "Flights"
  end

  scenario "go to flight booking page" do
    visit root_path
    click_link "Book Flight"
    expect(page).to have_content "Departure Airport: Nnamdi Azikwe"
    expect(page).to have_content "Add Passenger"
  end

  scenario "fill in passenger details", js: true do
    visit root_path
    click_link "Book Flight"
    click_link "Add Passenger"
    fill_in "name", with: "Femi"
    fill_in "email", with: "femi@mine.com"
    fill_in "phone", with: "0803531312"
    fill_in "address", with: "Yaba"
    click_button "submit"
    expect(page).to have_content "Lagos to Abuja"
    expect(page).to have_content "Passengers' Details"
  end
end
