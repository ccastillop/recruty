Rails.application.config.x.settings["oauth2"] = {} if Rails.env.test?

Rails.application.config.middleware.use OmniAuth::Builder do
  config = Rails.application.config.x.settings["oauth2"]

  provider :google_oauth2, Rails.application.credentials.oauth["client_id"],
                           Rails.application.credentials.oauth["client_secret"],
                           image_size: 150
end