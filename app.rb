require "sinatra/base"
require "sinatra/reloader"
require_relative "lib/bookmark"
# require_relative "lib/bookmark_list"

class BookmarkManager < Sinatra::Base
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
    redirect('/bookmarks')
  end

  run! if app_file == $0
end
