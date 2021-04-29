Rails.application.routes.draw do
  devise_for :users, # ここの行にカンマを追加
    controllers: { registrations: 'registrations' } # ここの行を追加
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'posts#index'
  # ここにusersコントローラーのshowアクションのルーティングを追加する
  get 'users/:id', to:'users#show',as:'user'

  #ポスト機能のルート
  resources :posts, only: %i(new create index) do
    resources :phots, only: %i(create)
  end
  #ポスト機能のルート

end
