Rails.application.routes.draw do

  

	# プロフィール詳細
	get '/profile/:id', to: 'users#show',  as: 'show_profile'

  # 入力error時userに飛ぶので、リダイレクト
	get '/user', to: redirect("/user/sign_up")
  
  # プロフィール編集
	get '/profile', to: 'users#edit'
	post '/profile', to: 'users#update'
	patch '/profile', to: 'users#update'

	delete '/user', to: 'users#delete',  as: 'delete_user'

	# devise_for :user
	devise_for :user, controllers: { registrations: 'registrations' }

 	root to: "users#index"

  
end
