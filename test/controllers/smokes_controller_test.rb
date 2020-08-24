require 'test_helper'

class SmokesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get smokes_new_url
    assert_response :success
  end

  test "should get create" do
    get smokes_create_url
    assert_response :success
  end

  test "should get destroy" do
    get smokes_destroy_url
    assert_response :success
  end

end
