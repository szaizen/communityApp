class ArticlesController < ApplicationController

  before_action :auth_user

  
  def new
  	@article = Article.new
  end


  private 
  	def auth_user
  		redirect_to new_user_registration_path unless user_signed_in?
  	end

    def profile_params
      params.require(:profile).permit(:name, :age, :country, :prof_image, :jobs, :biography)
    end

end
