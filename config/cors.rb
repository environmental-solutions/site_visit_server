Rails.application.config.middleware.insert_before 0, "Rack::Cors" do
 allow do
   # fixme: what's minimally required here?
   # origins 'localhost:4200', 'beta.sessuru.com', 'http://app.beta.sessuru.com.s3-website-us-west-2.amazonaws.com/sessuru'
   origins '*'

   resource '*',
     headers: :any,
     methods: [:get, :post, :put, :patch, :delete, :options, :head]
 end
end

