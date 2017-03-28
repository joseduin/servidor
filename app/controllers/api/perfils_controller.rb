class Api::PerfilsController < ApplicationController
  before_action :set_perfil, only: [:show, :update, :destroy]

  def index
    @perfils = Perfil.all

    # Search
    @perfils = @perfils.username(params[:username]) if params[:username]

    # Filter for relacion
    @perfils = @perfils.id_usuario(params[:id_usuario]) if params[:id_usuario]
    
    # Order by
    @perfils = @perfils.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @perfils = @perfils.page(1).per(params[:limit]).padding(params[:offset])
    else
        @perfils = @perfils.page(1).per(25)
    end

    if @perfils.count != 0
      render json: @perfils if stale?(etag: @perfils.all, last_modified: @perfils.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  def show
    render json: @perfil if stale?(@perfil)
    head :ok                                                                    # 200
  end

  def create
    @perfil = Perfil.create(perfil_params)

    if @perfil.save
      render json: @perfil, status: :created                                  # 201
    else
      render json: @perfil.errors, status: :unprocessable_entity              # 422
    end
  end

  def update
    if @perfil.update(perfil_params)
      head :no_content                                                          # 204
    else
      render json: @perfil.errors, status: :unprocessable_entity              # 422
    end
  end

  def destroy
    @perfil.destroy
        
    head :no_content                                                            # 204
  end

  private

    def set_perfil
      if Perfil.unscoped.where(:id => params[:id]).any?
        @perfil = Perfil.find(params[:id])
      else
        head :no_content                                                        # 204
      end
    end

    def perfil_params
      params.require(:perfil).permit(:id_usuario, :username, :fecha_nacimiento, :telefono, :titulo, :ocupacion, :pais, :ciudad, :estado, :sobre_mi, :id_imagen)
    end
end
