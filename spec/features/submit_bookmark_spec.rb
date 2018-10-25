feature 'submitting a bookmark' do
  before do
    visit '/'
    fill_in :title, with: 'Makers'
    fill_in :url, with: 'http://makers.tech'
    click_button 'Submit'
  end

  scenario 'takes the user to the bookmarks page' do
    expect(page).to have_current_path '/bookmarks'
  end

  scenario 'shows the submitted title on the bookmarks page' do
    expect(page).to have_content 'Makers'
  end
end

feature 'submitting an invalid bookmark' do
  before do
    visit '/'
    fill_in :title, with: 'Makers'
    fill_in :url, with: 'Makers Academy'
    click_button 'Submit'
  end

  scenario 'shows an error message' do
    expect(page).to have_content 'Please enter a valid URL!'
  end
end
