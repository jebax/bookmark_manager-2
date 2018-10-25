require 'Bookmark'
require_relative './setup_test_database'

describe Bookmark do

  describe '::create' do
    it 'adds a bookmark to the database' do
      title, body = 'Makers', 'http://www.makersacademy.com'
      result = Bookmark.create(title, body).first
      expect(result['title']).to eq 'Makers'
      expect(result['url']).to eq 'http://www.makersacademy.com'
      expect(result['id']).to eq '1'
    end
    it 'adds returns false for an invlid url' do
      title, body = 'Makers', 'tp://www.makersacademy.com'
      result = Bookmark.create(title, body)
      expect(result).to be false
    end

  end

  describe '::all' do
    before do
      add_data_to_test_db
    end

    it 'returns an instance of Bookmark class' do
      bookmarks = Bookmark.all
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.title).to eq 'Makers'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '::delete' do
    it 'removes a bookmark from the list' do
      add_data_to_test_db
      Bookmark.delete('1')
      expect(Bookmark.all.first.title).not_to be 'Makers'
    end
  end

  describe '::update' do
    before do
      add_data_to_test_db
    end

    it 'updates a bookmarks title and url' do
      title = "Makers Academy"
      url = "http://makers.tech"
      Bookmark.update('1', title, url)
      expect(Bookmark.all.last.title).to eq title
      expect(Bookmark.all.last.url).to eq url
    end
  end

  describe '::comments' do
    before do
      add_data_to_test_db
      add_data_to_comment_db
    end

    it 'returns a list of comments' do
      bookmark = Bookmark.all.first
      comment = bookmark.comments.first
      expect(comment).to be_a Comment
      expect(comment.id).to eq '1'
      expect(comment.text).to eq 'First comment'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end
end
