Rails.application.routes.draw do
  resources :characters, only: %i[index show create update destroy]
end
