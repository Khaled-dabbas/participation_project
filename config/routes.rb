Rails.application.routes.draw do
  scope '/api' do
    resources :ab_test_groups, only: [:index, :create, :update, :destory]
    resources :participants, only: [:index, :create, :update, :destory]
    delete '/participants/:id', to: 'participants#destroy'
    delete '/ab_test_groups/:id', to: 'ab_test_groups#destroy'
    #TODO adding group_name to the url, although spaces and special characters will break it, need to be fixed
    post '/participants/add_by_group_name/:group_name', to: 'participants#add_by_group_name'
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
