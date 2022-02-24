class UsersController < ApplicationController
  # before_action :signed_in_user, only: [:edit, :update]
  # before_action :correct_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
     redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user), notice: 'Updated successfully'
    else
      render :edit
    end
  end

  # def signed_in_user
  #   render :edit
  # end

  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end



end
