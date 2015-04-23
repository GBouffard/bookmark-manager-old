class Tag2

  include DataMapper::Resource

  has n, :link2s, through: Resource
  property :id, Serial
  property :text, String

end