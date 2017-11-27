feature 'Allow user to add a new space' do

  scenario 'Rendering form on page' do
    visit('/spaces/new')
    expect(page).to have_field('title')
    expect(page).to have_field('description')
    expect(page).to have_field('price')
    expect(page).to have_button('Add space')
  end

  scenario 'Submitting "add new space" form redirects to show spaces' do
    visit('/spaces/new')
    fill_in('title', with: 'new house')
    fill_in('description', with: 'humble abode')
    fill_in('price', with: '1000')
    click_button('Add space')
    expect(page).to have_content('Spaces')
  end

end
