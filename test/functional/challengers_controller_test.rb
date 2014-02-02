require 'test_helper'

class ChallengersControllerTest < ActionController::TestCase
  setup do
    @challenger = challengers(:one)
     @update = {
      title:       'Lorem Ipsum',
      caption: 'Bowies on now!',
      homage_url:   'lorem.jpg',
      colour: 'Orange',
      location: 'Garden',
      theme: 'Weather',
      timescale: '30 minutes'
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:challengers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create challenger" do
    assert_difference('Challenger.count') do
      post :create, challenger: @update
    end

    assert_redirected_to challenger_path(assigns(:challenger))
  end

  test "should show challenger" do
    get :show, id: @challenger
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @challenger
    assert_response :success
  end

  test "should update challenger" do
    put :update, id: @challenger, challenger: @update
    assert_redirected_to challenger_path(assigns(:challenger))
  end

  test "should destroy challenger" do
    assert_difference('Challenger.count', -1) do
      delete :destroy, id: @challenger
    end

    assert_redirected_to challengers_path
  end
end
