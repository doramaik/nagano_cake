class Public::GenresController < ApplicationController
  #全てのアクションの前にユーザーがログインしているか確認する。
  #ログインしていない時、ログインページに遷移。
  before_action :authenticate_customer!

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end

end
