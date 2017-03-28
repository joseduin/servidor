class Api::InteresController < ApplicationController
  before_action :set_intere, only: [:show, :update, :destroy]

  def index
    @interes = Intere.all

    # Search
    @interes = @interes.id(params[:id]) if params[:id]

    @interes = @interes.descripcion(params[:descripcion]) if params[:descripcion]

    @interes = @interes.nombre(params[:nombre]) if params[:nombre]

    # Filter for relacion
    @interes = @interes.estatus(params[:estatus]) if params[:estatus]
    
    @interes = @interes.id_decanato(params[:id_decanato]) if params[:id_decanato]
   
    # Order by
    @interes = @interes.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @interes = @interes.page(1).per(params[:limit]).padding(params[:offset])
    else
        @interes = @interes.page(1).per(25)
    end

    if @interes.count != 0
      render json: @interes if stale?(etag: @interes.all, last_modified: @interes.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  def show
    render json: @intere if stale?(@intere)
    head :ok                                                                    # 200
  end

  def create
    @intere = Intere.create(intere_params)

    if @intere.save
      render json: @intere, status: :created                                  # 201
    else
      render json: @intere.errors, status: :unprocessable_entity              # 422
    end
  end

  def update
    if @intere.update(intere_params)
      head :no_content                                                          # 204
    else
      render json: @intere.errors, status: :unprocessable_entity              # 422
    end
  end

  def destroy
    @intere.destroy
        
    head :no_content                                                            # 204
  end

  private

    def set_intere
      if Intere.unscoped.where(:id => params[:id]).any?
        @intere = Intere.find(params[:id])
      else
        head :no_content                                                        # 204
      end
    end

    def intere_params
      params.require(:intere).permit(:nombre, :descripcion, :estatus)
    end
end
