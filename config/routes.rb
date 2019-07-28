Rails.application.routes.draw do

  devise_for :user
  root to: "users#index"

  # 入力error時userに飛ぶので、リダイレクト
	get '/user', to: redirect("/user/sign_up")
  
  # プロフィール編集
	get '/profile', to: 'users#edit'
	post '/profile', to: 'users#update'
	patch '/profile', to: 'users#update'

end
