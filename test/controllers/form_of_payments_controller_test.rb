require 'test_helper'

class FormOfPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @form_of_payment = form_of_payments(:one)
  end

  test "should get index" do
    get form_of_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_form_of_payment_url
    assert_response :success
  end

  test "should create form_of_payment" do
    assert_difference('FormOfPayment.count') do
      post form_of_payments_url, params: { form_of_payment: { title: @form_of_payment.title } }
    end

    assert_redirected_to form_of_payment_url(FormOfPayment.last)
  end

  test "should show form_of_payment" do
    get form_of_payment_url(@form_of_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_form_of_payment_url(@form_of_payment)
    assert_response :success
  end

  test "should update form_of_payment" do
    patch form_of_payment_url(@form_of_payment), params: { form_of_payment: { title: @form_of_payment.title } }
    assert_redirected_to form_of_payment_url(@form_of_payment)
  end

  test "should destroy form_of_payment" do
    assert_difference('FormOfPayment.count', -1) do
      delete form_of_payment_url(@form_of_payment)
    end

    assert_redirected_to form_of_payments_url
  end
end
