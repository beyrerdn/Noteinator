class ApplicationController < ActionController::API
  before_action :set_user

  private

  def set_user
    if token
      @user = User.find_by_api_token(token)
    end
  end

  def token
    params[:api_token] ? params[:api_token] : request.headers["HTTP_API_TOKEN"]
  end
end
