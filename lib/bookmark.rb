require 'pg'

class Bookmark
  @conn = nil

  def self.all
    choose_database
    select_all.map do |bookmark|
      bookmark["title"]
    end
  end

  def self.create(title, url)
    choose_database
    @conn.exec("INSERT INTO bookmarks(title,url) VALUES ('#{title}','#{url}');")
  end

  private

  def self.choose_database
    if ENV["RACK_ENV"] == 'test'
      @conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      @conn = PG.connect(dbname: 'bookmark_manager')
    end
  end

  def self.select_all
    @conn.exec("SELECT * FROM bookmarks")
  end
end
