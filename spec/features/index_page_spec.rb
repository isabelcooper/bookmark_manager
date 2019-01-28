feature 'greets the user' do
  scenario 'when homepage is loaded' do
    visit '/'
    expect(page).to have_content('Welcome to Habalex BookMark Manager')
    expect(page).to have_content('Click below to access your bookmarks')
  end

  scenario 'has view bookmarks link' do
    visit '/'
    click_button('View Bookmarks')
    expect(page).to have_content('Bookmark List')
  end
end
