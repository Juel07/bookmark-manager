require "bookmark_list"

describe BookmarkList do
  let(:bookmark) { double :bookmark }
  #   let(:url) { double :url }
  subject(:bookmark_list) { described_class.new }
  it "can have a bookmark" do
    expect(bookmark_list.show_bookmarks).not_to be_empty
  end
  #   it "has a url" do
  #   end
end
