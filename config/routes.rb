Rails.application.routes.draw do
  resources :experiences, except: [:show]

  get 'experience/:id', to: 'experiences#show', as: 'experience_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs do
    member do
      get :toggle_status
    end
  end

  root to: 'pages#home'
end
