require 'pg'

class Bookmark

  def self.all

    if ENV["RACK_ENV"] == 'test'
      conn = PG.connect(dbname: 'bookmark_manager_test')
    else
      conn = PG.connect(dbname: 'bookmark_manager')
    end
    result = conn.exec("SELECT * FROM bookmarks")
    result.map do |bookmark|
      bookmark["title"]
    end

  end

end
