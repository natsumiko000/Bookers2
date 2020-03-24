class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find_by(id: current_user.id)
    @users = User.all
    @book = Book.new
  end

  def show
    @user = User.find_by(id: params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = current_user
  end

  def update
    user = current_user
    if user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(user)
    else
      @user = user
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
