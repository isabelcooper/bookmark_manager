feature 'shows list of bookmarks' do
  scenario 'user visits bookmarks list view' do
    visit '/bookmarks'
    expect(page).to have_content('Wikipedia')
    expect(page).to have_link('https://en.wikipedia.org/wiki/Main_Page', href: 'https://en.wikipedia.org/wiki/Main_Page')
  end
end
