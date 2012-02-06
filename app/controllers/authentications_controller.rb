class AuthenticationsController < ApplicationController
   def index
  		@authentications = current_user.authentications if current_user
	end

	def create
	  auth = request.env["omniauth.auth"]
	  out = current_user.authentications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
	  flash[:notice] = "Authentication successful."+out['provider']
	  redirect_to root_url
	end

	def destroy
	  @authentication = current_user.authentications.find(params[:id])
	  @authentication.destroy
	  flash[:notice] = "Successfully destroyed authentication."
	  redirect_to root_url
	end
end
