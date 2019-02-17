Rails.application.config.middleware.use OmniAuth::Builder do
  config = Rails.application.credentials.oauth2 || {}

  provider :google_oauth2, config[:client_id],
                           config[:client_secret],
                           image_size: 150
end
