class BookmarksController < ApplicationController
  before_action :bookmark_params, only: :create
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    set_bookmark
  end

  private

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
    if @bookmark.save
      redirect_to @lists_path, notice: "Movie was successfully added."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :id)
  end
end
