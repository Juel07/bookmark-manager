feature 'a user can add new bookmarks' do
  let(:name) { double(:name) }
  let(:url) { double(:url) }

  scenario 'a user adds a bookmark' do
    visit('/bookmarks')
    click_link('Add bookmark')
    fill_in(:name, with: name)
    fill_in(:url, with: url)
    click_button('submit')
    expect(page).to have_content("#{name}: #{url}")
  end

end
