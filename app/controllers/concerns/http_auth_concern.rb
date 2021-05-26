module HttpAuthConcern
  extend ActiveSupport::Concern
  
  included do
    before_action :http_authenticate
  end

  def http_authenticate
    # return true unless Rails.env == 'production'

    authenticate_or_request_with_http_basic do |username, password|
      username == 'Jungle' && password == 'book'
      # username == ENV['HTTP_AUTH_USER'] && password == ENV['HTTP_AUTH_PASSWORD']
    end
  end
end