class NotificationsController < ApplicationController
  before_action :authenticate_user!
  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    @notifications.where(is_checked: false).each do |notification|
      notification.update_attributes(is_checked: true)
    end
  end

  def all_destroy
    redirect_to request.referrer if current_user.passive_notifications.destroy_all
  end
end
