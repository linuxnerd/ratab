class NotificationsController < ApplicationController
  before_action :signed_in_user, only: :index
  before_action :correct_user, only: :destroy

  def index
    drop_breadcrumb t('menu.inbox')
    @notifications = current_user.notifications.order(:created_at).page(params[:page])
    @notifications.update_all(read: true)
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    flash[:success] = t('notification.notification_deleted')
    redirect_to notifications_url
  end
end
