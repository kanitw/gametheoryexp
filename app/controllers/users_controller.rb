class UsersController < ApplicationController
  def new
  	@user = User.new
  	respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  def index

  end
end
