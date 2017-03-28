require 'test_helper'

class GaleriaControllerTest < ActionController::TestCase
  setup do
    @galerium = galeria(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:galeria)
  end

  test "should create galerium" do
    assert_difference('Galerium.count') do
      post :create, galerium: { id_imagen: @galerium.id_imagen, id_usuario: @galerium.id_usuario }
    end

    assert_response 201
  end

  test "should show galerium" do
    get :show, id: @galerium
    assert_response :success
  end

  test "should update galerium" do
    put :update, id: @galerium, galerium: { id_imagen: @galerium.id_imagen, id_usuario: @galerium.id_usuario }
    assert_response 204
  end

  test "should destroy galerium" do
    assert_difference('Galerium.count', -1) do
      delete :destroy, id: @galerium
    end

    assert_response 204
  end
end
