class Api::ComentariodiscucionsController < ApplicationController
  before_action :set_comentariodiscucion, only: [:show, :update, :destroy]

  def index
    @comentarios = Comentariodiscucion.all

    # Filter for relacion
    @comentarios = @comentarios.id_post(params[:id_post]) if params[:id_post]

    @comentarios = @comentarios.id_usuario(params[:id_usuario]) if params[:id_usuario]
    
    # Order by
    @comentarios = @comentarios.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @comentarios = @comentarios.page(1).per(params[:limit]).padding(params[:offset])
    else
        @comentarios = @comentarios.page(1).per(25)
    end

    if @comentarios.count != 0
      render json: @comentarios if stale?(etag: @comentarios.all, last_modified: @comentarios.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  def show
    render json: @comentario if stale?(@comentario)
    head :ok                                                                    # 200
  end

  def create
    @comentario = Comentariodiscucion.create(comentariodiscucion_params)

    if @comentario.save
      render json: @comentario, status: :created                                  # 201
    else
      render json: @comentario.errors, status: :unprocessable_entity              # 422
    end
  end

  def update
    if @comentario.update(comentariodiscucion_params)
      head :no_content                                                          # 204
    else
      render json: @comentario.errors, status: :unprocessable_entity              # 422
    end
  end

  def destroy
    @comentario.destroy
        
    head :no_content                                                            # 204
  end

  private

    def set_comentariodiscucion
      if Comentariodiscucion.unscoped.where(:id => params[:id]).any?
        @comentario = Comentariodiscucion.find(params[:id])
      else
        head :no_content                                                        # 204
      end
  end

    def comentariodiscucion_params
      params.require(:comentariodiscucion).permit(:id_post, :id_usuario, :contenido, :fecha)
    end
end
