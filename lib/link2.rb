class Link2
  include DataMapper::Resource
  property :id,     Serial
  property :title,  String
  property :url,    String
  has n, :tag2s, through: Resource
end