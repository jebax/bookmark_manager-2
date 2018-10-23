require 'pg'

class Bookmark

  def self.all
    bookmarks = []
    conn = PG.connect(dbname: 'bookmark_manager')
    result = conn.exec("SELECT * FROM bookmarks")
    result.each do |bookmark|
      bookmarks << bookmark["url"]
    end
    bookmarks.join(", ")
  end

end
