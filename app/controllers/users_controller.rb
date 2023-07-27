class UsersController < ApplicationController

  def index

    @book = Book.find(params[:id])
    @user = @book.user
    @newbook = Book.new

    @user = current_user
    @users = User.all

  end



  def show

    @book = Book.find(params[:id])
    @user = @book.user
    @newbook = Book

    @user = User.find(params[:id])
    @books = @user.books

    @book = Book.new

  end

  def edit
    @user = User.find(params[:id])

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
