feature 'Allowing a user to sign up to nightmAirbnb' do
  scenario 'Page has a signup form' do
    visit '/users/new'
    expect(page).to have_field 'name'
    expect(page).to have_field 'email'
    expect(page).to have_field 'username'
    expect(page).to have_field 'password'
    expect(page).to have_button 'Sign Up'
  end
end
