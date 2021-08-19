Rails.application.routes.draw do
  devise_for :admins, controllers: { sessions: 'admins/sessions'}
  devise_scope :admin do
    post 'admins/sign_in_as_tesachers', to: 'admins/sessions#sign_in_as_teachers', as: :admin_sign_in_as_teachers
  end
  devise_for :teachers
  devise_scope :teacher do
    get 'teachers/edit', to: 'teachers/registrations#edit', as: :edit_teacher_registration
    put 'teachers', to: 'teachers/registrations#update', as: :teacher_registration
  end
  devise_for :students, controllers: { registrations: 'students/registrations', sessions: 'students/sessions' }
  root 'tops#show'
  resource :top, only: %i[show]
  resource :language, only: %i[show]
  resource :admin, only: %i[show]
  resources :teachers, only: %i[ index new create show destroy]
  resources :students, only: %i[show]
end
