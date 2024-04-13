Rails.application.routes.draw do
  root 'homes#top'
  resources :books
  #コマンド＝rails routesでresources :bookの中身が見れる
  #resourcesbookがすでに定義されてるエラーがあるため名付け
  # get 'books/:id' => 'books#show', as: 'book'
  # get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  # patch 'books/:id' => 'books#update', as: 'update_book'
  # delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  

  end
