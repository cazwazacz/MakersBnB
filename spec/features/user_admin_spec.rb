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
    expect(page.text).to include('Hogwarts', 'A lovely old castle in Edinburgh', '2000')
    expect(page.text).to include('Nandos', 'Extra cheeky', '1234')
    expect(page.text).to include('Taj Mahal', 'The best casino in Las Vegas', '982380')
    expect(page.text).to include('Dracula Castle', 'Have extra blood? Come to Transylvania!', '4')
  end
end
