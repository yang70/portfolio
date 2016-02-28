class Admin::ApplicationController < Administrate::ApplicationController
  before_filter :authenticate_admin

  def authenticate_admin
    redirect_to new_user_session_path unless current_user && current_user.editor?
  end
end
