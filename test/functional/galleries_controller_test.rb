require 'test_helper'

class GalleriesControllerTest < ActionController::TestCase
  setup do
    @gallery = galleries(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:galleries)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gallery" do
    assert_difference('Gallery.count') do
      post :create, gallery: { avatar_url: @gallery.avatar_url, caption: @gallery.caption, colour: @gallery.colour, homage_url: @gallery.homage_url, location: @gallery.location, theme: @gallery.theme, timescale: @gallery.timescale, title: @gallery.title, user_id: @gallery.user_id }
    end

    assert_redirected_to gallery_path(assigns(:gallery))
  end

  test "should show gallery" do
    get :show, id: @gallery
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gallery
    assert_response :success
  end

  test "should update gallery" do
    put :update, id: @gallery, gallery: { avatar_url: @gallery.avatar_url, caption: @gallery.caption, colour: @gallery.colour, homage_url: @gallery.homage_url, location: @gallery.location, theme: @gallery.theme, timescale: @gallery.timescale, title: @gallery.title, user_id: @gallery.user_id }
    assert_redirected_to gallery_path(assigns(:gallery))
  end

  test "should destroy gallery" do
    assert_difference('Gallery.count', -1) do
      delete :destroy, id: @gallery
    end

    assert_redirected_to galleries_path
  end
end
