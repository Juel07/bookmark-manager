require "pg"

class Bookmark


  def self.show_bookmarks
    self.environment
    result = @connection.exec("SELECT * FROM bookmarks;")
    result.map { |bookmark| [bookmark["name"], bookmark["url"]] }
  end

  def self.add(name, url)
    self.environment
    @connection.exec("INSERT INTO bookmarks (url, name) VALUES ('#{url}', '#{name}');")
  end

  private

  def self.environment
    if ENV["ENVIRONMENT"] == "test"
      @connection = PG.connect(dbname: "bookmark_manager_test")
    else
      @connection = PG.connect(dbname: "bookmark_manager")
    end
  end

end
