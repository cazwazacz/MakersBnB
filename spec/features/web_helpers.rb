def create_space(title, description, price)
  visit('/spaces/new')
  fill_in('title', with: title)
  fill_in('description', with: description)
  fill_in('price', with: price)
  click_button('Add space')
end
