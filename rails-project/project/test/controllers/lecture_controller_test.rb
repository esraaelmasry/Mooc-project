require 'test_helper'

class LectureControllerTest < ActionDispatch::IntegrationTest
  test "should get download" do
    get lecture_download_url
    assert_response :success
  end

end
