class BooksController < ApplicationController

  def new
    @book = Book.new
  end


  def create
    # １.&2. データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    # 3. データをデータベースに保存するためのsaveメソッド実行
    @book.user_id = current_user.id
    @book.save
    redirect_to books_index_path
  end

  def index
    @books = Book.all
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end



  def show
  end

  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/index'
  end

  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body, )
  end

end
