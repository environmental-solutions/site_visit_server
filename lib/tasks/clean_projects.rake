namespace :site_visit do

  desc "Clean out Projects"
  task :clean_projects => [:environment] do
    begin
      Project.destroy_all
    end
  end

end

