require 'bookmark'
require_relative './features/web_helpers'

describe Bookmark do
  it 'returns a list of bookmarks' do
    populate_test_db
    bookmarks = Bookmark.all
    expect(bookmarks[0]).to be_a Bookmark
    expect(bookmarks[0].title).to include("Makers")
  end

  it 'deletes bookmarks' do
    bookmark = Bookmark.create("title", "http://www.title.com")
    Bookmark.delete(bookmark.id)
    expect(Bookmark.all.length).to eq 0
  end
end
