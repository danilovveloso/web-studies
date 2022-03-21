require "test_helper"

class ArcticlesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get arcticles_index_url
    assert_response :success
  end
end
