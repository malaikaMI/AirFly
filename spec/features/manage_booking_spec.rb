require "rails_helper"

feature "User books flight" do
  let(:booking) { create(:booking) }
  before(:all) do
    create(:flight)
  end

  scenario "edit passenger details", js: true do
    visit root_path
    click_link "Book Flight"
    click_link "Add Passenger"
    fill_in "name", with: "Femi"
    fill_in "email", with: "femi@mine.com"
    fill_in "phone", with: "0803531312"
    fill_in "address", with: "Yaba"
    click_button "submit"
    click_link "edit-booking"
    fill_in "name", with: "Femi Senjobi"
    fill_in "email", with: "femi@senjobi.com"
    click_button "submit"
    expect(page).to have_content "Success! Booking was successfully updated."
    expect(page).to have_content "Femi Senjobi (femi@senjobi.com)"
  end

  scenario "search valid booking", js: true do
    visit root_path
    fill_in "reference-no", with: booking.code
    click_button "Manage Booking"
    expect(page).to have_content "Lagos to Abuja Aero Contractors"
    expect(page).to have_content "Passengers' Details"
  end

  scenario "search invalid booking", js: true do
    visit root_path
    fill_in "reference-no", with: 23
    click_button "Manage Booking"
    expect(page).to have_content "Warning! There is no booking with such"
  end
end
