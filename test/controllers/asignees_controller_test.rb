require "test_helper"

class AsigneesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @asignee = asignees(:one)
  end

  test "should get index" do
    get asignees_url
    assert_response :success
  end

  test "should get new" do
    get new_asignee_url
    assert_response :success
  end

  test "should create asignee" do
    assert_difference("Asignee.count") do
      post asignees_url, params: { asignee: { is_coach: @asignee.is_coach, name: @asignee.name } }
    end

    assert_redirected_to asignee_url(Asignee.last)
  end

  test "should show asignee" do
    get asignee_url(@asignee)
    assert_response :success
  end

  test "should get edit" do
    get edit_asignee_url(@asignee)
    assert_response :success
  end

  test "should update asignee" do
    patch asignee_url(@asignee), params: { asignee: { is_coach: @asignee.is_coach, name: @asignee.name } }
    assert_redirected_to asignee_url(@asignee)
  end

  test "should destroy asignee" do
    assert_difference("Asignee.count", -1) do
      delete asignee_url(@asignee)
    end

    assert_redirected_to asignees_url
  end
end
