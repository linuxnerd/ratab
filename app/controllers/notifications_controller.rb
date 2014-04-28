class NotificationsController < ApplicationController
  before_action :signed_in_user, only: :index
  before_action :correct_user, only: :destroy

  def index
    @unread = current_user.notifications.unread
  end

  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    flash[:success] = '通知已成功删除'
    redirect_to notifications_url
  end
end
