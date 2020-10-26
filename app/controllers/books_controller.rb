class BooksController < ApplicationController
  before_action :correct_user, only:[:edit, :update,:destroy]
  
  def index
    @books = Book.page(params[:page]).reverse_order
    @book = Book.new
    @user = current_user
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "投稿が完了しました"
      redirect_to book_path(@book)
    else
      @books = Book.page(params[:page]).reverse_order
      @user = current_user
      render :index
    end
  end
  
  def show
    @book_for_new = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "編集が完了しました"
      redirect_to book_path(@book)
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
  def correct_user
    @book = Book.find(params[:id])
     unless @book.user == current_user
     redirect_to books_path
     end
  end
  
end
