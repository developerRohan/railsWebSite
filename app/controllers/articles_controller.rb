class ArticlesController < ApplicationController

	before_action :set_article , only: [:edit , :update , :show , :destroy]
	before_action :require_user , except: [:index , :show]
	before_action :require_current_user , only: [:edit , :update , :destroy]

	def index 
		@articles = Article.all

	end

	def new
		@article = Article.new
	end

	def edit
		
	end

	def update
		
		if @article.update(article_params)
			flash[:notice]="article was successfully updated"
			redirect_to article_path(@article)
		else
			render edit
		end
	end

	def create
		#debugger
		#render plain: params[:article].inspect
		@article = Article.new(article_params)
		@article.user = current_user	
		if @article.save
			flash[:notice] = "article was  succefully saved"
			redirect_to article_path(@article)
		else
			render 'new'
		end
		
	end

	def show
		
		@users = @article.likes
	end

	# def findUsers
	# 	@article = Article.find(params[:id])
	# 	@users = @article.likes
	# end

	def destroy
		@article.destroy		
		flash[:notice] = "article was successfully deleted"
		redirect_to articles_path
	end

	def likedArticles
		@articles = Article.all
	end
	

	private 
	def set_article
		@article = Article.find(params[:id])
	end
	def article_params
		params.require(:article).permit(:title,:description , category_ids: [])

	end

	def require_current_user
		if current_user != @article.user
			flash[:danger] = "you are not allowed to do this :)"
			redirect_to articles_path
		end
	end

end