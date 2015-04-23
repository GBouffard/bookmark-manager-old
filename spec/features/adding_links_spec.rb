feature 'User adds a new link' do
  scenario 'when browsing the homepage' do
    expect(Link2.count).to eq(0)
    visit '/'
    add_link('http://www.makersacademy.com/', 'Makers Academy')
    expect(Link2.count).to eq(1)
    link = Link2.first
    expect(link.url).to eq('http://www.makersacademy.com/')
    expect(link.title).to eq('Makers Academy')
  end

scenario 'with a few tags' do
    visit '/'
    add_link('http://www.makersacademy.com/',
             'Makers Academy',
             %w(education ruby))
    link = Link2.first
    expect(link.tag2s.map(&:text)).to include 'education', 'ruby'
  end

  def add_link(url, title, tag2s = [])
    within('#new-link') do
      fill_in 'url', with: url
      fill_in 'title', with: title
      fill_in 'tags', with: tag2s.join(' ')
      click_button 'Add link'
    end
  end
end