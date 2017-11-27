feature 'Allowing user to choose to list or book' do
  scenario 'Rendering the page' do
    visit '/'
    expect(page).to have_button('List')
    expect(page).to have_button('Book')
  end
  scenario 'Choosing to list' do
    visit '/'
    click_link('list-link')
    expect(page.current_path).to eq('/listings/new')
  end
end
