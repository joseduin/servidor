class Api::UsuariointeresController < ApplicationController
  before_action :set_usuariointere, only: [:show, :update, :destroy]

  def index
    @usuariointeres = Usuariointere.all

    # Filter for relacion
    @usuariointeres = @usuariointeres.id_interes(params[:id_interes]) if params[:id_interes]

    @usuariointeres = @usuariointeres.id_usuario(params[:id_usuario]) if params[:id_usuario]
    
    # Order by
    @usuariointeres = @usuariointeres.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @usuariointeres = @usuariointeres.page(1).per(params[:limit]).padding(params[:offset])
    else
        @usuariointeres = @usuariointeres.page(1).per(25)
    end

    if @usuariointeres.count != 0
      render json: @usuariointeres if stale?(etag: @usuariointeres.all, last_modified: @usuariointeres.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  def show
    render json: @usuariointere if stale?(@usuariointere)
    head :ok                                                                    # 200
  end

  def create
    @usuariointere = Usuariointere.create(usuariointere_params)

    if @usuariointere.save
      render json: @usuariointere, status: :created                                  # 201
    else
      render json: @usuariointere.errors, status: :unprocessable_entity              # 422
    end
  end

  def update
    if @usuariointere.update(usuariointere_params)
      head :no_content                                                          # 204
    else
      render json: @usuariointere.errors, status: :unprocessable_entity              # 422
    end
  end

  def destroy
    @usuariointere.destroy
        
    head :no_content                                                            # 204
  end

  private

    def set_usuariointere
      if Usuariointere.unscoped.where(:id => params[:id]).any?
        @usuariointere = Usuariointere.find(params[:id])
      else
        head :no_content                                                        # 204
      end
    end

    def usuariointere_params
      params.require(:usuariointere).permit(:id_usuario, :id_interes)
    end
end
