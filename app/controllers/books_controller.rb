class BooksController < ApplicationController
  # before_action specifies something we want to do before any of the following actions/mothods are used / initiated
  before_action :find_book, only: [:show, :edit, :update, :destroy]

  def index
    @books = Book.all.order("created_at DESC")
  end

  def new
    @book = Book.new
  end

  def show
  end

  def edit
  end

  def destroy
    @book.destroy
    redirect_to root_path
  end

  # create / update wont have their own views; just redirect statements
  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to root_path
    else
      # when you 'render', you're rendering another action within the controller-- not necessarily a view per se,
      # but specifically the action and its methods prior to its associated view
      render 'new'
    end
  end

  def update
    # if book is updated successfully, display edit view with form to edit what's already available
    # book_params is going to be changed
    if @book.update(book_params)
      redirect_to book_path(@book)
    else
      render 'edit'
    end
  end

  private
    def book_params
      params.require(:book).permit(:title, :description, :author)
    end

    def find_book
      @book = Book.find(params[:id])
    end
end
