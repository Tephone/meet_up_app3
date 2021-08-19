Rails.application.routes.draw do
  devise_for :admins
  devise_for :teachers
  devise_scope :teacher do
    get 'teachers/edit', to: 'teachers/registrations#edit', as: :edit_teacher_registration
    put 'teachers', to: 'teachers/registrations#update', as: :teacher_registration_path
  end
  devise_for :students, controllers: { registrations: 'students/registrations', sessions: 'students/sessions' }
  root 'tops#show'
  resource :top, only: %i[show]
  resource :language, only: %i[show]
end
