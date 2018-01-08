Rails.application.routes.draw do
  resources :experiences, except: [:show]

  get 'experience/:id', to: 'experiences#show', as: 'experience_show'

  get 'about-me', to: 'pages#about'
  get 'contact', to: 'pages#contact'

  resources :blogs

  root to: 'pages#home'
end
