class BooksController < ApplicationController


  def new

  	@book = Book.new

  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
  	#ストロングパラメーターを使用
  	@book = Book.new(book_params)
  	#DBへ保存する
  	if @book.save  #データベースへ保存する
      # 投稿ボタンを押したら、"successfully"が表示されるようにする。
      flash[:notice] = "Book was successfully updated."
  	#トップ画面へリダイレクト
  	#ここを「successfully」画面に遷移させたい
  	 redirect_to book_path(@book.id) #詳細画面へリダイレクト

    else
      @books = Book.all
      render "index"
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
     if book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(book.id)
     end
  end

  def destroy
    book = Book.find(params[:id])#データ(レコード)を1件取得
    book.destroy #データ(レコード)を削除
    redirect_to books_path #List一覧画面へリダイレクト
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end


end
