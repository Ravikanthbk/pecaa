require 'test_helper'

class SiteLinksControllerTest < ActionController::TestCase
  setup do
    @site_link = site_links(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:site_links)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create site_link" do
    assert_difference('SiteLink.count') do
      post :create, :site_link => @site_link.attributes
    end

    assert_redirected_to site_link_path(assigns(:site_link))
  end

  test "should show site_link" do
    get :show, :id => @site_link.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @site_link.to_param
    assert_response :success
  end

  test "should update site_link" do
    put :update, :id => @site_link.to_param, :site_link => @site_link.attributes
    assert_redirected_to site_link_path(assigns(:site_link))
  end

  test "should destroy site_link" do
    assert_difference('SiteLink.count', -1) do
      delete :destroy, :id => @site_link.to_param
    end

    assert_redirected_to site_links_path
  end
end
