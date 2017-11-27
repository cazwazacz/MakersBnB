feature 'Allowing user to choose to list or book' do
  scenario 'Rendering the page' do
    visit '/'
    expect(page).to have_button('List')
    expect(page).to have_button('Book')
  end
  
  scenario 'Choosing to list takes the user to a page for listing a new space' do
    visit '/'
    click_link('list-link')
    expect(page.current_path).to eq('/spaces/new')
  end

  scenario 'Choosing to book takes the user to spaces page' do
    visit '/'
    click_link('book-link')
    expect(page.current_path).to eq('/spaces')
  end

end
