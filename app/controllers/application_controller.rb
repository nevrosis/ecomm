class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # CanCan
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, notice: "You are not authorize to access this page"
  end
end
