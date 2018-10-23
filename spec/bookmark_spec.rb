require 'Bookmark'
describe '.all' do
  it 'return all bookmarks' do
    bookmarks = Bookmark.all
    expect(bookmarks).to include("http://www.makersacademy.com")
    expect(bookmarks).to include("http://askjeeves.com")
    expect(bookmarks).to include("http://twitter.com")
  end
end
