require 'Bookmark'
require_relative './setup_test_database'

describe Bookmark do
  describe '.all' do

    it 'return all bookmarks' do

      add_data_to_test_db

      bookmarks = Bookmark.all
      expect(bookmarks).to include("Makers")
      expect(bookmarks).to include("Ask Jeeves")
      expect(bookmarks).to include("Twitter")
    end
  end
end
