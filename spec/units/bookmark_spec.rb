require "bookmark"

describe Bookmark do
  let(:name) { double :name }
  let(:url) { double :url }

  it "displays a list of bookmarks" do
    # connection = PG.connect(dbname: "bookmark_manager_test")
    # connection.exec("INSERT INTO bookmarks (url, name) VALUES ('http://www.twitter.com/', 'Twitter');")
    # connection.exec("INSERT INTO bookmarks (url, name) VALUES ('http://www.makers.tech/', 'Makers');")
    # connection.exec("INSERT INTO bookmarks (url, name) VALUES ('http://www.askjeeves.com/', 'AskJeeves');")

    bookmark = Bookmark.add("Makers", "http://www.makers.tech/")
    Bookmark.add("Twitter", "http://www.twitter.com/")
    Bookmark.add("AskJeeves", "http://www.askjeeves.com/")

    bookmarks = Bookmark.show_bookmarks

    # expect(bookmarks).to include(["Makers", "http://www.makers.tech/"])
    # expect(bookmarks).to include(["Twitter", "http://www.twitter.com/"])
    # expect(bookmarks).to include(["AskJeeves", "http://www.askjeeves.com/"])
    expect(bookmarks.length).to eq 3
    expect(bookmarks.first).to be_a Bookmark
    expect(bookmarks.first.id).to eq bookmark.id
    expect(bookmarks.first.name).to eq "Makers"
    expect(bookmarks.first.url).to eq "http://www.makers.tech/"
  end

  it "can add a bookmark" do
    Bookmark.add(name, url)
    bookmarks = Bookmark.show_bookmarks
    expect(bookmarks.first.name).to eq "#{name}"
    expect(bookmarks.first.url).to eq "#{url}"
  end

  describe ".create" do
    it "creates a bookmark" do
      bookmark = Bookmark.add("Test Bookmark", "http://wwww.testbookmark.com")
      persisted_data = PG.connect(dbname: "bookmark_manager_test").query(
        "SELECT * FROM bookmarks WHERE id = #{bookmark.id};"
      )
      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data.first["id"]
      expect(bookmark.name).to eq "Test Bookmark"
      expect(bookmark.url).to eq "http://wwww.testbookmark.com"
    end
  end
end
