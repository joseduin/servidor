require 'test_helper'

class UsuariointeresControllerTest < ActionController::TestCase
  setup do
    @usuariointere = usuariointeres(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usuariointeres)
  end

  test "should create usuariointere" do
    assert_difference('Usuariointere.count') do
      post :create, usuariointere: { id_interes: @usuariointere.id_interes, id_usuario: @usuariointere.id_usuario }
    end

    assert_response 201
  end

  test "should show usuariointere" do
    get :show, id: @usuariointere
    assert_response :success
  end

  test "should update usuariointere" do
    put :update, id: @usuariointere, usuariointere: { id_interes: @usuariointere.id_interes, id_usuario: @usuariointere.id_usuario }
    assert_response 204
  end

  test "should destroy usuariointere" do
    assert_difference('Usuariointere.count', -1) do
      delete :destroy, id: @usuariointere
    end

    assert_response 204
  end
end
