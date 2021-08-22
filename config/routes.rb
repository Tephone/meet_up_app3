Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/inbox' if Rails.env.development?
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
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
  namespace :teachers do
    resource :lesson, only: [:show]
    resource :past_lesson, only: %i[show]
  end
  resources :teachers, only: %i[index new create show destroy]
  namespace :students do
    resource :lesson, only: %i[show]
    resource :past_lesson, only: %i[show]
  end
  resources :students, only: %i[show]
  resources :lessons
  resources :purchase_tickets, only: %i[new create]
  resources :lesson_reservations, only: %i[create destroy]
  resources :reviews, only: %i[new create show destroy]
end
