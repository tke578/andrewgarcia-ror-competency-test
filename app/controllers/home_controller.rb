class HomeController < ApplicationController
	def index
		@articles = Article.recent_articles
		render :index
	end
end


