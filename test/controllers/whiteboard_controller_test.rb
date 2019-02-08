require 'test_helper'

class WhiteboardControllerTest < ActionDispatch::IntegrationTest
  test "should get wbpage" do
    get whiteboard_wbpage_url
    assert_response :success
  end

end
