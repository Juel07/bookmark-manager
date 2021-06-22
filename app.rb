require "sinatra/base"
require "sinatra/reloader"
require_relative "lib/bookmark"
require_relative "lib/bookmark_list"

class BookmarkManager < Sinatra::Base
  get "/" do
    redirect "/bookmarks"
  end

  get "/bookmarks" do
    @bookmarks = Bookmark.show_bookmarks
    @bookmarks_unpacked = @bookmarks.each { |array| array }
    erb :bookmarks
  end

  run! if app_file == $0
end
