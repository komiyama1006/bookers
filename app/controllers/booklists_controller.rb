class BooklistsController < ApplicationController
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
  	#トップ画面へリダイレクト
  	#ここを「successfully」画面に遷移させたい
  	 redirect_to booklist_path(@book.id) #詳細画面へリダイレクト

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
      redirect_to booklist_path(book.id)
     end
  end

  def destroy
    book = Book.find(params[:id])#データ(レコード)を1件取得
    book.destroy #データ(レコード)を削除
    redirect_to booklists_path #List一覧画面へリダイレクト
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end

end