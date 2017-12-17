 # Be sure to restart your server when you modify this file.

 # Avoid CORS issues when API is called from the frontend app.
 # Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

 # Read more: https://github.com/cyu/rack-cors
    # origins 'localhost:4000'

Rails.application.config.middleware.insert_before 0, Rack::Cors, debug: true, logger: (-> { Rails.logger }) do
  puts("clearing cors for #{ENV['CORS_ORIGIN']} and #{ENV['CORS_ORIGIN2']}")
  allow do
    origins "#{ENV['CORS_ORIGIN']}"
    resource '*',
     headers: :any,
     credentials: true,
     methods: [:get, :post, :options, :delete, :put, :patch]
  end

  if ENV['CORS_ORIGIN2']
    allow do
      origins "#{ENV['CORS_ORIGIN2']}"
      resource '*',
       headers: :any,
       credentials: true,
       methods: [:get, :post, :options, :delete, :put, :patch]
    end
  end

  # allow do
  #   origins "http://localhost:4000"
  #   resource '*',
  #    headers: :any,
  #    credentials: true,
  #    methods: [:get, :post, :options, :delete, :put, :patch]
  # end
end
