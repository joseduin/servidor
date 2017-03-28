require 'test_helper'

class DiscusionesControllerTest < ActionController::TestCase
  setup do
    @discusione = discusiones(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:discusiones)
  end

  test "should create discusione" do
    assert_difference('Discusione.count') do
      post :create, discusione: { contenido: @discusione.contenido, estatus: @discusione.estatus, fecha: @discusione.fecha, id_canal: @discusione.id_canal, id_usuario: @discusione.id_usuario, titulo: @discusione.titulo }
    end

    assert_response 201
  end

  test "should show discusione" do
    get :show, id: @discusione
    assert_response :success
  end

  test "should update discusione" do
    put :update, id: @discusione, discusione: { contenido: @discusione.contenido, estatus: @discusione.estatus, fecha: @discusione.fecha, id_canal: @discusione.id_canal, id_usuario: @discusione.id_usuario, titulo: @discusione.titulo }
    assert_response 204
  end

  test "should destroy discusione" do
    assert_difference('Discusione.count', -1) do
      delete :destroy, id: @discusione
    end

    assert_response 204
  end
end
