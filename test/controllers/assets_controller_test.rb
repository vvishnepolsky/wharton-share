require 'test_helper'

class AssetsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get assets_new_url
    assert_response :success
  end

  test "should get create" do
    get assets_create_url
    assert_response :success
  end

  test "should get index" do
    get assets_index_url
    assert_response :success
  end

end
