feature 'Viewing all spaces' do
  scenario 'Page should display all spaces' do
    sign_up_and_sign_in
    create_space('Hogwarts', 'A lovely old castle in Edinburgh', 2000)
    create_space('Nandos', 'Extra cheeky', 1234)
    create_space('Taj Mahal', 'The best casino in Las Vegas', 982380)
    create_space('Dracula Castle', 'Have extra blood? Come to Transylvania!', 4)
    expect(page.text).to include('Hogwarts', 'A lovely old castle in Edinburgh', '2000')
    expect(page.text).to include('Nandos', 'Extra cheeky', '1234')
    expect(page.text).to include('Taj Mahal', 'The best casino in Las Vegas', '982380')
    expect(page.text).to include('Dracula Castle', 'Have extra blood? Come to Transylvania!', '4')
  end

  scenario 'Hiding the book button when space is not available' do
    sign_up_and_sign_in
    create_space('Hogwarts', 'A lovely old castle in Edinburgh', 2000)
    click_button('Book')
    visit '/spaces'
    expect(page).not_to have_button('Book')
  end

  scenario 'Display "unavailable" when a space is booked' do
    sign_up_and_sign_in
    create_space('Hogwarts', 'A lovely old castle in Edinburgh', 2000)
    click_button('Book')
    sleep 1
    visit '/spaces'
    expect(page).to have_content('Unavailable')
  end
end

feature 'Filtering spaces' do
  scenario 'Render filter fields and button' do
    visit '/spaces'
    expect(page).to have_field('price-filter')
    expect(page).to have_field('location-filter')
    expect(page).to have_button('Filter')
  end
end
