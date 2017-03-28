class Api::LikesController < ApplicationController
  before_action :set_like, only: [:show, :update, :destroy]

  def index
    @likes = Like.all

    # Filter for relacion
    @likes = @likes.id_post(params[:id_post]) if params[:id_post]

    @likes = @likes.id_usuario(params[:id_usuario]) if params[:id_usuario]
    
    # Order by
    @likes = @likes.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @likes = @likes.page(1).per(params[:limit]).padding(params[:offset])
    else
        @likes = @likes.page(1).per(25)
    end

    if @likes.count != 0
      render json: @likes if stale?(etag: @likes.all, last_modified: @likes.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  def show
    render json: @like if stale?(@like)
    head :ok                                                                    # 200
  end

  def create
    @like = Like.create(like_params)

    if @like.save
      render json: @like, status: :created                                  # 201
    else
      render json: @like.errors, status: :unprocessable_entity              # 422
    end
  end

  def update
    if @like.update(like_params)
      head :no_content                                                          # 204
    else
      render json: @like.errors, status: :unprocessable_entity              # 422
    end
  end

  def destroy
    @like.destroy
        
    head :no_content                                                            # 204
  end

  private

    def set_like
      if Like.unscoped.where(:id => params[:id]).any?
        @like = Like.find(params[:id])
      else
        head :no_content                                                        # 204
      end
    end

    def like_params
      params.require(:like).permit(:id_post, :id_usuario, :fecha)
    end
end
