require 'test_helper'

class WordupsControllerTest < ActionController::TestCase
  setup do
    @wordup = wordups(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wordups)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wordup" do
    assert_difference('Wordup.count') do
      post :create, wordup: { textinput: @wordup.textinput }
    end

    assert_redirected_to wordup_path(assigns(:wordup))
  end

  test "should show wordup" do
    get :show, id: @wordup
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wordup
    assert_response :success
  end

  test "should update wordup" do
    put :update, id: @wordup, wordup: { textinput: @wordup.textinput }
    assert_redirected_to wordup_path(assigns(:wordup))
  end

  test "should destroy wordup" do
    assert_difference('Wordup.count', -1) do
      delete :destroy, id: @wordup
    end

    assert_redirected_to wordups_path
  end
end
