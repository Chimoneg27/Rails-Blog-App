class ApplicationController < ActionController::Base
  def current_user
    User.find(6)
  end
end
