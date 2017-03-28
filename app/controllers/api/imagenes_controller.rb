class Api::ImagenesController < ApplicationController
  before_action :set_imagene, only: [:show, :update, :destroy]

  def index
    @imagenes = Imagene.all

    # Search
    @imagenes = @imagenes.nombre(params[:nombre]) if params[:nombre]
    
    @imagenes = @imagenes.id(params[:id]) if params[:id]

    # Filter for relacion
    @imagenes = @imagenes.tipo(params[:tipo]) if params[:tipo]

    @imagenes = @imagenes.filename(params[:filename]) if params[:filename]
    
    # Order by
    @imagenes = @imagenes.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @imagenes = @imagenes.page(1).per(params[:limit]).padding(params[:offset])
    else
        #@imagenes = @imagenes.page(1).per(25)
    end

    if @imagenes.count != 0
      render json: @imagenes if stale?(etag: @imagenes.all, last_modified: @imagenes.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  def show
    render json: @imagene if stale?(@imagene)
    head :ok                                                                    # 200
  end

  def create
    @imagene = Imagene.create(imagene_params)

    if @imagene.save
      render json: @imagene, status: :created                                  # 201
    else
      render json: @imagene.errors, status: :unprocessable_entity              # 422
    end
  end

  def update
    if @imagene.update(imagene_params)
      head :no_content                                                          # 204
    else
      render json: @imagene.errors, status: :unprocessable_entity              # 422
    end
  end

  def destroy
    @imagene.destroy
        
    head :no_content                                                            # 204
  end

  private

    def set_imagene
      if Imagene.unscoped.where(:id => params[:id]).any?
        @imagene = Imagene.find(params[:id])
      else
        head :no_content                                                        # 204
      end
    end

    def imagene_params
      params.require(:imagene).permit(:nombre, :data, :filename, :tipo)
    end
end
