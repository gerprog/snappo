require 'test_helper'

class FlatboxesControllerTest < ActionController::TestCase
  setup do
    @flatbox = flatboxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:flatboxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create flatbox" do
    assert_difference('Flatbox.count') do
      post :create, flatbox: {  }
    end

    assert_redirected_to flatbox_path(assigns(:flatbox))
  end

  test "should show flatbox" do
    get :show, id: @flatbox
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @flatbox
    assert_response :success
  end

  test "should update flatbox" do
    put :update, id: @flatbox, flatbox: {  }
    assert_redirected_to flatbox_path(assigns(:flatbox))
  end

  test "should destroy flatbox" do
    assert_difference('Flatbox.count', -1) do
      delete :destroy, id: @flatbox
    end

    assert_redirected_to flatboxes_path
  end
end
