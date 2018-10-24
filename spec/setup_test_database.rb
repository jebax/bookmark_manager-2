require 'pg'

def setup_test
  conn = PG.connect(dbname: 'bookmark_manager_test')
  conn.exec('TRUNCATE bookmarks;')
end
