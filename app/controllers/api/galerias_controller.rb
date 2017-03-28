class Api::GaleriasController < ApplicationController
  before_action :set_galerium, only: [:show, :update, :destroy]

  def index
    @galerias = Galeria.all

    # Search
    @galerias = @galerias.id(params[:id]) if params[:id]

    # Filter for relacion
    @galerias = @galerias.id_usuario(params[:id_usuario]) if params[:id_usuario]
    @galerias = @galerias.id_imagen(params[:id_imagen]) if params[:id_imagen]
    
    # Order by
    @galerias = @galerias.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @galerias = @galerias.page(1).per(params[:limit]).padding(params[:offset])
    else
        @galerias = @galerias.page(1).per(25)
    end
    
    if @galerias.count != 0
      render json: @galerias if stale?(etag: @galerias.all, last_modified: @galerias.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  def show
    render json: @galeria if stale?(@galeria)
    head :ok                                                                    # 200
  end

  def create
    @galeria = Galeria.create(galerium_params)

    if @galeria.save
      render json: @galeria, status: :created                                  # 201
    else
      render json: @galeria.errors, status: :unprocessable_entity              # 422
    end
  end

  def update
    if @galeria.update(galerium_params)
      head :no_content                                                          # 204
    else
      render json: @galeria.errors, status: :unprocessable_entity              # 422
    end
  end

  def destroy
    @galeria.destroy
        
    head :no_content                                                            # 204
  end

  private

    def set_galerium
      if Galeria.unscoped.where(:id => params[:id]).any?
        @galeria = Galeria.find(params[:id])
      else
        head :no_content                                                        # 204
      end
    end

    def galerium_params
      params.require(:galeria).permit(:id_usuario, :id_imagen)
    end
end
