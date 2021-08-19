Rails.application.routes.draw do
  get 'languages/show'
  resource :language, only: %i[show]
end
