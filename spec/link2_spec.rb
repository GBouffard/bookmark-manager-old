describe Link2 do
  context 'Demonstration of how datamapper works' do
    it 'should be created and then retrieved from the db' do
      expect(Link2.count).to eq(0)
      Link2.create(title: 'Makers Academy',
      url: 'http://www.makersacademy.com/')
      expect(Link2.count).to eq(1)
      link = Link2.first
      expect(link.url).to eq('http://www.makersacademy.com/')
      expect(link.title).to eq('Makers Academy')
      link.destroy
      expect(Link2.count).to eq(0)
    end
  end
end