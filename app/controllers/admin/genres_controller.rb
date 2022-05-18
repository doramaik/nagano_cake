class Admin::GenresController < ApplicationController
  def index
  end

  def edit
    @genre = Genre.find(params[:id])
  end
end
