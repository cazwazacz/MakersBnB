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
  click_button('Book')
end

def attempt_sign_up(email, username, password, password_confirmation)
  visit '/users/new'
  fill_in('name', with: 'Allan')
  fill_in('email', with: email)
  fill_in('username', with: username)
  fill_in('password', with: password)
  fill_in('password_confirmation', with: password_confirmation)
  click_button('Sign Up')
end
