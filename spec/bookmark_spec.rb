require 'Bookmark'
describe '.all' do
  it 'return all bookmarks' do
    bookmarks = Bookmark.all
    expect(bookmarks).to include("http://www.bookmarks")
    expect(bookmarks).to include("http://www.google.com")
    expect(bookmarks).to include("http://www.yahoo.com")
  end
end
