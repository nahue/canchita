require "application_system_test_case"

class AsigneesTest < ApplicationSystemTestCase
  setup do
    @asignee = asignees(:one)
  end

  test "visiting the index" do
    visit asignees_url
    assert_selector "h1", text: "Asignees"
  end

  test "should create asignee" do
    visit asignees_url
    click_on "New asignee"

    check "Is coach" if @asignee.is_coach
    fill_in "Name", with: @asignee.name
    click_on "Create Asignee"

    assert_text "Asignee was successfully created"
    click_on "Back"
  end

  test "should update Asignee" do
    visit asignee_url(@asignee)
    click_on "Edit this asignee", match: :first

    check "Is coach" if @asignee.is_coach
    fill_in "Name", with: @asignee.name
    click_on "Update Asignee"

    assert_text "Asignee was successfully updated"
    click_on "Back"
  end

  test "should destroy Asignee" do
    visit asignee_url(@asignee)
    click_on "Destroy this asignee", match: :first

    assert_text "Asignee was successfully destroyed"
  end
end
