class Api::SeguidosController < ApplicationController
  before_action :set_seguido, only: [:show, :update, :destroy]

  def index
    @seguidos = Seguido.all
    
    # Filter for relacion
    @seguidos = @seguidos.id_usuario(params[:id_usuario]) if params[:id_usuario]

    @seguidos = @seguidos.id_seguido(params[:id_seguido]) if params[:id_seguido]
    
    # Order by
    @seguidos = @seguidos.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @seguidos = @seguidos.page(1).per(params[:limit]).padding(params[:offset])
    else
        #@seguidos = @seguidos.page(1).per(25)
    end

    if @seguidos.count != 0
      render json: @seguidos if stale?(etag: @seguidos.all, last_modified: @seguidos.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  def show
    render json: @seguido if stale?(@seguido)
    head :ok                                                                    # 200
  end

  def create
    @seguido = Seguido.create(seguido_params)

    if @seguido.save
      render json: @seguido, status: :created                                  # 201
    else
      render json: @seguido.errors, status: :unprocessable_entity              # 422
    end
  end

  def update
    if @seguido.update(seguido_params)
      head :no_content                                                          # 204
    else
      render json: @seguido.errors, status: :unprocessable_entity              # 422
    end
  end

  def destroy
    @seguido.destroy
        
    head :no_content                                                            # 204
  end

  private

    def set_seguido
      if Seguido.unscoped.where(:id => params[:id]).any?
        @seguido = Seguido.find(params[:id])
      else
        head :no_content                                                        # 204
      end
    end

    def seguido_params
      params.require(:seguido).permit(:id_usuario, :id_seguido)
    end
end
