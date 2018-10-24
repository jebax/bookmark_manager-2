require 'pg'

class Bookmark
  @conn = nil

  attr_reader :title, :url, :id

  def self.all
    choose_database
    select_all.map do |bookmark|
      Bookmark.new(bookmark['title'], bookmark['url'], bookmark['id'])
    end
  end

  def self.create(title, url)
    choose_database
    @conn.exec("INSERT INTO bookmarks(title,url)" \
      "VALUES ('#{title}','#{url}') RETURNING id, title, url;")
  end

  def initialize(title, url, id)
    @title = title
    @url = url
    @id = id
  end

  private

  def self.choose_database
    @conn = if ENV['RACK_ENV'] == 'test'
              PG.connect(dbname: 'bookmark_manager_test')
            else
              PG.connect(dbname: 'bookmark_manager')
            end
  end

  def self.select_all
    @conn.exec('SELECT * FROM bookmarks')
  end
end
