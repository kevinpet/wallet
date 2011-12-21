class ApplicationController < ActionController::Base
  include ControllerAuthentication
  protect_from_forgery
  def admin_required
    raise "not an admin"
  end
end
