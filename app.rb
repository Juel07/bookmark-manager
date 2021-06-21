require "sinatra/base"

class BookmarkManager < Sinatra::Base
  get "/" do
    redirect "/bookmarks"
  end

  get "/bookmarks" do
    "Bookmarks:"
  end

  run! if app_file == $0
end
