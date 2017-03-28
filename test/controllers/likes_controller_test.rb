require 'test_helper'

class LikesControllerTest < ActionController::TestCase
  setup do
    @like = likes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:likes)
  end

  test "should create like" do
    assert_difference('Like.count') do
      post :create, like: { fecha: @like.fecha, id_post: @like.id_post, id_usuario: @like.id_usuario }
    end

    assert_response 201
  end

  test "should show like" do
    get :show, id: @like
    assert_response :success
  end

  test "should update like" do
    put :update, id: @like, like: { fecha: @like.fecha, id_post: @like.id_post, id_usuario: @like.id_usuario }
    assert_response 204
  end

  test "should destroy like" do
    assert_difference('Like.count', -1) do
      delete :destroy, id: @like
    end

    assert_response 204
  end
end
