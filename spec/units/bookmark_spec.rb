require "bookmark"

describe Bookmark do
  let(:name) { double :name }
  let(:url) { double :url }
  subject(:bookmark) { described_class.new }
  # it "has a name" do
  #   expect(bookmark.name).to eq name
  # end
  # it "has a url" do
  #   expect(bookmark.url).to eq url
  # end
end
