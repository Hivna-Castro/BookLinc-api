Rails.application.routes.draw do
  get 'authors', to: "authors#all"
  get 'author/:id', to: "authors#find"
  post 'author', to: "authors#create"
  put 'author/:id', to: "authors#update"
  delete 'author/:id', to: "authors#delete"

  get 'books', to: "books#all"
  get 'book/:id', to: "books#find"
  post 'book', to: "books#create"
  put 'book/:id', to: "books#update"
  delete 'book/:id', to: "books#delete"

  get 'readers', to: "readers#all"
  get 'reader/:id', to: "readers#find"
  post 'reader', to: "readers#create"
  put 'reader/:id', to: "readers#update"
  delete 'reader/:id', to: "readers#delete"

  get 'newsletters', to: "newsletters#all"
  get 'newsletter/:id', to: "newsletters#find"
  post 'newsletter/', to: "newsletters#create"
  put 'newsletter/:id', to: "newsletters#update"
  delete 'newsletter/:id', to: "newsletters#delete"
end

#ao deletar um author, enviar email para o autor deletado