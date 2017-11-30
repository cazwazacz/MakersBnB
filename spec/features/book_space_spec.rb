feature 'Allowing a user to make a booking' do
  scenario 'Rendering book button on page' do
    sign_up_and_sign_in
    create_space('Hogwarts', 'A lovely old castle in Edinburgh', 2000)
    expect(page).to have_button('Book')
  end

  scenario 'Remove book button from page once clicked' do
    sign_up_and_sign_in
    create_space_and_book
    expect(page).not_to have_button('Book')
  end
end
