require 'test_helper'

class MoniesControllerTest < ActionController::TestCase
  setup do
    @mony = monies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:monies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mony" do
    assert_difference('Mony.count') do
      post :create, mony: { amount: @mony.amount, other_party: @mony.other_party}
    end

    assert_redirected_to mony_path(assigns(:mony))
  end

  test "should show mony" do
    get :show, id: @mony
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mony
    assert_response :success
  end

  test "should update mony" do
    patch :update, id: @mony, mony: { amount: @mony.amount, other_party: @mony.other_party}
    assert_redirected_to mony_path(assigns(:mony))
  end

  test "should destroy mony" do
    assert_difference('Mony.count', -1) do
      delete :destroy, id: @mony
    end

    assert_redirected_to monies_path
  end
end
