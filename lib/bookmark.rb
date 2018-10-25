require_relative "database_connection"
require_relative 'comment'
require 'uri'

class Bookmark

  attr_reader :title, :url, :id

  def self.all
    select_all.map do |bookmark|
      Bookmark.new(bookmark['title'], bookmark['url'], bookmark['id'])
    end
  end

  def self.create(title, url)
    return false unless validate_url(url)
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

  def comments
    comments = DatabaseConnection.query("SELECT * FROM comments WHERE bookmark_id=#{@id}")
    comments.map do |comment|
      Comment.new(comment['id'], comment['text'], comment['bookmark_id'])
    end
  end

  private

  def self.select_all
    DatabaseConnection.query('SELECT * FROM bookmarks')
  end

  def self.validate_url(url)
    url =~ /\A#{URI::regexp(['http', 'https'])}\z/
  end

end
