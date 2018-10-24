feature 'deleting a bookmark' do
  before do
    add_data_to_test_db
    visit '/bookmarks'
  end

  scenario 'removes deleted bookmark from the list' do
    expect(page).to have_content 'Makers'
    first('.bookmark').click_button 'Delete'
    expect(page).not_to have_content 'Makers'
  end
end
