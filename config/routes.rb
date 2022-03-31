Rails.application.routes.draw do



  # publicのアクション
  scope module: 'public' do
    
    root to: "homes#top"
    get "/about" => "homes#about", as: "about"
    get "/customers/my_page" => "customers#show"
    get "/customers/edit" => "customers#edit"
    patch "/customers" => "customers#update"
    get "/customers/confirm" => "customers#confirm"
    patch "/customers/withdraw" => "customers#withdraw"
    resources :homes, only: [:top, :about]
    resources :items, only: [:show, :index]
    resources :registrations, only: [:new, :create],except:[:cancel, :edit, :update, :destroy]
    resources :sessions, only: [:new, :create, :destroy]
    resources :cart_items, only: [:create, :index, :update, :destroy, :destroy_all]
    resources :orders, only: [:new, :index, :show, :confirm, :complete, :create]
    resources :addresses, only: [:edit, :index, :create, :update, :destroy]
  end
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/customers/registrations",
    sessions: 'public/customers/sessions'
  }
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  # adminのアクション
  namespace :admin do
    resources :sessions, only: [:new, :create, :destroy]
    resources :homes, only: [:top, :about]
    resources :items, only: [:new, :index, :create, :show, :edit, :update]
    resources :genres, only: [:edit, :index, :create, :update]
    resources :customers, only: [:show, :index, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
    root to: "homes#top"
  end
end
