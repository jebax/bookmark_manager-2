# As a user
# So that I can quickly access the websites that I regularly visit
# I would like to be to view the bookmarks I've saved

feature 'bookmarks page' do
  scenario 'show title' do
    visit '/bookmarks'
    expect(page).to have_content 'Bookmarks'
  end

  scenario 'show all bookmarks' do
    add_data_to_test_db
    visit '/bookmarks'
    expect(page).to have_content "Makers\nAsk Jeeves\nTwitter"
  end

  scenario 'clicking a title redirects the user to the page' do
    add_data_to_test_db
    visit '/bookmarks'
    click_link("Makers")
    expect(page).to have_current_path "http://www.makersacademy.com"
  end
end
