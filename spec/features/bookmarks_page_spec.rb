require_relative './web_helpers'

feature 'shows list of bookmarks' do
  scenario 'user visits bookmarks list view' do
    populate_test_db
    visit '/bookmarks'
    expect(page).to have_link('http://www.destroyallsoftware.com', href: 'http://www.destroyallsoftware.com')
  end

  scenario 'adds new bookmark to database' do
    populate_test_db
    visit '/bookmarks'
    click_on 'Add bookmark'
    fill_in 'url', with:"http://www.test.com"
    click_on 'Save'
    expect(page). to have_content "www.test.com"
  end
end
