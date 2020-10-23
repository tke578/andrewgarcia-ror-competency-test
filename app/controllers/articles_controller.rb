class ArticlesController < ApplicationController
	before_action :authenticate_user!, except: [:index]
	access all: [:index], [:user, :admin] =>  {except: [:new, :create, :edit, :update, :destroy]} , editor: :all

	def index
		@articles = Article.includes(:user)
	end

	def new
		@article = Article.new
	end

	def create
		@article = Article.new(article_params)
		@article.user = current_user
	  if @article.save
	    redirect_to @article
	  else
	    render 'new'
	  end
	end

	def show
		@article = Article.find(params[:id])
		redirect_to root_url, flash: { error: "Record not found." } if @article.blank?
	end

	def edit
		@article = Article.find_by(id: params[:id], user: current_user)
  		redirect_to root_url, flash: { error: "Record not found." } if @article.blank?
	end

	def update
		@article = Article.find_by(id: params[:id], user: current_user)
		redirect_to root_url, flash: { error: "Record not found." } if @article.blank?
		if @article.update(article_params)
		   	redirect_to @article
		else
		    render 'edit'
		end
	end

	def destroy
		@article = Article.find_by(id: params[:id], user: current_user)
		redirect_to root_url, flash: { error: "Record not found." } if @article.blank?

  		@article.destroy
  		redirect_to articles_path
	end

	private
	def article_params
		params.require(:article).permit(:title, :content, :category)
	end
end