feature "Deleting Bookmarks:" do
  let(:name) { double(:name) }
  let(:url) { double(:url) }

  scenario "a user can delete a bookmark" do
    Bookmark.add(name, url)
    visit("/bookmarks")
    expect(page).to have_link("#{name}", href: "#{url}")
    first(".bookmark").click_button "X"
    expect(current_path).to eq "/bookmarks"
    expect(page).not_to have_link("#{name}", href: "#{url}")
  end
end
