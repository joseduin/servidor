class Api::DecanatosController < ApplicationController
  before_action :set_decanato, only: [:show, :update, :destroy]

  def index
    @decanatos = Decanato.all

    # Search
    @decanatos = @decanatos.nombre(params[:nombre]) if params[:nombre]
    @decanatos = @decanatos.iniciales(params[:iniciales]) if params[:iniciales]

    # Order by
    @decanatos = @decanatos.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @decanatos = @decanatos.page(1).per(params[:limit]).padding(params[:offset])
    else
        @decanatos = @decanatos.page(1).per(25)
    end

    if @decanatos.count != 0
      render json: @decanatos if stale?(etag: @decanatos.all, last_modified: @decanatos.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  def show
    render json: @decanato if stale?(@decanato)
    head :ok                                                                    # 200
  end

  def create
    @decanato = Decanato.create(decanato_params)

    if @decanato.save
      render json: @decanato, status: :created                                  # 201
    else
      render json: @decanato.errors, status: :unprocessable_entity              # 422
    end
  end

  def update
    if @decanato.update(decanato_params)
      head :no_content                                                          # 204
    else
      render json: @decanato.errors, status: :unprocessable_entity              # 422
    end
  end

  def destroy
    @decanato.destroy
        
    head :no_content                                                            # 204
  end

  private

    def set_decanato
      if Decanato.unscoped.where(:id => params[:id]).any?
        @decanato = Decanato.find(params[:id])
      else
        head :no_content                                                        # 204
      end
    end

    def decanato_params
      params.require(:decanato).permit(:iniciales, :nombre)
    end
end