require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    bookmarks = DatabaseConnection.query("SELECT * FROM bookmarks")
    bookmarks.map { |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
      }
  end

  def self.create(title, url)
    return false unless self.is_url?(url)
    result = DatabaseConnection.query("INSERT INTO bookmarks(title, url) VALUES('#{title}', '#{url}') RETURNING id, title, url;" )
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, title:, url:)
    DatabaseConnection.query("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id};" )
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id =#{id} ;")[0]
    Bookmark.new(id: result['id'], title: result['title'], url: result['url'])
  end

  private

  def self.is_url?(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
