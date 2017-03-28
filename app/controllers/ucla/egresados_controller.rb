class Ucla::EgresadosController < ApplicationController
  before_action :set_egresado, only: [:show, :update, :destroy]

  def index
    @egresados = Egresado.all

    # Search
    @egresados = @egresados.search(params[:q]) if params[:q]

    # Filter for relacion
    @egresados = @egresados.cedula(params[:cedula]) if params[:cedula]
    @egresados = @egresados.nacionalidad(params[:nacionalidad]) if params[:nacionalidad]
    
    @egresados = @egresados.email(params[:email]) if params[:email]
    
    # Order by
    @egresados = @egresados.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @egresados = @egresados.page(1).per(params[:limit]).padding(params[:offset])
    else
        @egresados = @egresados.page(1).per(25)
    end
    
    if @egresados.count != 0
      render json: @egresados if stale?(etag: @egresados.all, last_modified: @egresados.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  def show
    render json: @egresado if stale?(@egresado)
    head :ok                                                                    # 200
  end

  def create
    @egresado = Egresado.create(egresado_params)

    if @egresado.save
      render json: @egresado, status: :created                                  # 201
    else
      render json: @egresado.errors, status: :unprocessable_entity              # 422
    end
  end

  def update
    if @egresado.update(egresado_params)
      head :no_content                                                          # 204
    else
      render json: @egresado.errors, status: :unprocessable_entity              # 422
    end
  end

  def destroy
    @egresado.destroy
        
    head :no_content                                                            # 204
  end

  private

    def set_egresado
      if Egresado.unscoped.where(:id => params[:id]).any?
        @egresado = Egresado.find(params[:id])
      else
        head :no_content                                                        # 204
      end
    end

    def egresado_params
      params.require(:egresado).permit(:nacionalidad, :cedula, :nombre, :apellido, :email, :fecha_egreso, :carrera, :decanato)
    end
end