Rails.application.routes.draw do
  get 'welcome/index'

  post "eventico", to: "products#evento", as: "evento"

  resources :products do
    collection do
      post "details"
      post "say_hola"
    end
  end
  root "products#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
