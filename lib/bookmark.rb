require 'pg'

class Bookmark
  attr_reader :id, :title, :url

  def initialize(id:, title:, url:)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    connection = self.connect_to_database
    bookmarks = connection.exec ("SELECT * FROM bookmarks")
    bookmarks.map { |bookmark|
      Bookmark.new(id: bookmark['id'], title: bookmark['title'], url: bookmark['url'])
      }
  end

  def self.create(title, url)
    connection = self.connect_to_database
    result = connection.exec("INSERT INTO bookmarks(title, url) VALUES('#{title}', '#{url}') RETURNING id, title, url;" )
    Bookmark.new(id: result[0]['id'], title: result[0]['title'], url: result[0]['url'])
  end

  def self.delete(id)
    connection = self.connect_to_database
    connection.exec("DELETE FROM bookmarks WHERE id = #{id}")
  end

  def self.update(id:, title:, url:)
    connection = self.connect_to_database
    connection.exec("UPDATE bookmarks SET url = '#{url}', title = '#{title}' WHERE id = #{id};" )
  end

  private

  def self.connect_to_database
    if ENV['RACK_ENV'] == 'test'
      PG.connect(dbname: 'bookmark_manager_test')
    else
      PG.connect(dbname: 'bookmark_manager')
    end
  end
end
