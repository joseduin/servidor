require 'test_helper'

class PruebasControllerTest < ActionController::TestCase
  setup do
    @prueba = pruebas(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pruebas)
  end

  test "should create prueba" do
    assert_difference('Prueba.count') do
      post :create, prueba: { name: @prueba.name }
    end

    assert_response 201
  end

  test "should show prueba" do
    get :show, id: @prueba
    assert_response :success
  end

  test "should update prueba" do
    put :update, id: @prueba, prueba: { name: @prueba.name }
    assert_response 204
  end

  test "should destroy prueba" do
    assert_difference('Prueba.count', -1) do
      delete :destroy, id: @prueba
    end

    assert_response 204
  end
end
