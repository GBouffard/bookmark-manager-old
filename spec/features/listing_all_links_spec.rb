feature 'User browses the list of links' do

before(:each) {
    Link2.create(url: 'http://www.makersacademy.com',
                title: 'Makers Academy',
                tag2s: [Tag2.first_or_create(text: 'education')])
    Link2.create(url: 'http://www.google.com',
                title: 'Google',
                tag2s: [Tag2.first_or_create(text: 'search')])
    Link2.create(url: 'http://www.bing.com',
                title: 'Bing',
                tag2s: [Tag2.first_or_create(text: 'search')])
    Link2.create(url: 'http://www.code.org',
                title: 'Code.org',
                tag2s: [Tag2.first_or_create(text: 'education')])
  }

  scenario 'when opening the home page' do
    visit '/'
    expect(page).to have_content('Makers Academy')
  end

scenario 'filtered by a tag' do
  visit '/tags/search'
  expect(page).not_to have_content('Makers Academy')
  expect(page).not_to have_content('Code.org')
  expect(page).to have_content('Google')
  expect(page).to have_content('Bing')
  end
end