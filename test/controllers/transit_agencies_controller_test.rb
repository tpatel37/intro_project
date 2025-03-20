require "test_helper"

class TransitAgenciesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get transit_agencies_index_url
    assert_response :success
  end

  test "should get show" do
    get transit_agencies_show_url
    assert_response :success
  end
end
