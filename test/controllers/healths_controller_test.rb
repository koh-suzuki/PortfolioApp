require 'test_helper'

class HealthsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get healths_index_url
    assert_response :success
  end

  test "should get show" do
    get healths_show_url
    assert_response :success
  end

  test "should get new" do
    get healths_new_url
    assert_response :success
  end

  test "should get edit" do
    get healths_edit_url
    assert_response :success
  end

end
