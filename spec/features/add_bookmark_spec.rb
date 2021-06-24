feature "a user can add new bookmarks" do
  let(:name) { double(:name) }
  let(:url) { double(:url) }

  scenario "a user adds a bookmark" do
    visit("/bookmarks")
    click_button("Add bookmark")
    fill_in(:name, with: name)
    fill_in(:url, with: url)
    click_button("Submit")
    expect(page).to have_link("#{name}", href: "#{url}")
  end
end
