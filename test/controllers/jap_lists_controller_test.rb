require 'test_helper'

class JapListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get jap_lists_index_url
    assert_response :success
  end

end
