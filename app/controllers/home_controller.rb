class HomeController < ApplicationController
  before_filter :authenticate_user!

  def index
  	@authentications = current_user.authentications if current_user
  end
end
