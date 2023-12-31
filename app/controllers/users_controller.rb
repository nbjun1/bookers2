class UsersController < ApplicationController

  def index

    @infouser = current_user
    @newbook = Book.new
    @users = User.all

  end

  def show

    @user = User.find(params[:id])
    @newbook = Book.new
    @books = Book.where(user_id: @user.id)

  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user.id)
    end
  end

  def update
    @user = User.find(params[:id])
   if @user.update(user_params)
    flash[:notice] = 'You have updated user successfully.'
    redirect_to user_path(@user.id)

   else
    render :edit
   end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


end
