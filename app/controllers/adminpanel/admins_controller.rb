class Adminpanel::AdminsController < ApplicationController
  before_action :admin_only
  def admin_only
    unless current_user.admin?
      redirect_to root_path, :alert => "Access denied."
    end
  end
end
