namespace :db do
  def create_admin_author
    Author.create_with(email: ENV['ADMIN_EMAIL'], password: ENV['ADMIN_PASSWORD']).find_or_create_by(name: ENV['ADMIN_NAME'])
  end

  task :migrate do
    create_admin_author
  end
end
