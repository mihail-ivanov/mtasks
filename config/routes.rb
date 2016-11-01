# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

resources :mtasks, :only => [:index, :create, :edit, :update, :destroy] do
  member do
    post 'finish'
    post 'restore'
  end
end
