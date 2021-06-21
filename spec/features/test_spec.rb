feature 'testing infrastructure' do
  scenario 'infrastructure working' do
    visit('/')
    expect(page.status_code).to eq 200
  end
end
