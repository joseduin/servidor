class Api::PruebasController < ApplicationController
  before_action :set_prueba, only: [:show, :update, :destroy]


  def imagenes
    
  end

  def index
     @pruebas = Prueba.all

    # Search

    # Order by
    @pruebas = @pruebas.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @pruebas = @pruebas.page(1).per(params[:limit]).padding(params[:offset])
    else
        @pruebas = @pruebas.page(1).per(25)
    end

    if @pruebas.count != 0
      render json: @pruebas if stale?(etag: @pruebas.all, last_modified: @pruebas.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  # GET /pruebas/1
  # GET /pruebas/1.json
  def show
    render json: @prueba
  end

  def create
    @prueba = Prueba.new(prueba_params)

    if @prueba.save
      render json: @prueba, status: :created
    else
      render json: @prueba.errors, status: :unprocessable_entity
    end
  end

  def update
    if @prueba.update(prueba_params)
      #image = Paperclip.io_adapters.for(params[:prueba][:foto])
      #image.original_filename = "file.jpg"
      #@prueba.avatar = image
      head :no_content
    else
      render json: @prueba.errors, status: :unprocessable_entity
    end
  end
  
  def destroy
    @prueba.destroy

    head :no_content
  end

  private

    def set_prueba
     # @prueba = Prueba.find(params[:id])
    end

    def prueba_params
      params.require(:prueba).permit(:name, :avatar)
    end
end
