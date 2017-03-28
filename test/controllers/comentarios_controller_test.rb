require 'test_helper'

class ComentariosControllerTest < ActionController::TestCase
  setup do
    @comentario = comentarios(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comentarios)
  end

  test "should create comentario" do
    assert_difference('Comentario.count') do
      post :create, comentario: { contenido: @comentario.contenido, fecha: @comentario.fecha, id_post: @comentario.id_post, id_usuario: @comentario.id_usuario }
    end

    assert_response 201
  end

  test "should show comentario" do
    get :show, id: @comentario
    assert_response :success
  end

  test "should update comentario" do
    put :update, id: @comentario, comentario: { contenido: @comentario.contenido, fecha: @comentario.fecha, id_post: @comentario.id_post, id_usuario: @comentario.id_usuario }
    assert_response 204
  end

  test "should destroy comentario" do
    assert_difference('Comentario.count', -1) do
      delete :destroy, id: @comentario
    end

    assert_response 204
  end
end
