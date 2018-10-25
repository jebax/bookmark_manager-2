require 'pg'

def setup_test
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec('DROP TABLE IF EXISTS comments;')
  conn.exec('DROP TABLE IF EXISTS bookmarks;')
  conn.exec('CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, title TEXT, url VARCHAR(60));')
  conn.exec('CREATE TABLE comments(id SERIAL PRIMARY KEY, text VARCHAR(240), bookmark_id INTEGER REFERENCES bookmarks(id) ON DELETE CASCADE)')
end

def add_data_to_test_db
  Bookmark.create('Makers', 'http://www.makersacademy.com')
  Bookmark.create('Ask Jeeves', 'http://askjeeves.com')
  Bookmark.create('Twitter', 'http://twitter.com')
end

def add_data_to_comment_db
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec("INSERT INTO comments(text,bookmark_id) VALUES('First comment','1'), ('Second comment','1')")
end
