class Staff::NotificationsController < ApplicationController

     def index
        #patientの投稿に紐づいた通知一覧
        @notifications = patient.passive_notifications
        #@notificationの中でまだ確認していない(indexに一度も遷移していない)通知のみ
        @notifications.where(checked: false).each do |notification|
         notification.update_attributes(checked: true)
        end
     end

end
