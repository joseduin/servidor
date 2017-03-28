class Api::PostsController < ApplicationController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = Post.all

    # Search
    @posts = @posts.id(params[:id]) if params[:id]

    @posts = @posts.titulo(params[:titulo]) if params[:titulo]

    # Filter for relacion
    @posts = @posts.id_canal(params[:id_canal]) if params[:id_canal]
    
    @posts = @posts.id_usuario(params[:id_usuario]) if params[:id_usuario]
    
    @posts = @posts.tipo(params[:tipo]) if params[:tipo]
    
    # Order by
    @posts = @posts.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @posts = @posts.page(1).per(params[:limit]).padding(params[:offset])
    else
        #@posts = @posts.page(1).per(25)
    end

    if @posts.count != 0
      render json: @posts if stale?(etag: @posts.all, last_modified: @posts.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  def show
    render json: @post if stale?(@post)
    head :ok                                                                    # 200
  end

  def create
    @post = Post.create(post_params)

    if @post.save
      render json: @post, status: :created                                  # 201
    else
      render json: @post.errors, status: :unprocessable_entity              # 422
    end
  end

  def update
    if @post.update(post_params)
      head :no_content                                                          # 204
    else
      render json: @post.errors, status: :unprocessable_entity              # 422
    end
  end

  def destroy
    @post.destroy
        
    head :no_content                                                            # 204
  end

  private

    def set_post
      if Post.unscoped.where(:id => params[:id]).any?
        @post = Post.find(params[:id])
      else
        head :no_content                                                        # 204
      end
    end

    def post_params
      params.require(:post).permit(:tipo, :id_usuario, :id_canal, :titulo, :contenido, :fecha, :estatus)
    end
end
