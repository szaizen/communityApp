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

	# ポートフォリオ編集
	patch '/portfolio', to: 'portfolios#update',  as: 'update_portfolio'
	post '/portfolio', to: 'portfolios#new',  as: 'new_portfolio'
 	get '/portfolio', to: 'portfolios#edit',  as: 'edit_portfolio'
 	delete '/portfolio/:id', to: 'portfolios#delete',  as: 'delete_portfolio'

 	# 掲示板
 	
 	resource :article, only: [:new, :create]
 	get '/article', to: 'articles#index'
 	get '/article/:id', to: 'articles#show',  as: 'show_articles'
 	get '/article/edit/:id', to: 'articles#edit',  as: 'edit_article'
 	patch '/article/edit/:id', to: 'articles#update',  as: 'update_article'
 	delete '/article/:id', to: 'articles#destroy',  as: 'destroy_article'


	# devise_for :user
	devise_for :user, controllers: { registrations: 'registrations' }

 	root to: "users#index"

  
end
