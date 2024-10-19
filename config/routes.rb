Rails.application.routes.draw do
  # 一般ユーザー用のルーティング
  resources :sheets, only: [:index]
  resources :movies, only: [:index, :show]

  # 管理者用のルーティング
  namespace :admin do
    resources :movies, only: [:index, :new, :create, :edit, :update, :destroy] do
      resources :schedules, only: [:index, :new, :create] # moviesに紐づくschedules
    end
    resources :schedules, only: [:show, :edit, :update, :destroy] # 独立したCRUD操作用のルート
  end
end
