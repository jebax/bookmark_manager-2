feature 'bookmarks page' do
  scenario 'show title' do
    visit '/bookmarks'
    expect(page).to have_content "Bookmarks"
  end

  scenario 'show all bookmarks' do
    visit '/bookmarks'
    expect(page).to have_content "http://www.makersacademy.com, http://askjeeves.com, http://twitter.com"
  end
end
