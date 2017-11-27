def create_space
  visit('/spaces/new')
  fill_in('title', with: 'new house')
  fill_in('description', with: 'humble abode')
  fill_in('price', with: '1000')
  click_button('Add space')
end
