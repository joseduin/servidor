require 'test_helper'

class SeguidosControllerTest < ActionController::TestCase
  setup do
    @seguido = seguidos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seguidos)
  end

  test "should create seguido" do
    assert_difference('Seguido.count') do
      post :create, seguido: { id_seguido: @seguido.id_seguido, id_usuario: @seguido.id_usuario }
    end

    assert_response 201
  end

  test "should show seguido" do
    get :show, id: @seguido
    assert_response :success
  end

  test "should update seguido" do
    put :update, id: @seguido, seguido: { id_seguido: @seguido.id_seguido, id_usuario: @seguido.id_usuario }
    assert_response 204
  end

  test "should destroy seguido" do
    assert_difference('Seguido.count', -1) do
      delete :destroy, id: @seguido
    end

    assert_response 204
  end
end
