class Patient::NotificationsController < ApplicationController

   def index
      #patientの投稿commentに紐づいた通知一覧
      @notifications = current_patient.passive_notifications.page(params[:page]).per(5)
                        # current_patient
      #@まだ確認していない通知のみ
      @notifications.where(checked: false).each do |notification|
        notification.update_attributes(checked: true)
      end
   end
end
