class ArticlesController < ApplicationController
	def index
	  @articles = Article.all
	end
	# View (Show)
	def show
	  @article = Article.find(params[:id])
	end
	# New
	def new
		@article = Article.new
	end
	# Creat
	def create
    @article = Article.new(article_params)
    @article.save
    flash.notice = "Article '#{@article.title}' Created!"
    redirect_to article_path(@article)
  end
  # Delete
	def destroy
	  @article = Article.find(params[:id])
	  @article.destroy
	  flash.notice = "Article '#{@article.title}' Destoy!"

	  redirect_to articles_path
	end
	# Edit
	def edit
		@article = Article.find(params[:id])
		flash.notice = "Article '#{@article.title}' Edited!"
	end
	# Update
	def update
	  @article = Article.find(params[:id])
	  @article.update(article_params)
	  flash.notice = "Article '#{@article.title}' Updated!"
	  redirect_to article_path(@article)
	end

  private

  def article_params
    params.require(:article).permit(:id, :title, :body)
  end
end
