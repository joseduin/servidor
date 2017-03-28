class Api::CanalinteresController < ApplicationController
  before_action :set_canalintere, only: [:show, :update, :destroy]

  def index
    @canalinteres = Canalintere.all

    # Filter for relacion
    @canalinteres = @canalinteres.id_canal(params[:id_canal]) if params[:id_canal]
    
    @canalinteres = @canalinteres.id_interes(params[:id_interes]) if params[:id_interes]
    
    # Order by
    @canalinteres = @canalinteres.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @canalinteres = @canalinteres.page(1).per(params[:limit]).padding(params[:offset])
    else
        @canalinteres = @canalinteres.page(1).per(25)
    end

    if @canalinteres.count != 0
      render json: @canalinteres if stale?(etag: @canalinteres.all, last_modified: @canalinteres.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  def show
    render json: @canalintere if stale?(@canalintere)
    head :ok                                                                    # 200
  end

  def create
    @canalintere = Canalintere.create(canalintere_params)

    if @canalintere.save
      render json: @canalintere, status: :created                                  # 201
    else
      render json: @canalintere.errors, status: :unprocessable_entity              # 422
    end
  end

  def update
    if @canalintere.update(canalintere_params)
      head :no_content                                                          # 204
    else
      render json: @canalintere.errors, status: :unprocessable_entity              # 422
    end
  end

  def destroy
    @canalintere.destroy
        
    head :no_content                                                            # 204
  end

  private

    def set_canalintere
      if Canalintere.unscoped.where(:id => params[:id]).any?
        @canalintere = Canalintere.find(params[:id])
      else
        head :no_content                                                        # 204
      end
    end

    def canalintere_params
      params.require(:canalintere).permit(:id_canal, :id_interes)
    end
end
