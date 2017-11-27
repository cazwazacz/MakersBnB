feature 'testing' do
  scenario 'infrastructure' do
    visit '/'
    expect(page).to have_content('hello world!')
  end
end
