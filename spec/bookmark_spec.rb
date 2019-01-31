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

  describe '#create bookmark' do
    it 'returns false if url is invalid' do
      expect(Bookmark.create("Title", "broken_url")).to eq false
    end
  end

  describe '#update' do
    it 'updates bookmark' do
      populate_test_db
      bookmark = Bookmark.create("Makers", "http://www.makers.com")
      id = bookmark.id
      Bookmark.update(id: bookmark.id, title:"Breakers", url: "http://www.breakers.com")
      expect(Bookmark.all[-1].url).to eq "http://www.breakers.com"
      expect(Bookmark.all[-1].title).to eq "Breakers"
      expect(Bookmark.all[-1].id).to eq id
    end

    it 'does not update other bookmarks' do
      populate_test_db
      bookmark = Bookmark.create("Makers", "http://www.makers.com")
      Bookmark.update(id: bookmark.id, title:"Breakers", url: "http://www.breakers.com")
      expect(Bookmark.all[-2].url).to eq "http://www.google.com"
      expect(Bookmark.all[-2].title).to eq "Google"
    end
  end
  describe '#find' do
    it 'finds the bookmark with specified id' do
      bookmark = Bookmark.create("Makers", "http://www.makers.com")
      found_bookmark = Bookmark.find(id: bookmark.id)
      expect(found_bookmark).to be_a Bookmark
      expect(found_bookmark.id).to eq bookmark.id
      expect(found_bookmark.title).to eq "Makers"
      expect(found_bookmark.url).to eq "http://www.makers.com"
    end
  end
end
