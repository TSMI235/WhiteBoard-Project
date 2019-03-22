class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def email_to_username
    if current_user
      @userSplit = (current_user.email).split("@")
      @username = @userSplit[0];
    end
  end
end
