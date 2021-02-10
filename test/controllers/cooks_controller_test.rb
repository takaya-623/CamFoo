require 'test_helper'

class CooksControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get cooks_new_url
    assert_response :success
  end

  test "should get index" do
    get cooks_index_url
    assert_response :success
  end

  test "should get net" do
    get cooks_net_url
    assert_response :success
  end

  test "should get plate" do
    get cooks_plate_url
    assert_response :success
  end

  test "should get pan" do
    get cooks_pan_url
    assert_response :success
  end

  test "should get dutch_oven" do
    get cooks_dutch_oven_url
    assert_response :success
  end

  test "should get other" do
    get cooks_other_url
    assert_response :success
  end

  test "should get show" do
    get cooks_show_url
    assert_response :success
  end

  test "should get edit" do
    get cooks_edit_url
    assert_response :success
  end
end
