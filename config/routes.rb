Rails.application.routes.draw do
  devise_for :users, # ここの行にカンマを追加
    controllers: { registrations: 'registrations' } # ここの行を追加
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
  # ここにusersコントローラーのshowアクションのルーティングを追加する
  get 'users/:id', to:'users#show',as:'user'

  #ポスト機能のルート
  resources :posts, only: %i(index new create show destroy) do
    resources :phots, only: %i(create)
    #ライク機能のルート
    resources :likes, only: %i(create destroy)
    #コメント機能のルート
    resources :comments, only: %i(create destroy)

  end

end
