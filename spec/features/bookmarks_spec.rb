feature 'bookmarks page' do
  scenario 'show title' do
    visit '/bookmarks'
    expect(page).to have_content "bookmarks"
  end

  scenario 'show all bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content "http://www.bookmarks, http://www.google.com, http://www.yahoo.com"
  end
end
