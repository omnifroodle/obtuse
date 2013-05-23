require 'test_helper'

class WitticismsControllerTest < ActionController::TestCase
  setup do
    @witticism = witticisms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:witticisms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create witticism" do
    assert_difference('Witticism.count') do
      post :create, witticism: { quote: @witticism.quote }
    end

    assert_redirected_to witticism_path(assigns(:witticism))
  end

  test "should show witticism" do
    get :show, id: @witticism
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @witticism
    assert_response :success
  end

  test "should update witticism" do
    patch :update, id: @witticism, witticism: { quote: @witticism.quote }
    assert_redirected_to witticism_path(assigns(:witticism))
  end

  test "should destroy witticism" do
    assert_difference('Witticism.count', -1) do
      delete :destroy, id: @witticism
    end

    assert_redirected_to witticisms_path
  end
end
