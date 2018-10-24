require 'pg'

def setup_test
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec('DROP TABLE IF EXISTS bookmarks;')
  conn.exec('CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, title TEXT, url VARCHAR(60));')
end


def add_data_to_test_db
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec("INSERT INTO bookmarks (title,url) VALUES ('Makers','http://www.makersacademy.com');")
  conn.exec("INSERT INTO bookmarks (title,url) VALUES ('Ask Jeeves','http://askjeeves.com');")
  conn.exec("INSERT INTO bookmarks (title,url) VALUES ('Twitter','http://twitter.com');")
end
