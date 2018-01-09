Rails.application.routes.draw do
  resources :users, except: [:destroy]
  resources :teams, except: [:destroy]
  resources :matches, except: [:destroy, :edit, :update] do
    resources :games, except: [:index, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
