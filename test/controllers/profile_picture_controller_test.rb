require 'test_helper'

class ProfilePictureControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get profile_picture_create_url
    assert_response :success
  end

end
