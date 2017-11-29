Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/rails_admin', as: 'rails_admin'
  get 'welcome/about'

  get 'welcome/contact'

  get 'welcome/faq'

  devise_for :users
  resources :gigs do
    resources :proposals, except: :index
    collection do
      get "search"
    end
  end

  resources :users do
    get :profile, on: :collection
    post :edit_profile, on: :collection
  end

  #render "welcome/about"
  #root "gigs#index"
  root "welcome#about"

  get "mygigs" => "gigs#mygigs"

end
