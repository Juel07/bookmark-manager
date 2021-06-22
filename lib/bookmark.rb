require 'pg'

class Bookmark
  # attr_reader :name, :url

  # def initialize(name, url)
  #   @name = name
  #   @url = url
  # end

  def self.show_bookmarks
    connection = PG.connect( dbname: 'bookmark_manager' )
    result = connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| [bookmark['name'], bookmark['url'] ] }
      # "#{bookmark['name']}: #{bookmark['url']}" }
  end
  
end
