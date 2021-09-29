module Staff::NotificationsHelper

  def unchecked_notifications
    @notifications = current_staff.passive_notifications.where(checked: false)
  end
end
