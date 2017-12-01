feature 'Allowing a user to sign up to nightmAirbnb' do
  scenario 'Page has a signup form' do
    visit '/users/new'
    expect(page).to have_field 'name'
    expect(page).to have_field 'email'
    expect(page).to have_field 'username'
    expect(page).to have_field 'password'
    expect(page).to have_field 'password_confirmation'
    expect(page).to have_button "let's go"
  end

  scenario 'User is greeted after signing up' do
    attempt_sign_up('allan@gmail.com', 'cazwazacz', 'hello1234', 'hello1234')
    expect(page).to have_content('welcome to nightmAirbnb, Allan')
  end

  scenario 'User stays on same page if passwords do not match' do
    attempt_sign_up('allan@gmail.com', 'cazwazacz', 'hello1234', 'differentpassword')
    expect(page.current_path).to eq('/users/new')
    expect(page).to have_content('Password does not match the confirmation')
  end

  scenario 'User stays on same page if email is not unique' do
    attempt_sign_up('allan@gmail.com', 'cazwazacz', 'hello1234', 'hello1234')
    attempt_sign_up('allan@gmail.com', 'peterwdj', 'hello1234', 'hello1234')
    expect(page.current_path).to eq('/users/new')
    expect(page).to have_content('Email is already taken')
  end

  scenario 'User stays on same page if email is not unique' do
    attempt_sign_up('allan@gmail.com', 'cazwazacz', 'hello1234', 'hello1234')
    attempt_sign_up('peter@gmail.com', 'cazwazacz', 'hello1234', 'hello1234')
    expect(page.current_path).to eq('/users/new')
    expect(page).to have_content('Username is already taken')
  end
end
