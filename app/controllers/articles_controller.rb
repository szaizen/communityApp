class ArticlesController < ApplicationController

  before_action :auth_user

  
  def new
  	@article = Article.new
  end

  def create
    article = current_user.articles.build(article_params)
    if article.save
      redirect_to article_path, notice: 'success!'
    else
      redirect_to article_path, notice: 'エラーが発生しました'
    end
  end

  def index
    @article = Article.all.order(updated_at: "DESC")
  end

  def show

    @article = Article.find_by(id: params[:id])
    @profile = Profile.find_by(user: @article.user)

    @comment_new = Comment.new
    @comment = Comment.where(article: params[:id])

  end

  def edit
    @article = Article.find_by(id: params[:id])
  end

  def update 
   @article = Article.find_by(id: params[:id])
   if @article.update(article_params)
    redirect_to article_path, notice: 'success!'
   else
    render 'edit'
   end
  end

  def destroy
    Article.find(params[:id]).delete
    redirect_to article_path, notice: '削除しました'
  end

  def create_comment
    comment = current_user.comments.build(comment_params)
    comment.attributes = { article_id: params[:id] }
    if comment.save
      redirect_to show_articles_path(params[:id]), notice: 'success!'
    else
      redirect_to show_articles_path(params[:id]), notice: 'エラーが発生しました'
    end

  end


  def destroy_comment
    article_id = Comment.find(params[:id]).article_id
    Comment.find(params[:id]).delete
    redirect_to show_articles_path(article_id), notice: '削除しました'
  end


  private 
  	def auth_user
  		redirect_to new_user_registration_path unless user_signed_in?
  	end

    def article_params
      params.require(:article).permit(:title, :category, :content)
    end

    def comment_params
      params.require(:comment).permit(:content)
    end

end
