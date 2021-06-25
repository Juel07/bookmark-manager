require "sinatra/base"
require "sinatra/reloader"
require_relative "lib/bookmark"

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override

  get "/" do
    redirect "/bookmarks"
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.show_bookmarks
    erb :bookmarks
  end

  get "/bookmarks/new" do
    erb :add_bookmark
  end

  post "/bookmarks/add" do
    Bookmark.add(params[:name], params[:url])
    redirect("/bookmarks")
  end

  delete "/bookmarks/:id" do
    Bookmark.delete(params[:id])
    redirect("/bookmarks")
  end

  get "/bookmarks/:id/edit" do
    @bookmark = Bookmark.find(params[:id])
    erb :edit_bookmark
  end

  patch "/bookmarks/:id" do
    Bookmark.update(params[:id], params[:name], params[:url])
    redirect("/bookmarks")
  end

  run! if app_file == $0
end
