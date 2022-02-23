class BooksController < ApplicationController
# before_action :correct_user, only: [:edit, :update]
  def new
    @book = Book.new
  end


  def create
    @user = current_user
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @books = Book.all
    @book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id), notice: 'Created book successfully'
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @user = current_user
    @book = Book.new
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), notice: 'Updated successfully'
    else
      render :edit
    end
  end



  def show
    @book = Book.find(params[:id])
    @newbook = Book.new
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
    else
    　redirect_to books_path
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
