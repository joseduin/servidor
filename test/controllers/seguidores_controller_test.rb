require 'test_helper'

class SeguidoresControllerTest < ActionController::TestCase
  setup do
    @seguidore = seguidores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:seguidores)
  end

  test "should create seguidore" do
    assert_difference('Seguidore.count') do
      post :create, seguidore: { id_seguido: @seguidore.id_seguido, id_usuario: @seguidore.id_usuario }
    end

    assert_response 201
  end

  test "should show seguidore" do
    get :show, id: @seguidore
    assert_response :success
  end

  test "should update seguidore" do
    put :update, id: @seguidore, seguidore: { id_seguido: @seguidore.id_seguido, id_usuario: @seguidore.id_usuario }
    assert_response 204
  end

  test "should destroy seguidore" do
    assert_difference('Seguidore.count', -1) do
      delete :destroy, id: @seguidore
    end

    assert_response 204
  end
end
