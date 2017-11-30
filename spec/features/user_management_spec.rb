feature 'When not signed in not allowing user to' do
  scenario 'Visit page to create a space' do
    visit '/spaces/new'
    expect(page.current_path).to eq('/sessions/new')
  end

  scenario 'Visit page to book a space' do
    visit '/spaces'
    expect(page.current_path).to eq('/sessions/new')
  end

end
