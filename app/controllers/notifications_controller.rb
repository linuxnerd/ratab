class NotificationsController < ApplicationController
  before_action :signed_in_user, only: :index
  before_action :correct_user, only: :destroy
  respond_to :html, :js, only: :destroy

  def index
    drop_breadcrumb t('menu.inbox')
    @notifications = current_user.notifications.order('created_at DESC').page(params[:page])
    @notifications.where(read: false).update_all(read: true)
  end

  def destroy
    @notification = current_user.notifications.find(params[:id])
    @notification.destroy
    respond_to do |format|
      format.html { redirect_to notifications_path }
      format.js { render :layout => false }
    end
  end

  def clear
    current_user.notifications.delete_all
    respond_with do |format|
      format.html { redirect_to notifications_path }
      format.js { render :layout => false }
    end
  end

  private
    def correct_user
      user = Notification.find(params[:id]).user
      unless current_user?(user)
        respond_to do |format|
          format.html { redirect_to(root_path) }
          format.all { head(:unauthorized) }
        end
      end
    end
end
