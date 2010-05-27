require 'test_helper'

class ImportsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imports)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create import" do
    assert_difference('Import.count') do
      post :create, :import => { }
    end

    assert_redirected_to import_path(assigns(:import))
  end

  test "should show import" do
    get :show, :id => imports(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => imports(:one).to_param
    assert_response :success
  end

  test "should update import" do
    put :update, :id => imports(:one).to_param, :import => { }
    assert_redirected_to import_path(assigns(:import))
  end

  test "should destroy import" do
    assert_difference('Import.count', -1) do
      delete :destroy, :id => imports(:one).to_param
    end

    assert_redirected_to imports_path
  end
end
