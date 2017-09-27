require 'test_helper'

class GymPricesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @gym_price = gym_prices(:one)
  end

  test "should get index" do
    get gym_prices_url
    assert_response :success
  end

  test "should get new" do
    get new_gym_price_url
    assert_response :success
  end

  test "should create gym_price" do
    assert_difference('GymPrice.count') do
      post gym_prices_url, params: { gym_price: { price: @gym_price.price } }
    end

    assert_redirected_to gym_price_url(GymPrice.last)
  end

  test "should show gym_price" do
    get gym_price_url(@gym_price)
    assert_response :success
  end

  test "should get edit" do
    get edit_gym_price_url(@gym_price)
    assert_response :success
  end

  test "should update gym_price" do
    patch gym_price_url(@gym_price), params: { gym_price: { price: @gym_price.price } }
    assert_redirected_to gym_price_url(@gym_price)
  end

  test "should destroy gym_price" do
    assert_difference('GymPrice.count', -1) do
      delete gym_price_url(@gym_price)
    end

    assert_redirected_to gym_prices_url
  end
end
