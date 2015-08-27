class Api::CommentsController < ApplicationController

  def create
    if @user
      @comment = Comment.create(comment_params)
      @comment.update_attributes(:user_id => @user.id)
    else
      puts "You must be a provide a valid token to make a comment."
    end

  end

  private

  def comment_params
    params.permit(:body, :note_id, :user_id)
  end

end
