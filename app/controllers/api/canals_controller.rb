class Api::CanalsController < ApplicationController
  before_action :set_canal, only: [:show, :update, :destroy]
  
  def index
    @canals = Canal.all

    # Search
    @canals = @canals.id(params[:id]) if params[:id]
    @canals = @canals.nombre(params[:nombre]) if params[:nombre]
    @canals = @canals.id_interes(params[id_interes]) if params[:id_interes]

    # Filter for relacion
    @canals = @canals.id_decanato(params[:id_decanato]) if params[:id_decanato]

    @canals = @canals.id_creador(params[:id_creador]) if params[:id_creador]
    
    # Order by
    @canals = @canals.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @canals = @canals.page(1).per(params[:limit]).padding(params[:offset])
    else
        @canals = @canals.page(1).per(25)
    end

    if @canals.count != 0
      render json: @canals if stale?(etag: @canals.all, last_modified: @canals.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  def show
    render json: @canal if stale?(@canal)
    head :ok                                                                    # 200
  end

  def create
    @canal = Canal.create(canal_params)

    if @canal.save
      render json: @canal, status: :created                                  # 201
    else
      render json: @canal.errors, status: :unprocessable_entity              # 422
    end
  end

  def update
    if @canal.update(canal_params)
      head :no_content                                                          # 204
    else
      render json: @canal.errors, status: :unprocessable_entity              # 422
    end
  end

  def destroy
    @canal.destroy
        
    head :no_content                                                            # 204
  end

  private

    def set_canal
      if Canal.unscoped.where(:id => params[:id]).any?
        @canal = Canal.find(params[:id])
      else
        head :no_content                                                        # 204
      end
    end

    def canal_params
      params.require(:canal).permit(:id_creador, :id_interes, :id_imagen, :nombre, :descripcion, :estatus)
    end
end
