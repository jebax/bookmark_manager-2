# As a user
# So that I can quickly access the websites that I regularly visit
# I would like to be to view the bookmarks I've saved

feature 'bookmarks page' do
  scenario 'show title' do
    visit '/bookmarks'
    expect(page).to have_content "Bookmarks"
  end

  scenario 'show all bookmarks' do
    add_data_to_test_db
    visit '/bookmarks'
    expect(page).to have_content "Makers Ask Jeeves Twitter"
  end
end

# As a user
# So that I can access the websites that I regularly visit
# I would like to add a new bookmark

feature '' do

end
