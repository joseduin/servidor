class Api::UsuariosController < ApplicationController
  before_action :set_usuario, only: [:show, :update, :destroy]

  def index
    @usuarios = Usuario.all

    # Search
    @usuarios = @usuarios.username(params[:username]) if params[:username]

    @usuarios = @usuarios.email(params[:email]) if params[:email]

    # Filter for relacion
    @usuarios = @usuarios.role_id(params[:role_id]) if params[:role_id]
    
    @usuarios = @usuarios.nacionalidad(params[:nacionalidad]) if params[:nacionalidad]
    @usuarios = @usuarios.cedula(params[:cedula]) if params[:cedula]
    
    # Order by
    @usuarios = @usuarios.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @usuarios = @usuarios.page(1).per(params[:limit]).padding(params[:offset])
    else
        @usuarios = @usuarios.page(1).per(25)
    end

    if @usuarios.count != 0
      render json: @usuarios if stale?(etag: @usuarios.all, last_modified: @usuarios.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  def show
    render json: @usuario if stale?(@usuario)
    head :ok                                                                    # 200
  end

  def create
    @usuario = Usuario.create(usuario_params)

    if @usuario.save
      render json: @usuario, status: :created                                  # 201
    else
      render json: @usuario.errors, status: :unprocessable_entity              # 422
    end
  end

  def update
    if @usuario.update(usuario_params)
      head :no_content                                                          # 204
    else
      render json: @usuario.errors, status: :unprocessable_entity              # 422
    end
  end

  def destroy
    @usuario.destroy
        
    head :no_content                                                            # 204
  end

  private

    def set_usuario
      if Usuario.unscoped.where(:id => params[:id]).any?
        @usuario = Usuario.find(params[:id])
      else
        head :no_content                                                        # 204
      end
    end

    def usuario_params
      params.require(:usuario).permit(:role_id, :username, :pass, :email, :estatus, :cedula, :nacionalidad)
    end
end
