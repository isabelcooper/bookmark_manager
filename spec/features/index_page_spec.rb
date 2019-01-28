feature 'greets the user' do
  scenario 'when homepage is loaded' do
    visit '/'
    expect(page).to have_content('Welcome to Habalex BookMark Manager')
    expect(page).to have_content('Click below to access your bookmarks')
  end
end
