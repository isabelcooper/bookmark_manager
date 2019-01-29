feature 'shows list of bookmarks' do
  scenario 'user visits bookmarks list view' do
    visit '/bookmarks'
    expect(page).to have_link('http://www.destroyallsoftware.com', href: 'http://www.destroyallsoftware.com')
  end
end
