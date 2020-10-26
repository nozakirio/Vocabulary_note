class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "編集が完了しました"
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :Introduction, :profile_image)
  end
  
end
