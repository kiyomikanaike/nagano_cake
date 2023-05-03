Rails.application.routes.draw do

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  root to:'public/homes#top'
  get 'about' => 'homes#about'
  get 'admin' => 'admin/homes#top'
  # 会員側のルーティング設定
  get 'items' => 'public/items#index'
  # 管理者側のルーティング設定
  namespace :admin do
    get 'items' => 'items#index'
    get 'items/new' => 'items#new'
    post 'items' => 'items#create'
    get 'items/:id' => 'items#show'
    get 'items/:id/edit' => 'items#edit'
    patch 'items/:id' => 'items#update'
  end

  scope module: :public do
  get 'customers/my_page' => 'customers#show'
  get 'customers/information/edit' => 'customers#edit'
  patch 'customers/information' => 'customers#update'
  get 'customers/confirm_withdraw' => 'customers#confirm_withdraw'
  patch 'customers/withdraw' => 'customers#withdraw'

  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
