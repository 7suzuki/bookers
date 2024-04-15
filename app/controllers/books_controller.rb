class BooksController < ApplicationController
# 投稿と一覧をindexまとめるので新規投稿の単体画面は不要
  # def new
  #   @book = Book.new
  # end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      # アクションを実行するので変数@も入る
      redirect_to book_path(@book.id)
      # "/books/#{@book.id}"
    else
      flash.now[:alert]="Book was failed to create."
      # indexに表示させる変数を準備しておく
      @books = Book.all
      # @book = Book.new→不要
      # 今回一覧はindexに表示させるため飛ぶ場所がnewではなくindex
      # render はアクション実行がないのでビューだけ
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new

  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)

    else
      flash.now[:alert] = "Book was failed to update."
      #renderは指定先が違う
      render :edit
      
    end

  end

  def destroy
    # ローカル変数
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
    # pathに(id)=idを特定して表示する→routesコマンドURIPattern　idなし＝id特定する必要がない
    flash[:notice] = "Book was successfully destroyed."
  end

  private #ストロングパラメータ
    def book_params
      params.require(:book).permit(:title, :body)
    end
end

