feature "Viewing bookmarks" do
  scenario "seeing bookmarks" do
    visit("/bookmarks")
    expect(page).to have_content "Bookmarks:"
  end
end
