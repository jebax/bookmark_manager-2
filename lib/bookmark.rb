require 'pg'

class Bookmark

  def self.all
    bookmarks = []

    if ENV["RACK_ENV"] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end
    result = conn.exec("SELECT * FROM bookmarks")
    result.each do |bookmark|
      bookmarks << bookmark["url"]
    end

    bookmarks.join(", ")
  end

end
