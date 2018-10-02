require 'test_helper'

class RefCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get ref_cards_show_url
    assert_response :success
  end

end
