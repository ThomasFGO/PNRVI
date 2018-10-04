require 'test_helper'

class CollectionCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get collection_cards_index_url
    assert_response :success
  end

  test "should get new" do
    get collection_cards_new_url
    assert_response :success
  end

  test "should get create" do
    get collection_cards_create_url
    assert_response :success
  end

  test "should get delete" do
    get collection_cards_delete_url
    assert_response :success
  end

end
