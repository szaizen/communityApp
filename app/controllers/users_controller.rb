class UsersController < ApplicationController

  before_action :auth_user

  def index
  	@user = users.all
  end

  private 
  	def auth_user
  		redirect_to new_user_registration_path unless user_signed_in?
  	end

end
