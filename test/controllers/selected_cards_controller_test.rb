require 'test_helper'

class SelectedCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get selected_cards_index_url
    assert_response :success
  end

  test "should get create" do
    get selected_cards_create_url
    assert_response :success
  end

  test "should get destroy" do
    get selected_cards_destroy_url
    assert_response :success
  end

end
