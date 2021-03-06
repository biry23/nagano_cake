Rails.application.routes.draw do



  # publicのアクション
  scope module: 'public' do

    root to: "homes#top"
    get "/about" => "homes#about", as: "about"
    get "/customers/my_page" => "customers#show", as: "customers"
    get "/customers/edit" => "customers#edit"
    patch "/customers" => "customers#update", as: "customers_update"
    get "/customers/confirm" => "customers#confirm"
    patch "/customers/withdraw" => "customers#withdraw"
    delete "/cart_items/destroy_all" => "cart_items#destroy_all"
    post "/orders/confirm" => "orders#confirm"
    get "/orders/complete" => "orders#complete"
    resources :items, only: [:show, :index]
    resources :cart_items, only: [:create, :index, :update, :destroy]
    resources :orders, only: [:new, :index, :show, :create]
    resources :addresses, only: [:edit, :index, :create, :update, :destroy]
  end
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }
  # adminのアクション
  namespace :admin do
    root to: "homes#top"
    patch "/orders/:id/status" => "orders#status_update", as: "status" # 注文ステータスupdate
    patch "/orders/:id/making_status" => "orders#making_status_update", as: "making_status" # 製作ステータスupdate
    resources :items, only: [:new, :index, :create, :show, :edit, :update]
    resources :genres, only: [:edit, :index, :create, :update]
    resources :customers, only: [:show, :index, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
end
