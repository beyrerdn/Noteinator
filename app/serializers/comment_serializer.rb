class CommentSerializer < ActiveModel::Serializer
  attributes :body, :user

  def user
    object.user.email
  end
  
end
