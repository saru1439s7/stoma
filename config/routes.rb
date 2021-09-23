Rails.application.routes.draw do
  #患者さんと医療スタッフでログインや機能は別とする
  devise_for :staffs,controllers: {
    sessions: 'staffs/sessions',
    registrations: 'staffs/registrations',
    passwords: 'staffs/passwords'}

  devise_for :patients,controllers: {
    sessions: 'patients/sessions',
    registrations: 'patients/registrations',
    passwords: 'patients/passwords'}
    
    #トップページ
    root 'patient/patients#top'
    root 'staff/staffs#top'

  # 患者さん 記録は基本削除したいためdestoryはなしとした
  namespace :patient do
    resources :patients,:except => [:destroy,:new,:index] #コミュニティ機能つけるなら:index追加
    resources :ostomies,:except =>  [:destroy]
    resources :dialies,:except => [:destroy]
    resources :calenders
  end
  
  #医療スタッフ 記録は基本削除したいためdestoryはなしとした
  namespace :staff do
     #患者さんの書いたストーマの記録を見ていいね、コメントをする
    get '/ostomies/index/:patient_id',to: 'ostomies#index', as: 'ostomy_index'
    get '/ostomies/show/:ostomy_id/:patient_id',to: 'ostomies#show', as: 'ostomy_show'
    resources :ostomies,:only => [:index] do
     resources :comments, only: [:create, :destroy]
     resource :favorites, only: [:create, :destroy]
    end
    resources :staffs,:except => [:destroy,:new]
    resources :dialies,:only => [:index,:show]
     #患者ごとに医療スタッフが記録する
    resources :patients,:except => [:destroy,:new,:create] do
      resources :records,:except => [:destroy]
    end
  end
end
