require 'test_helper'

class PlatformControllerTest < ActionDispatch::IntegrationTest
  test "should get view" do
    get platform_view_url
    assert_response :success
  end

end
