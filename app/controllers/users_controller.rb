class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, {only: [:edit]}
  # ログインユーザー以外の人に制限をかける

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
     @books = @user.books

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have update user successfully.'
      redirect_to user_path(@user)
    else
      flash[:notice] = 'errors prohibited this obj from being saved.'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :introduction)
  end

  def ensure_current_user
    @user = User.find(params[:id])
    if @user != current_user
       redirect_to user_path(current_user)
    end
  end

end
