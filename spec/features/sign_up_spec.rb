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
    visit '/users/new'
    fill_in('name', with: 'Allan')
    fill_in('email', with: 'allan@gmail.com')
    fill_in('username', with: 'cazwazacz')
    fill_in('password', with: 'hello1234')
    fill_in('password_confirmation', with: 'hello1234')
    click_button('Sign Up')
    expect(page).to have_content('Welcome to nightmAirbnb, Allan')
  end

  scenario 'User stays on same page if passwords do not match' do
    visit '/users/new'
    fill_in('name', with: 'Allan')
    fill_in('email', with: 'allan@gmail.com')
    fill_in('username', with: 'cazwazacz')
    fill_in('password', with: 'hello1234')
    fill_in('password_confirmation', with: 'differentpassword')
    click_button('Sign Up')
    expect(page.current_path).to eq('/users/new')
  end
end
