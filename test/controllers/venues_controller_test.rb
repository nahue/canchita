require "test_helper"

class VenuesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @location = venues(:one)
  end

  test "should get index" do
    get venues_url
    assert_response :success
  end

  test "should get new" do
    get new_venue_url
    assert_response :success
  end

  test "should create location" do
    assert_difference("Location.count") do
      post venues_url, params: { location: { name: @location.name } }
    end

    assert_redirected_to venue_url(Location.last)
  end

  test "should show location" do
    get venue_url(@location)
    assert_response :success
  end

  test "should get edit" do
    get edit_venue_url(@location)
    assert_response :success
  end

  test "should update location" do
    patch venue_url(@location), params: { location: { name: @location.name } }
    assert_redirected_to venue_url(@location)
  end

  test "should destroy location" do
    assert_difference("Location.count", -1) do
      delete venue_url(@location)
    end

    assert_redirected_to venues_url
  end
end
