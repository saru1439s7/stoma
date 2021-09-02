Rails.application.routes.draw do

  #devise_for :staffs
  #devise_for :patients
   devise_for :staffs,controllers: {
    sessions: 'staffs/sessions',
    registrations: 'staffs/registrations',
    passwords: 'staffs/passwords'}

  devise_for :patients,controllers: {
    sessions: 'patients/sessions',
    registrations: 'patients/registrations',
   passwords: 'patients/passwords'}

    root 'patient/patients#top'
  # 患者さん
  scope module: :patient do
    resources :patients,:except => [:destroy,:new,:index] #コミュニティ機能つけるなら:index追加
    resources :ostomies,:except =>  [:destroy]
    resources :dialies,:except => [:destroy]
  end
  #医療スタッフ
  namespace :staff do
    resources :staffs,:except => [:destroy,:new]
    resources :records,:except => [:destroy]
    #resources :dialies,:only [:index,:show]
    #resources :ostomies,:only [:index,:show]
    #resources :patients,:except => [:destroy,:new]
  end

end
