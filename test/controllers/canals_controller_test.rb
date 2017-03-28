require 'test_helper'

class CanalsControllerTest < ActionController::TestCase
  setup do
    @canal = canals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:canals)
  end

  test "should create canal" do
    assert_difference('Canal.count') do
      post :create, canal: { descripcion: @canal.descripcion, estatus: @canal.estatus, id_creador: @canal.id_creador, id_imagen: @canal.id_imagen, id_interes: @canal.id_interes, nombre: @canal.nombre }
    end

    assert_response 201
  end

  test "should show canal" do
    get :show, id: @canal
    assert_response :success
  end

  test "should update canal" do
    put :update, id: @canal, canal: { descripcion: @canal.descripcion, estatus: @canal.estatus, id_creador: @canal.id_creador, id_imagen: @canal.id_imagen, id_interes: @canal.id_interes, nombre: @canal.nombre }
    assert_response 204
  end

  test "should destroy canal" do
    assert_difference('Canal.count', -1) do
      delete :destroy, id: @canal
    end

    assert_response 204
  end
end
