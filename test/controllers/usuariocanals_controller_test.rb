require 'test_helper'

class UsuariocanalsControllerTest < ActionController::TestCase
  setup do
    @usuariocanal = usuariocanals(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usuariocanals)
  end

  test "should create usuariocanal" do
    assert_difference('Usuariocanal.count') do
      post :create, usuariocanal: { id_canal: @usuariocanal.id_canal, id_usuario: @usuariocanal.id_usuario }
    end

    assert_response 201
  end

  test "should show usuariocanal" do
    get :show, id: @usuariocanal
    assert_response :success
  end

  test "should update usuariocanal" do
    put :update, id: @usuariocanal, usuariocanal: { id_canal: @usuariocanal.id_canal, id_usuario: @usuariocanal.id_usuario }
    assert_response 204
  end

  test "should destroy usuariocanal" do
    assert_difference('Usuariocanal.count', -1) do
      delete :destroy, id: @usuariocanal
    end

    assert_response 204
  end
end
