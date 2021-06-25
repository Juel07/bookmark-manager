feature "Updating Bookmarks:" do
  let(:name) { double(:name) }
  let(:url) { double(:url) }
  let(:new_name) { double(:new_name) }
  let(:new_url) { double(:new_url) }

  scenario "a user can update a bookmark" do
    bookmark = Bookmark.add(name, url)
    visit "/bookmarks"
    expect(page).to have_link("#{name}", href: "#{url}")

    first(".bookmark").click_button "edit"
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"
    fill_in(:name, with: new_name)
    fill_in(:url, with: new_url)
    click_button "Update"

    expect(current_path).to eq "/bookmarks"
    expect(page).not_to have_link("#{name}", href: "#{url}")
    expect(page).to have_link("#{new_name}", href: "#{new_url}")
  end
end
