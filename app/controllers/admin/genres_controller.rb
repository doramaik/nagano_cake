class Admin::GenresController < ApplicationController


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

    @genre.save
     redirect_to admin_genres_path
      flash[:notice] = "You have created new genre successfully."
=begin
    else
      @genres = Genre.all
      render :index
    end
=end
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
