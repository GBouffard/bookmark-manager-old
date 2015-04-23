feature 'User browses the list of links' do

  before(:each) do
    Link2.create(url: 'http://www.makersacademy.com',
                title: 'Makers Academy')
  end

  scenario 'when opening the home page' do
    visit '/'
    expect(page).to have_content('Makers Academy')
  end
end