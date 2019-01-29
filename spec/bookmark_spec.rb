require 'bookmark'

describe Bookmark do
  it 'returns a list of bookmarks' do
    bookmarks = Bookmark.all
    expect(bookmarks).to include('http://www.destroyallsoftware.com')
  end
end
