feature "Viewing bookmarks" do
  scenario "seeing bookmarks" do
    visit("/bookmarks")
    expect(page).to have_content "Bookmarks:"
  end
  scenario "seeing list of bookmarks" do
    visit("/bookmarks")
    expect(page).to have_content "Makers: https://makers.tech/"
  end
end
