require 'test_helper'

class TellersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @teller = tellers(:one)
  end

  test "should get index" do
    get tellers_url, as: :json
    assert_response :success
  end

  test "should create teller" do
    assert_difference('Teller.count') do
      post tellers_url, params: { teller: { denomination: @teller.denomination, notes: @teller.notes } }, as: :json
    end

    assert_response 201
  end

  test "should show teller" do
    get teller_url(@teller), as: :json
    assert_response :success
  end

  test "should update teller" do
    patch teller_url(@teller), params: { teller: { denomination: @teller.denomination, notes: @teller.notes } }, as: :json
    assert_response 200
  end

  test "should destroy teller" do
    assert_difference('Teller.count', -1) do
      delete teller_url(@teller), as: :json
    end

    assert_response 204
  end
end
