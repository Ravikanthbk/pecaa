require 'test_helper'

class BaseColorsControllerTest < ActionController::TestCase
  setup do
    @base_color = base_colors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:base_colors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create base_color" do
    assert_difference('BaseColor.count') do
      post :create, base_color: @base_color.attributes
    end

    assert_redirected_to base_color_path(assigns(:base_color))
  end

  test "should show base_color" do
    get :show, id: @base_color.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @base_color.to_param
    assert_response :success
  end

  test "should update base_color" do
    put :update, id: @base_color.to_param, base_color: @base_color.attributes
    assert_redirected_to base_color_path(assigns(:base_color))
  end

  test "should destroy base_color" do
    assert_difference('BaseColor.count', -1) do
      delete :destroy, id: @base_color.to_param
    end

    assert_redirected_to base_colors_path
  end
end
