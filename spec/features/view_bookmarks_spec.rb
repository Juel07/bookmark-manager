feature "Viewing bookmarks" do
  scenario "seeing bookmarks" do
    visit("/bookmarks")
    expect(page).to have_content "Bookmarks:"
  end
  scenario "seeing list of bookmarks" do
    visit("/bookmarks")
    expect(page).to have_content "Makers: http://www.makers.tech/"
    expect(page).to have_content "Twitter: http://www.twitter.com"
    expect(page).to have_content "AskJeeves: http://www.askjeeves.com/"
  end
end
