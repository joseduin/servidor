class Api::RolesController < ApplicationController
  before_action :set_role, only: [:show, :update, :destroy]

  def index
    @roles = Role.all

    # Search
    @roles = @roles.nombre(params[:nombre]) if params[:nombre]
    
    # Order by
    @roles = @roles.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @roles = @roles.page(1).per(params[:limit]).padding(params[:offset])
    else
        @roles = @roles.page(1).per(25)
    end

    if @roles.count != 0
      render json: @roles if stale?(etag: @roles.all, last_modified: @roles.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  def show
    render json: @role if stale?(@role)
    head :ok                                                                    # 200
  end

  def create
    @role = Role.create(role_params)

    if @role.save
      render json: @role, status: :created                                  # 201
    else
      render json: @role.errors, status: :unprocessable_entity              # 422
    end
  end

  def update
    if @role.update(role_params)
      head :no_content                                                          # 204
    else
      render json: @role.errors, status: :unprocessable_entity              # 422
    end
  end

  def destroy
    @role.destroy
        
    head :no_content                                                            # 204
  end

  private

    def set_role
      if Role.unscoped.where(:id => params[:id]).any?
        @role = Role.find(params[:id])
      else
        head :no_content                                                        # 204
      end
    end

    def role_params
      params.require(:role).permit(:nombre)
    end
end