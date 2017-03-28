require 'test_helper'

class ImagenesControllerTest < ActionController::TestCase
  setup do
    @imagene = imagenes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:imagenes)
  end

  test "should create imagene" do
    assert_difference('Imagene.count') do
      post :create, imagene: { data: @imagene.data, filename: @imagene.filename, nombre: @imagene.nombre, tipo: @imagene.tipo }
    end

    assert_response 201
  end

  test "should show imagene" do
    get :show, id: @imagene
    assert_response :success
  end

  test "should update imagene" do
    put :update, id: @imagene, imagene: { data: @imagene.data, filename: @imagene.filename, nombre: @imagene.nombre, tipo: @imagene.tipo }
    assert_response 204
  end

  test "should destroy imagene" do
    assert_difference('Imagene.count', -1) do
      delete :destroy, id: @imagene
    end

    assert_response 204
  end
end
