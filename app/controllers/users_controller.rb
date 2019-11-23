class UsersController < ApplicationController

  before_action :auth_user
  before_action :set_profile

  # プロフィール一覧
  def index
  	@prof = Profile.where.not(name: "").order(updated_at: "DESC")
    @profile = Profile.find_by(user: current_user)
  end

  # プロフィール編集
  def edit
  	@profile = Profile.find_by(user: current_user) || Profile.create(user: current_user)
  end


  def update
   @profile = Profile.find_by(user: current_user)
   if @profile.update(profile_params)
      Slack.chat_postMessage(text: "#{@profile.name}さんがプロフィールを更新しました。\n好きな食べ物: #{@profile.food}\n最寄駅: #{@profile.station}\n職業: #{@profile.jobs ||= "-"}\n自己紹介: #{@profile.biography ||= "-"}", username: "#{@profile.name}", channel: ENV["CHANNEL"])
   	  redirect_to profile_path, notice: '保存しました'
   else
    render 'edit'
   end
  end


  # プロフィール詳細
  def show
    @profile = Profile.find_by(user_id: params[:id])
    @portfolio = Portfolio.where(user_id: params[:id]);
  end

  # アカウント削除
  def delete
    # ユーザ削除 → セッションクリア　→ ログイン画面にリダイレクト
    User.find_by(id: current_user).destroy
    session.clear
    redirect_to new_user_session_path
  end

  private 
  	def auth_user
  		redirect_to new_user_registration_path unless user_signed_in?
  	end

    def set_profile
      @profile = Profile.find_by(user: current_user) || Profile.create(user: current_user)
    end

    def profile_params
      params.require(:profile).permit(:name, :age, :country, :prof_image, :jobs, :biography, :food, :station)
    end

end
