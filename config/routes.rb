Rails.application.routes.draw do
  devise_for :users, # ここの行にカンマを追加
    controllers: { registrations: 'registrations' } # ここの行を追加
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home'
  # ここにusersコントローラーのshowアクションのルーティングを追加する
  get 'users/:id', to:'users#show',as:'user'

end
