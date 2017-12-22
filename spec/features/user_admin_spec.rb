feature 'User dashboard' do
  scenario 'User dashboard contains all relevant content' do
    attempt_sign_up('ga@yahoo.com', 'gaby', '123', '123')
    click_button('My Dashboard')
    expect(page).to have_content('Hello, Allan')
    expect(page).to have_content('Spaces')
    expect(page).to have_content('Bookings')
    expect(page).to have_content('Requests')
  end

  scenario 'User dashboard contains all relevant content' do
    attempt_sign_up('ga@yahoo.com', 'gaby', '123', '123')
    create_many_spaces
    click_button('My Dashboard')
    expect(page.text).to include('Hogwarts')
    expect(page.text).to include('Nandos')
    expect(page.text).to include('Taj Mahal')
    expect(page.text).to include('Dracula Castle')
  end
end
