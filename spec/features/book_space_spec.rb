feature 'Allowing a user to make a booking' do
  scenario 'Rendering book button on page' do
    create_space('Hogwarts', 'A lovely old castle in Edinburgh', 2000)
    expect(page).to have_button('Book')
  end

  scenario 'Remove book button from page once clicked' do
    create_space_and_book
    expect(page).not_to have_button('Book')
  end

  scenario 'When booking, available is changed to false' do
    create_space_and_book
    expect(Space.last.available?).to be false
  end
end
