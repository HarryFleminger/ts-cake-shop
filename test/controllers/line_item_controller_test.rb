require "test_helper"

class LineItemControllerTest < ActionDispatch::IntegrationTest
  test "should get line-item" do
    get line_item_line-item_url
    assert_response :success
  end
end
