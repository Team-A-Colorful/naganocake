Rails.application.routes.draw do
  namespace :public do
    get "information/show"
    get "information/edit"
  end
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    root "homes#top"
    get "about" => "homes#about"
    get "items/genre_search" => "items#genre_search", as: "genre_search"
    get "search" => "searches#search"
    resources :items, only: [:index, :show]
    resource :customers, only: [] do
      resource :information, only: [:show, :edit, :update]
      get "withdraw" => "customers#withdraw"
      patch "resign" => "customers#resign"
    end

    resources :cart_items, only: [:index, :update, :destroy, :create] do
      delete "destroy_all" => "cart_items#destroy_all"
    end
    get "orders/confirm" => "cart_items#index"
    post "orders/confirm" => "orders#confirm"
    get "orders/completed" => "orders#completed"
    resources :orders, only: [:new, :create, :index, :show]
    resources :shipping_addresses, only: [:index, :edit, :create, :update, :destroy]
  end

  namespace :admin do
    root "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update] do
      get "order_history" => "customers#order_history"
    end
    resources :orders, only: [:show, :update]
    resources :order_items, only: [:update]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
