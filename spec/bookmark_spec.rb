require 'Bookmark'
require_relative './setup_test_database'

describe Bookmark do
  describe '.all' do

    before(:each) do
      setup_test
    end
    
    it 'return all bookmarks' do

      conn = PG.connect(dbname: 'bookmark_manager_test')

      conn.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
      conn.exec("INSERT INTO bookmarks (url) VALUES ('http://askjeeves.com');")
      conn.exec("INSERT INTO bookmarks (url) VALUES ('http://twitter.com');")


      bookmarks = Bookmark.all
      expect(bookmarks).to include("http://www.makersacademy.com")
      expect(bookmarks).to include("http://askjeeves.com")
      expect(bookmarks).to include("http://twitter.com")
    end
  end
end
