require 'pg'

def setup_test
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec('DROP TABLE IF EXISTS bookmarks;')
  conn.exec('CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, title TEXT, url VARCHAR(60));')
end

def add_data_to_test_db
  conn = PG.connect(dbname: 'bookmark_manager_test')
  Bookmark.create('Makers', 'http://www.makersacademy.com')
  Bookmark.create('Ask Jeeves', 'http://askjeeves.com')
  Bookmark.create('Twitter', 'http://twitter.com')
end
