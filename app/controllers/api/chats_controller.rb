class Api::ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :update, :destroy]

  def index
    @chats = Chat.all

    # Search
    @chats = @chats.id(params[:id]) if params[:id]
    @chats = @chats.asunto(params[:asunto]) if params[:asunto]
    @chats = @chats.estatus(params[:estatus]) if params[:estatus]
    # Filter for relacion
    @chats = @chats.id_usuario(params[:id_usuario]) if params[:id_usuario]
    @chats = @chats.id_usuario2(params[:id_usuario2]) if params[:id_usuario2]
    
    @chats = @chats.categoria(params[:categoria]) if params[:categoria]
    
    # Order by
    @chats = @chats.order(params[:order].gsub(':', ' ')) if params[:order]

    # Pagination
    if (params[:offset] && params[:limit])
        @chats = @chats.page(1).per(params[:limit]).padding(params[:offset])
    else
        #@chats = @chats.page(1).per(25)
    end

    if @chats.count != 0
      render json: @chats if stale?(etag: @chats.all, last_modified: @chats.maximum(:updated_at))
    else
      head :no_content                                                          # 204
    end
  end

  def show
    render json: @chat if stale?(@chat)
    head :ok                                                                    # 200
  end

  def create
    @chat = Chat.create(chat_params)

    if @chat.save
      render json: @chat, status: :created                                  # 201
    else
      render json: @chat.errors, status: :unprocessable_entity              # 422
    end
  end

  def update
    if @chat.update(chat_params)
      head :no_content                                                          # 204
    else
      render json: @chat.errors, status: :unprocessable_entity              # 422
    end
  end

  def destroy
    @chat.destroy
        
    head :no_content                                                            # 204
  end

  private

    def set_chat
      if Chat.unscoped.where(:id => params[:id]).any?
        @chat = Chat.find(params[:id])
      else
        head :no_content                                                        # 204
      end
    end

    def chat_params
      params.require(:chat).permit(:id_usuario, :id_usuario2, :categoria, :asunto, :contenido, :estatus, :fecha)
    end
end
