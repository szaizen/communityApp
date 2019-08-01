class UsersController < ApplicationController

  before_action :auth_user

  # プロフィール一覧
  def index
  	@prof = Profile.where.not(name: "")
  end

  # プロフィール編集
  def edit
  	@profile = Profile.find_by(user: current_user)
  end

  def update 
   @profile = Profile.find_by(user: current_user)
   if @profile.update(profile_params)
   	redirect_to profile_path, notice: 'success!'
   end
  end

  # プロフィール詳細
  def show
    @profile = Profile.find(params[:id]);
  end

  # アカウント削除
  def delete
    # ユーザ削除 → セッションクリア　→ ログイン画面にリダイレクト
    Profile.find_by(user: current_user).delete
    session.clear
    redirect_to new_user_session_path
  end

  private 
  	def auth_user
  		redirect_to new_user_registration_path unless user_signed_in?
  	end

    def profile_params
      params.require(:profile).permit(:name, :age, :country, :prof_image, :jobs, :biography)
    end

end
