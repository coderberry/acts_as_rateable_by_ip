class ActsAsRateableByIpGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.directory 'app/models'
      m.file 'rating.rb', 'app/models/rating.rb'
      m.migration_template "create_ratings.rb", "db/migrate"
    end
  end

  def file_name
    "create_ratings"
  end
end
