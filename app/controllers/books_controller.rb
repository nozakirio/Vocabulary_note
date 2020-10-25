class BooksController < ApplicationController
  def index
    @books = Book.page(params[:page]).reverse_order
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "投稿が完了しました"
      redirect_to book_path(@book)
    else
      @books = Book.page(params[:page]).reverse_order
      render :index
    end
  end
  
  def show
    @book = Book.find(params[:id])
  end

  def edit
  end

  def update
  end
  
  def destroy
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
