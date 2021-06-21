require "sinatra/base"
require_relative "lib/bookmark"
require_relative "lib/bookmark_list"

class BookmarkManager < Sinatra::Base
  get "/" do
    redirect "/bookmarks"
  end

  get "/bookmarks" do
    @bookmark_list = BookmarkList.new
    erb :bookmarks
  end

  run! if app_file == $0
end
