Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  root to:'public/homes#top'
  get 'about' => 'public/homes#about'
  get 'admin' => 'admin/homes#top'

  # 管理者側のルーティング設定
  namespace :admin do
    # get 'items' => 'items#index'
    # post 'items' => 'items#create'
    # get 'items/new' => 'items#new'
    # get 'items/:id' => 'items#show'
    # get 'items/:id/edit' => 'items#edit'
    # patch 'items/:id' => 'items#update'
    resources :items,except:[:destroy]
  end

  namespace :admin do
    resources :customers,only: [:index,:show,:edit,:update]
    resources :orders,only: [:show]
    resources :genres,only: [:index,:create,:edit,:update]
  end

  scope module: :public do
  get 'customers/my_page' => 'customers#show'
  get 'customers/information/edit' => 'customers#edit'
  patch 'customers/information' => 'customers#update'
  get 'customers/confirm_withdraw' => 'customers#confirm_withdraw'
  patch 'customers/withdraw' => 'customers#withdraw'
  delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
  post 'orders/confirm' => 'orders#confirm'
  get 'orders/complete' => 'orders#complete'

  resources :items,only: [:index,:show]
  resources :cart_items,only: [:index,:create,:destroy,:update]
  resources :orders,only: [:index,:show,:create,:new]
  resources :addresses,only: [:index,:create,:edit,:destroy,:update]

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
