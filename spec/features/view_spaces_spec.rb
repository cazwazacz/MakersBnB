feature 'Viewing all spaces' do
  scenario 'Page should display all spaces' do
    create_space('Hogwarts', 'A lovely old castle in Edinburgh', 2000)
    create_space('Nandos', 'Extra cheeky', 1234)
    create_space('Taj Mahal', 'The best casino in Las Vegas', 982380)
    create_space('Dracula Castle', 'Have extra blood? Come to Transylvania!', 4)
    expect(page.text).to include('Hogwarts', 'A lovely old castle in Edinburgh', '2000')
    expect(page.text).to include('Nandos', 'Extra cheeky', '1234')
    expect(page.text).to include('Taj Mahal', 'The best casino in Las Vegas', '982380')
    expect(page.text).to include('Dracula Castle', 'Have extra blood? Come to Transylvania!', '4')
  end
end
