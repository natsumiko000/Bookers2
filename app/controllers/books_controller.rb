class BooksController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find_by(id: current_user.id)
	  @book = Book.new
	  @books = Book.all.order(create_at: :desc)
  end

  def show
    @user = User.find_by(id: current_user.id)
    @book = Book.find(params[:id])
    @new_book = Book.new
  end

  def new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "You have creatad book successfully."
      redirect_to book_path(id: @book.id)
    else
      @user = User.find_by(id: current_user.id)
      @books = Book.all
      render :index
    end
  end

  def edit
    book = Book.find_by(id: params[:id])
    if book.user == current_user
      @book = book
    else
      redirect_to books_path and return
    end
  end

  def update
    @book = current_user.books.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "You have updated book successfully."
      redirect_to book_path(@book)
    else
      render :edit
    end
  end

  def destroy
    book = current_user.books.find(params[:id])
    if book.destroy
      redirect_to books_path
    else
      redirect_to user_path(current_user)
    end
  end


  private

  def book_params
  	params.require(:book).permit(:title, :body)
  end
end

