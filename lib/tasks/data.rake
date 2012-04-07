namespace :wallet do
  task :add_auth_token => :environment do
    User.all.each do |user|
      unless user.auth_token
        user.generate_token(:auth_token)
        user.save
        puts "Generated token for #{user.username}"
      end
    end
  end
end
