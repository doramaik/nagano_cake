require "test_helper"

class Admin::ItmesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_itmes_new_url
    assert_response :success
  end

  test "should get index" do
    get admin_itmes_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_itmes_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_itmes_edit_url
    assert_response :success
  end
end
