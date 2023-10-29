require "application_system_test_case"

class VenuesTest < ApplicationSystemTestCase
  setup do
    @location = venues(:one)
  end

  test "visiting the index" do
    visit venues_url
    assert_selector "h1", text: "Venues"
  end

  test "should create location" do
    visit venues_url
    click_on "New location"

    fill_in "Name", with: @location.name
    click_on "Create Location"

    assert_text "Location was successfully created"
    click_on "Back"
  end

  test "should update Location" do
    visit venue_url(@location)
    click_on "Edit this location", match: :first

    fill_in "Name", with: @location.name
    click_on "Update Location"

    assert_text "Location was successfully updated"
    click_on "Back"
  end

  test "should destroy Location" do
    visit venue_url(@location)
    click_on "Destroy this location", match: :first

    assert_text "Location was successfully destroyed"
  end
end
