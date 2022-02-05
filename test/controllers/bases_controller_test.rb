require 'test_helper'

class BasesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get bases_edit_url
    assert_response :success
  end

end
