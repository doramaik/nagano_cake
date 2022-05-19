class Admin::GenresController < ApplicationController

=begin
  def index
    #新規ジャンル作成
    @genre = Genre.new
    #特定のジャンル指定

    #ジャンル一覧取り出し

    @genres = Genre.all
  end

  def create
    #新規ジャンル作成
    @genre = Genre.new(genre_params)
    genre.save
    redirect_to  admin_order_top_path
      flash[:notice] = "You have created new genre successfully."

    else
      @genres = Genre.all
      @genre = Genre.find(params[:id])

      render :index
    end
=end

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to request.referer
  end


  def edit
    @genre = Genre.find(params[:id])
  end


  def update
    #特定のジャンル指定
    @genre = Genre.find(params[:id])

    if @genre.update(genre_params)
      redirect_to admin_genres_path
      flash[:notice] = "You have updated genre successfully."
    else
      render :edit
    end
  end

  # 投稿データのストロングパラメータ
  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end
