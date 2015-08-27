class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :note
  validates_presence_of :body
end
