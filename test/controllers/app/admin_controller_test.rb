require "test_helper"

class App::AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get homes" do
    get app_admin_homes_url
    assert_response :success
  end

  test "should get top" do
    get app_admin_top_url
    assert_response :success
  end
end
