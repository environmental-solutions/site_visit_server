namespace :site_visit do

  desc "show environment details"
  task :show_env => [:environment] do
    begin
      puts "db name: #{ENV["DB_NAME"]}"
      puts "db user: #{ENV["DB_USER"]}"
      puts "db host: #{ENV["DB_HOST"]}"
      puts "cors: #{ENV["CORS_ORIGIN"]}"
      puts "cors: #{ENV["CORS_ORIGIN2"]}"
    end
  end

end

