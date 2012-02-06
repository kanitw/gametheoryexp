class UsersController < ApplicationController
  def new
  	@user = User.new
  	respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
	def create
	    @user = User.new(params[:user])
	    if @user.save
	      # Handle a successful save.
	    else
	      @title = "Sign up"
	      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
