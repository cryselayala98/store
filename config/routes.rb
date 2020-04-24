Rails.application.routes.draw do
  
  resources :articles do
    resources :comments
  end 
  
  root 'pages#home' # controlador pages en el método home
  # root 'application#hello' # la ruta por defecto (localhost:3000)-> se va a dirigir a aplication_controller.rb en el método hello()

  # ruta listar productos
  get '/products', to: 'products#index', as: 'index_product' # enrúteme: cuando genere una solicitud /products, rediríjame al controlador de productos, en su métido index(). get es porque es una solicitud de tipo GET. se puede obviar el _controller

  # ruta crear productos (me redirige al form de product/new en la vista)
  get '/products/new', to: 'products#new', as: 'new_product'

  post '/products', to: 'products#create'

  # estos dos requests son obligatorios para editar
  get '/product/:id', to: 'products#show', as: 'product'
  get '/products/:id/edit', to: 'products#edit', as: 'edit_product' # :id -> es un parámetro

  # como hacer el post para que se actualice el producto
  patch 'product/:id', to: 'products#update'

  # eliminar instancias de producto
  delete '/product/:id', to: 'products#delete'

  # resources :products # esto genera todos los enrutadores de listar, crear, editar y eliminar
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
