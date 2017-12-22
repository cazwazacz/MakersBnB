def create_space(title, description, price, location = "London")
  visit('/spaces/new')
  fill_in('title', with: title)
  fill_in('description', with: description)
  fill_in('price', with: price)
  fill_in('location', with: location)
  click_button('Add space')
end

def create_space_and_book
  create_space('Hogwarts', 'Edinburgh', 2000)
  click_button('book')
end

def attempt_sign_up(email, username, password, password_confirmation)
  visit '/users/new'
  fill_in('name', with: 'Allan')
  fill_in('email', with: email)
  fill_in('username', with: username)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button('let\'s go')
end

def sign_up_and_sign_in
  attempt_sign_up('ga@yahoo.com', 'gaby', '123', '123')
  visit('/sessions/new')
  fill_in('username', with: 'gaby')
  fill_in('password', with: '123')
  click_button('let\'s go')
end

def create_many_spaces
  create_space('Hogwarts', 'A lovely old castle in Edinburgh', 2000)
  create_space('Nandos', 'Extra cheeky', 1234)
  create_space('Taj Mahal', 'The best casino in Las Vegas', 982380)
  create_space('Dracula Castle', 'Have extra blood? Come to Transylvania!', 4)
end
