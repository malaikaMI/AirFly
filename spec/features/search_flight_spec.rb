require "rails_helper"

feature "User searches a flight" do
  before(:all) do
    create(:flight)
  end

  scenario "visit homepage" do
    visit root_path
    expect(page).to have_content "Flights"
  end

  scenario "searches unavailable flights", js: true do
    visit root_path
    select "Abuja", from: "flightFrom"
    select "Lagos", from: "flightTo"
    fill_in "date-picker", with: Time.zone.now.strftime("%m/%d/%Y")
    click_button "Search Flights"
    expect(page).to have_content "Search Results"
    expect(page).to have_content "0 results found"
  end

  scenario "searches available flights", js: true do
    visit root_path
    select "Lagos", from: "flightFrom"
    select "Abuja", from: "flightTo"
    fill_in "date-picker",
            with: Time.zone.tomorrow.tomorrow.strftime("%m/%d/%Y")
    click_button "search-submit"
    expect(page).to have_content "Search Results"
    expect(page).to have_content "1 result found"
  end
end
