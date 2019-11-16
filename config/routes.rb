Rails.application.routes.draw do
 #  get 'booklists/new'
 #  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 # get 'top' => 'root#top'

 # post 'books' => 'booklists#create'

 # get 'booklists' => 'booklists#index'

 # get 'booklists/:id' => 'booklists#show', as: 'booklist'
 # #.../booklists/1 や .../booklists/3 に該当する

 # get 'booklists/:id/edit' => 'booklists#edit', as: 'edit_booklist'

 # patch'booklists/:id' => 'booklists#update', as: 'update_booklist'

 # delete 'booklists/:id' => 'booklists#destroy', as: 'destroy_booklist'

 # #'/'でトップ画面が表示されるようにしたい
 # root to: 'booklists#top'

 resources :books


 	#'/'でトップ画面が表示されるようにしたい
 	root to: 'books#top'

end