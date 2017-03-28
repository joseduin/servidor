require 'test_helper'

class ComentariodiscucionsControllerTest < ActionController::TestCase
  setup do
    @comentariodiscucion = comentariodiscucions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comentariodiscucions)
  end

  test "should create comentariodiscucion" do
    assert_difference('Comentariodiscucion.count') do
      post :create, comentariodiscucion: { contenido: @comentariodiscucion.contenido, fecha: @comentariodiscucion.fecha, id_post: @comentariodiscucion.id_post, id_usuario: @comentariodiscucion.id_usuario }
    end

    assert_response 201
  end

  test "should show comentariodiscucion" do
    get :show, id: @comentariodiscucion
    assert_response :success
  end

  test "should update comentariodiscucion" do
    put :update, id: @comentariodiscucion, comentariodiscucion: { contenido: @comentariodiscucion.contenido, fecha: @comentariodiscucion.fecha, id_post: @comentariodiscucion.id_post, id_usuario: @comentariodiscucion.id_usuario }
    assert_response 204
  end

  test "should destroy comentariodiscucion" do
    assert_difference('Comentariodiscucion.count', -1) do
      delete :destroy, id: @comentariodiscucion
    end

    assert_response 204
  end
end
