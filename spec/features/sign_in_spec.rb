feature 'Allowing user to sign in' do
  scenario 'Render sign in form' do
    visit '/sessions/new'
    expect(page).to have_field('username')
    expect(page).to have_field('password')
    expect(page).to have_button('Sign In')
  end

  scenario 'Page greets user when signing in' do
    attempt_sign_up('allan@gmail.com', 'cazwazacz', 'hello123', 'hello123')
    click_button('Sign Out')
    visit '/sessions/new'
    fill_in('username', with: 'cazwazacz')
    fill_in('password', with: 'hello123')
    click_button('Sign In')
    expect(page).to have_content('Welcome to nightmAirbnb, Allan')
  end

  scenario 'Page informs user of error when password is incorrect' do
    attempt_sign_up('allan@gmail.com', 'cazwazacz', 'hello123', 'hello123')
    click_button('Sign Out')
    visit '/sessions/new'
    fill_in('username', with: 'cazwazacz')
    fill_in('password', with: 'hello1234')
    click_button('Sign In')
    expect(page).to have_content('Username or password is not correct')
  end

  scenario 'Page informs user of error when username is incorrect' do
    attempt_sign_up('allan@gmail.com', 'cazwazacz', 'hello123', 'hello123')
    click_button('Sign Out')
    visit '/sessions/new'
    fill_in('username', with: 'cazwazacz123')
    fill_in('password', with: 'hello123')
    click_button('Sign In')
    expect(page).to have_content('Username or password is not correct')
  end
end
