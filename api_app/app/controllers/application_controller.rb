class ApplicationController < ActionController::API
  include ActionController::Serialization
  include ActionController::HttpAuthentication::Token::ControllerMethods

  # All users will need to authenticate to use this API.
  # If you want to only authenticate certain controllers,
  # call before_action :authenticate in the child controllers
  before_action :authenticate

  protected

  # Authenticate the user with token based authentication
  def authenticate
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token|
      @current_user = User.find_by(api_key: token)
    end
  end

  def render_unauthorized(realm = 'Application')
    self.headers['WWW-Authenticate'] = %(Token realm="#{realm.gsub(/"/, '')}")
    render json: 'Bad credentials', status: :unauthorized
  end
end
