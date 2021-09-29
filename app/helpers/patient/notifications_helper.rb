module Patient::NotificationsHelper
  def unchecked_notifications
    @notifications = current_patient.passive_notifications.where(checked: false)
  end
end
