Rails.application.routes.draw do

  # namespace :patient do
  #   get 'calenders/index'
  # end
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

  namespace :patient do
    resources :patients,:except => [:destroy,:new,:index] #コミュニティ機能つけるなら:index追加
    resources :ostomies,:except =>  [:destroy]
    resources :dialies,:except => [:destroy]
    resources :calenders
  end
  #医療スタッフ   #医療スタッフだけがいいね、コメントつけられる
  namespace :staff do
    resources :staffs,:except => [:destroy,:new]
    resources :dialies,:only => [:index,:show]
    resources :ostomies,:only => [:index,:show] do
     resources :comments, only: [:create, :destroy]
     resource :favorites, only: [:create, :destroy]
    end

     #患者ごとに記録するためネストさせる
    resources :patients,:except => [:destroy,:new,:create] do
       resources :records,:except => [:destroy]
    end
  end
  
end
    #ネストさせないと関連づかない???
    #  resources :patients,:except => [:destroy,:new,:create] do
    #   resources :records,:except => [:destroy]
    #   resources :dialies,:only => [:index,:show]
    # 　 resources :ostomies,:only => [:index,:show] do
    #  　  resources :comments, only: [:create, :destroy]
    #      resource :favorite, only: [:create, :destroy]
    #   end
    #  end