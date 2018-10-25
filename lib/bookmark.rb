require_relative "database_connection"

class Bookmark

  attr_reader :title, :url, :id

  def self.all
    select_all.map do |bookmark|
      Bookmark.new(bookmark['title'], bookmark['url'], bookmark['id'])
    end
  end

  def self.create(title, url)
    DatabaseConnection.query("INSERT INTO bookmarks(title,url)" \
      "VALUES ('#{title}','#{url}') RETURNING id, title, url;")
  end

  def self.delete(id)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id='#{id}';")
  end

  def self.update(id, title, url)
    DatabaseConnection.query("UPDATE bookmarks SET title = '#{title}', url = '#{url}' WHERE id = '#{id}'")
  end

  def initialize(title, url, id)
    @title = title
    @url = url
    @id = id
  end

  private

  def self.select_all
    DatabaseConnection.query('SELECT * FROM bookmarks')
  end
end
