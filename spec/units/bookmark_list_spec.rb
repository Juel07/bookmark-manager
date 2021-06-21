require "bookmark_list"

describe BookmarkList do
  let(:bookmark) { double :bookmark }
  #   let(:url) { double :url }
  subject(:bookmark_list) { described_class.new }
  it "can have a bookmark" do
    expect(bookmark_list.show_bookmarks).to be_an_instance_of(Array)
  end
  #   it "has a url" do
  #   end
end
