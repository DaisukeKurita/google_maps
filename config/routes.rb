Rails.application.routes.draw do
  root to: 'diaries#index'
  # 追加
  resources :diaries do
    post 'confirm', on: :collection
  end
end
