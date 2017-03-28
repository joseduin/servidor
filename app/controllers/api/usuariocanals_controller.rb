class Api::UsuariocanalsController < ApplicationController
  before_action :set_usuariocanal, only: [:show, :update, :destroy]

  def index
    @usuariocanals = Usuariocanal.all

    # Filter for relacion
    @usuariocanals = @usuariocanals.id_canal(params[:id_canal]) if params[:id_canal]

    @usuariocanals = @usuariocanals.id_usuario(params[:id_usuario]) if params[:id_usuario]
    
    # Order by
    @usuariocanals = @usuariocanals.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @usuariocanals = @usuariocanals.page(1).per(params[:limit]).padding(params[:offset])
    else
        @usuariocanals = @usuariocanals.page(1).per(25)
    end

    if @usuariocanals.count != 0
      render json: @usuariocanals if stale?(etag: @usuariocanals.all, last_modified: @usuariocanals.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  def show
    render json: @usuariocanal if stale?(@usuariocanal)
    head :ok                                                                    # 200
  end

  def create
    @usuariocanal = Usuariocanal.create(usuariocanal_params)

    if @usuariocanal.save
      render json: @usuariocanal, status: :created                                  # 201
    else
      render json: @usuariocanal.errors, status: :unprocessable_entity              # 422
    end
  end

  def update
    if @usuariocanal.update(usuariocanal_params)
      head :no_content                                                          # 204
    else
      render json: @usuariocanal.errors, status: :unprocessable_entity              # 422
    end
  end

  def destroy
    @usuariocanal.destroy
        
    head :no_content                                                            # 204
  end

  private

    def set_usuariocanal
      if Usuariocanal.unscoped.where(:id => params[:id]).any?
        @usuariocanal = Usuariocanal.find(params[:id])
      else
        head :no_content                                                        # 204
      end
    end

    def usuariocanal_params
      params.require(:usuariocanal).permit(:id_usuario, :id_canal)
    end
end
