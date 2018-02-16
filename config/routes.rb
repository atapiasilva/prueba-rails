Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    get 'todos' =>'todos#index'
    post 'todos' => 'todos#create'
    get 'todos:id', to:'todos#show', as:'todo'
    get 'todos/new'
    get '/todos/:id/edit', to:'todos#edit', as:'edit'
    patch '/todos/:id', to:'todos#update'
    delete '/todos/:id', to:'todos#destroy', as:'destroy'
    get '/todos:id/complete', to:'todos#complete', as:'completed'
    get '/todos/list'




root 'todos#index'
end
