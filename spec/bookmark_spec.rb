require 'bookmark'
require_relative './features/web_helpers'

describe Bookmark do
  it 'returns a list of bookmarks' do
    populate_test_db
    bookmarks = Bookmark.all
    expect(bookmarks[0]).to be_a Bookmark
    expect(bookmarks[0].title).to include("Makers")
  end
end
