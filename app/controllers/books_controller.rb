class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
    
  end

  def create
    #byebug
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save

    flash[:notice] = "Book was successfully created"
    redirect_to book_path(@book.id)

   else
    @books = Book.all
    render :index
   end
  end

  def new
    @book = Book.new
  end

  def edit
     @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)

    redirect_to book_path
     flash[:notice] = "Book was successfully update"

    else
    render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    redirect_to '/books', notice: 'Book was successfully destroyed.'
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :user_id)
  end

end
