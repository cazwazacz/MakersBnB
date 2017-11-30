feature 'When not signed in not allowing user to' do
  scenario 'Visit page to create a page' do
    visit '/spaces/new'
    expect(page.current_path).to eq('/sessions/new')
  end

end
