require_relative './web_helpers'

feature 'shows list of bookmarks' do
  scenario 'user visits bookmarks list view' do
    populate_test_db
    visit '/bookmarks'
    expect(page).to have_link('Destroy', href: 'http://www.destroyallsoftware.com')
  end
end
feature 'adding bookmarks' do
  scenario 'adds a valid bookmark to database' do
    visit '/bookmarks'
    click_on 'Add bookmark'
    fill_in 'title', with:"Test"
    fill_in 'url', with:"http://www.test.com"
    click_on 'Save'
    expect(page).to have_content "Test"
  end
  scenario 'tries to add a non valid url' do
    visit '/bookmarks'
    click_on 'Add bookmark'
    fill_in 'title', with:"Test"
    fill_in 'url', with: 'something_wrong'
    click_on 'Save'
    expect(page).to have_content "Please enter a valid url"
  end
end

feature 'delete bookmarks' do
  scenario 'book can be deleted from database' do
    bookmark1 = Bookmark.create("Twitter", "http://www.twitter.com")
    bookmark2 = Bookmark.create("Two", "http://www.two.com")
    visit '/bookmarks'
    first('.bookmark').click_on 'Delete'
    expect(page).not_to have_content "Twitter"
  end
end

feature ' update bookmarks' do
  scenario 'bookmark can be updated' do
    populate_test_db
    visit '/bookmarks'
    first('.bookmark').click_on 'Update'
    fill_in 'title', with:"Breakers"
    click_on 'Submit'
    expect(page).to have_content 'Breakers'
  end
end
