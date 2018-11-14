require 'test_helper'

class SearchCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get search_cards_index_url
    assert_response :success
  end

  test "should get show" do
    get search_cards_show_url
    assert_response :success
  end

  test "should get new" do
    get search_cards_new_url
    assert_response :success
  end

end
