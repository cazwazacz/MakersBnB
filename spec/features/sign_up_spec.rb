feature 'Allowing a user to sign up to nightmAirbnb' do
  scenario 'Page has a signup form' do
    visit '/users/new'
    expect(page).to have_field 'name'
    expect(page).to have_field 'email'
    expect(page).to have_field 'username'
    expect(page).to have_field 'password'
    expect(page).to have_field 'password_confirmation'
    expect(page).to have_button 'Sign Up'
  end

  scenario 'User is greeted after signing up' do
    attempt_sign_up('allan@gmail.com', 'cazwazacz', 'hello1234', 'hello1234')
    expect(page).to have_content('Welcome to nightmAirbnb, Allan')
  end

  scenario 'User stays on same page if passwords do not match' do
    attempt_sign_up('allan@gmail.com', 'cazwazacz', 'hello1234', 'differentpassword')
    expect(page.current_path).to eq('/users/new')
  end

  scenario 'User stays on same page if email is not unique' do
    attempt_sign_up('allan@gmail.com', 'cazwazacz', 'hello1234', 'hello1234')
    attempt_sign_up('allan@gmail.com', 'peterwdj', 'hello1234', 'hello1234')
    expect(page.current_path).to eq('/users/new')
  end

  scenario 'User stays on same page if email is not unique' do
    attempt_sign_up('allan@gmail.com', 'cazwazacz', 'hello1234', 'hello1234')
    attempt_sign_up('peter@gmail.com', 'cazwazacz', 'hello1234', 'hello1234')
    expect(page.current_path).to eq('/users/new')
  end
end
