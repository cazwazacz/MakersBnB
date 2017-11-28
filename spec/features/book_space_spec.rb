feature 'Allowing a user to make a booking' do
  scenario 'Rendering book button on page' do
    create_space('Hogwarts', 'A lovely old castle in Edinburgh', 2000)
    expect(page).to have_button('Book')
  end
  scenario 'Remove book button from page once clicked' do
    create_space('Hogwarts', 'A lovely old castle in Edinburgh', 2000)
    click_button('Book')
    expect(page).not_to have_button('Book')
  end
end
