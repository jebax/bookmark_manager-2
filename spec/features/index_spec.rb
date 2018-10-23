feature 'Index page' do
  scenario 'Returns Hello World' do
    visit '/'
    expect(page).to have_content "Bookmark Manager"
  end
end
