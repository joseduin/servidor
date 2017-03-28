require 'test_helper'

class PerfilsControllerTest < ActionController::TestCase
  setup do
    @perfil = perfils(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:perfils)
  end

  test "should create perfil" do
    assert_difference('Perfil.count') do
      post :create, perfil: { ciudad: @perfil.ciudad, estado: @perfil.estado, fecha_nacimiento: @perfil.fecha_nacimiento, id_imagen: @perfil.id_imagen, id_usuario: @perfil.id_usuario, ocupacion: @perfil.ocupacion, pais: @perfil.pais, sobre_mi: @perfil.sobre_mi, telefono: @perfil.telefono, titulo: @perfil.titulo, username: @perfil.username }
    end

    assert_response 201
  end

  test "should show perfil" do
    get :show, id: @perfil
    assert_response :success
  end

  test "should update perfil" do
    put :update, id: @perfil, perfil: { ciudad: @perfil.ciudad, estado: @perfil.estado, fecha_nacimiento: @perfil.fecha_nacimiento, id_imagen: @perfil.id_imagen, id_usuario: @perfil.id_usuario, ocupacion: @perfil.ocupacion, pais: @perfil.pais, sobre_mi: @perfil.sobre_mi, telefono: @perfil.telefono, titulo: @perfil.titulo, username: @perfil.username }
    assert_response 204
  end

  test "should destroy perfil" do
    assert_difference('Perfil.count', -1) do
      delete :destroy, id: @perfil
    end

    assert_response 204
  end
end
