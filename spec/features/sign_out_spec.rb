feature 'Allows the user to sign out' do
  scenario 'Spaces page renders button allowing user to sign out if user is signed in' do
    attempt_sign_up('allan@gmail.com', 'cazwazacz', 'hello1234', 'hello1234')
    expect(page).to have_button('Sign Out')
  end

  scenario 'Page displays goodbye message' do
    attempt_sign_up('allan@gmail.com', 'cazwazacz', 'hello1234', 'hello1234')
    click_button('Sign Out')
    expect(page).to have_content('Sorry to see you leave :( ')
    expect(page).to have_content('Please come back soon. ')
    expect(page).to have_content('We miss you. ')
    expect(page).to have_content('Please.')
  end
end
