class NoteSerializer < ActiveModel::Serializer
  attributes :title, :body, :created_at, :updated_at
  has_many :tags, :through => :taggings
  has_many :comments

end
