feature 'updating a bookmark' do

  before do
    add_data_to_test_db
    visit '/bookmarks'
    first('.bookmark').click_button 'Update'
  end

  scenario 'clicking on the edit button take you to an edit page' do
    expect(page).to have_current_path '/bookmarks/1/edit'
  end

  scenario 'can see that current values of title and url' do
    expect(page).to have_selector("input[type='text'][value='Makers']")
    expect(page).to have_selector("input[type='text'][value='http://www.makersacademy.com']")
  end

  scenario 'can submit a change and return to the bookmarks list' do
    click_button "Update"
    expect(page).to have_current_path '/bookmarks'
  end
end
