Rails.application.routes.draw do
  resources :contacts
  get '/tops', to: 'tops#index'
  resources :blogs do
    collection do
      post :confirm
    end
  end
  resources :users, only: [:new,:create,:show]
  resources :sessions, only:[:new, :create, :destroy]
  resources :favorites,only:[:create,:destroy]
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
end
