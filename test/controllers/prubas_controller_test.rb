require 'test_helper'

class PrubasControllerTest < ActionController::TestCase
  setup do
    @pruba = prubas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:prubas)
  end

  test "should create pruba" do
    assert_difference('Pruba.count') do
      post :create, pruba: { name: @pruba.name }
    end

    assert_response 201
  end

  test "should show pruba" do
    get :show, id: @pruba
    assert_response :success
  end

  test "should update pruba" do
    put :update, id: @pruba, pruba: { name: @pruba.name }
    assert_response 204
  end

  test "should destroy pruba" do
    assert_difference('Pruba.count', -1) do
      delete :destroy, id: @pruba
    end

    assert_response 204
  end
end
