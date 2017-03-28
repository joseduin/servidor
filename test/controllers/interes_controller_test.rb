require 'test_helper'

class InteresControllerTest < ActionController::TestCase
  setup do
    @intere = interes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:interes)
  end

  test "should create intere" do
    assert_difference('Intere.count') do
      post :create, intere: { descripcion: @intere.descripcion, estatus: @intere.estatus, nombre: @intere.nombre }
    end

    assert_response 201
  end

  test "should show intere" do
    get :show, id: @intere
    assert_response :success
  end

  test "should update intere" do
    put :update, id: @intere, intere: { descripcion: @intere.descripcion, estatus: @intere.estatus, nombre: @intere.nombre }
    assert_response 204
  end

  test "should destroy intere" do
    assert_difference('Intere.count', -1) do
      delete :destroy, id: @intere
    end

    assert_response 204
  end
end
