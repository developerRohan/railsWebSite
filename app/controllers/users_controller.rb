class UsersController < ApplicationController

	before_action :require_current_user , only: [:edit , :update , :destroy]


	def new
		@user = User.new
	end

	def index
		@users = User.where('id != ?', current_user)

	end

	def create
		#debugger
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "welcome to exPresso #{@user.username}"
			redirect_to articles_path
		else
			render 'new'
		end
	end

	def edit
		@user = User.find(params[:id]);
	end

	def update
		#debugger
		@user = User.find(params[:id])
		if @user.update(user_params)
			flash[:success] = "updated Successfully"
			redirect_to articles_path

		else
			render 'edit'
		end
	end

	def show
		@user = User.find(params[:id]);
	end

	def destroy
		@user = User.find(params[:id])
		@user.destroy
	end


	def friend
		add_friend_id = params[:add_friend_id]
		friendship = Friendship.where(:add_friend_id => add_friend_id , :friend_id => current_user.id).first
		unless friendship
			friendship = Friendship.create(:add_friend_id => add_friend_id , :friend_id => current_user.id)
		else
			friendship.destroy
		end
		 return redirect_to user_path(add_friend_id)
	end

	def friends
		@users = current_user.friends
	end

	def add_friends
		@users = current_user.add_friends
	end


	def likes 

    article_id = params[:article_id]
    like = current_user.likes.where(article_id:article_id).first
    if like
      like.destroy
    else
      current_user.likes.create(article_id:article_id)
    end

    redirect_to articles_path
	end

	

	

	private
	def user_params
		params.require(:user).permit(:username , :email , :password)
	end

	def require_current_user
		if current_user != User.find(current_user.id)
			flash[:danger] = "you are not allowed to do this :)"
			redirect_to users_path
		end
	end
end
