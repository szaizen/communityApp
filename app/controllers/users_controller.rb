class UsersController < ApplicationController

  before_action :auth_user

  def index
  	@prof = Profile.all

  end

  def edit
  	# テスト
  	@profile = Profile.find_by(user: current_user)

  	# @profile = Profile.new

  end

  def update 
   @profile = Profile.find_by(user: current_user)
   if @profile.update(profile_params)
   	redirect_to profile_path, notice: 'success!'
   end


  end

  private 
  	def auth_user
  		redirect_to new_user_registration_path unless user_signed_in?
  	end

    def profile_params
      params.require(:profile).permit(:name, :age, :country, :prof_image)
    end

end
