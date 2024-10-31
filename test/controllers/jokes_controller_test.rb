require "test_helper"

class JokesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jokes_index_url
    assert_response :success
  end

  test "should get show" do
    get jokes_show_url
    assert_response :success
  end
end
