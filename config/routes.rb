Rails.application.routes.draw do
  
  namespace :api, :defaults => {:format => :json} do
    resources :canals, only: [:index, :create, :show, :update, :destroy]
    resources :canalinteres, only: [:index, :create, :show, :update, :destroy]
    resources :chats, only: [:index, :create, :show, :update, :destroy]
    resources :comentarios, only: [:index, :create, :show, :update, :destroy]
    resources :decanatos, only: [:index, :create, :show, :update, :destroy]
    resources :likes, only: [:index, :create, :show, :update, :destroy]
    resources :usuariocanals, only: [:index, :create, :show, :update, :destroy]
    resources :usuariointeres, only: [:index, :create, :show, :update, :destroy]
    resources :perfils, only: [:index, :create, :show, :update, :destroy]
    resources :posts, only: [:index, :create, :show, :update, :destroy]
    resources :seguidores, only: [:index, :create, :show, :update, :destroy]
    resources :seguidos, only: [:index, :create, :show, :update, :destroy]
    resources :interes, only: [:index, :create, :show, :update, :destroy]
    resources :roles, only: [:index, :create, :show, :update, :destroy]
    resources :imagenes, only: [:index, :create, :show, :update, :destroy, :last]
    resources :usuarios, only: [:index, :create, :show, :update, :destroy]
    resources :galerias, only: [:index, :create, :show, :update, :destroy]
    resources :discusiones, only: [:index, :create, :show, :update, :destroy]
    resources :comentariodiscucions, only: [:index, :create, :show, :update, :destroy]

  end
  
 
  namespace :ucla, :defaults => {:format => :json} do
    resources :egresados, only: [:index, :create, :show, :update, :destroy]
      
  end
 
end
