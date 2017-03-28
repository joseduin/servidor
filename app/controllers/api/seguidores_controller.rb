class Api::SeguidoresController < ApplicationController
  before_action :set_seguidore, only: [:show, :update, :destroy]

  def index
    @seguidores = Seguidore.all

    # Filter for relacion
    @seguidores = @seguidores.id_seguidor(params[:id_seguidor]) if params[:id_seguidor]

    @seguidores = @seguidores.id_usuario(params[:id_usuario]) if params[:id_usuario]
    
    # Order by
    @seguidores = @seguidores.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @seguidores = @seguidores.page(1).per(params[:limit]).padding(params[:offset])
    else
        #@seguidores = @seguidores.page(1).per(25)
    end

    if @seguidores.count != 0
      render json: @seguidores if stale?(etag: @seguidores.all, last_modified: @seguidores.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  def show
    render json: @seguidore if stale?(@seguidore)
    head :ok                                                                    # 200
  end

  def create
    @seguidore = Seguidore.create(seguidore_params)

    if @seguidore.save
      render json: @seguidore, status: :created                                  # 201
    else
      render json: @seguidore.errors, status: :unprocessable_entity              # 422
    end
  end

  def update
    if @seguidore.update(seguidore_params)
      head :no_content                                                          # 204
    else
      render json: @seguidore.errors, status: :unprocessable_entity              # 422
    end
  end

  def destroy
    @seguidore.destroy
        
    head :no_content                                                            # 204
  end

  private

    def set_seguidore
      if Seguidore.unscoped.where(:id => params[:id]).any?
        @seguidore = Seguidore.find(params[:id])
      else
        head :no_content                                                        # 204
      end
    end

    def seguidore_params
      params.require(:seguidore).permit(:id_usuario, :id_seguidor)
    end
end
