feature 'commenting on bookmarks' do
  before do
    add_data_to_test_db
  end

  scenario 'creating a new comment' do
    visit '/bookmarks/1/edit?'
    fill_in :comment, with: 'First comment'
    click_button 'Save'
    expect(page).to have_content 'First comment'
  end
end
