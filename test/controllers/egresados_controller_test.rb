require 'test_helper'

class EgresadosControllerTest < ActionController::TestCase
  setup do
    @egresado = egresados(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:egresados)
  end

  test "should create egresado" do
    assert_difference('Egresado.count') do
      post :create, egresado: { apellido: @egresado.apellido, carrera: @egresado.carrera, cedula: @egresado.cedula, decanato: @egresado.decanato, email: @egresado.email, fecha_egreso: @egresado.fecha_egreso, nacionalidad: @egresado.nacionalidad, nombre: @egresado.nombre }
    end

    assert_response 201
  end

  test "should show egresado" do
    get :show, id: @egresado
    assert_response :success
  end

  test "should update egresado" do
    put :update, id: @egresado, egresado: { apellido: @egresado.apellido, carrera: @egresado.carrera, cedula: @egresado.cedula, decanato: @egresado.decanato, email: @egresado.email, fecha_egreso: @egresado.fecha_egreso, nacionalidad: @egresado.nacionalidad, nombre: @egresado.nombre }
    assert_response 204
  end

  test "should destroy egresado" do
    assert_difference('Egresado.count', -1) do
      delete :destroy, id: @egresado
    end

    assert_response 204
  end
end
