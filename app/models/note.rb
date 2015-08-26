class Note < ActiveRecord::Base
  include ActiveModel::Serialization
  has_many :taggings
  has_many :tags, through: :taggings
  belongs_to :user
  validates_presence_of :title
  validates_presence_of :body

  def tags=(names)
    names.split(",").each do |name|
      self.tags << Tag.where(name: name.strip).first_or_create
    end
  end

  # def tags
  #   self.tags.map(&:name).join(", ")
  # end

end
