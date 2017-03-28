class Api::DiscusionesController < ApplicationController
  before_action :set_discusione, only: [:show, :update, :destroy]

  def index
    @discuciones = Discusione.all

    # Search
    @discuciones = @discuciones.id(params[:id]) if params[:id]

    @discuciones = @discuciones.titulo(params[:titulo]) if params[:titulo]

    # Filter for relacion
    @discuciones = @discuciones.id_canal(params[:id_canal]) if params[:id_canal]
    
    @discuciones = @discuciones.id_usuario(params[:id_usuario]) if params[:id_usuario]
    
    @discuciones = @discuciones.tipo(params[:tipo]) if params[:tipo]
    
    # Order by
    @discuciones = @discuciones.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @discuciones = @discuciones.page(1).per(params[:limit]).padding(params[:offset])
    else
        #@discuciones = @discuciones.page(1).per(25)
    end

    if @discuciones.count != 0
      render json: @discuciones if stale?(etag: @discuciones.all, last_modified: @discuciones.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  def show
    render json: @discucione if stale?(@discucione)
    head :ok                                                                    # 200
  end

  def create
    @discucione = Discusione.create(discusione_params)

    if @discucione.save
      render json: @discucione, status: :created                                  # 201
    else
      render json: @discucione.errors, status: :unprocessable_entity              # 422
    end
  end

  def update
    if @discucione.update(discusione_params)
      head :no_content                                                          # 204
    else
      render json: @discucione.errors, status: :unprocessable_entity              # 422
    end
  end

  def destroy
    @discucione.destroy
        
    head :no_content                                                            # 204
  end

  private

    def set_discusione
      if Discusione.unscoped.where(:id => params[:id]).any?
        @discucione = Discusione.find(params[:id])
      else
        head :no_content                                                        # 204
      end
    end

    def discusione_params
      params.require(:discusione).permit(:id_usuario, :id_canal, :titulo, :contenido, :fecha, :estatus)
    end
end
