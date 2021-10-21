namespace :dev do
  DEFAULT_PASSWORD = "123456"

  desc "populate the database with some users"
  task setup: :environment do
    User.create! username: "Daniel Nottingham", email: "user@gmail.com", password: DEFAULT_PASSWORD
    10.times do |i|
      username = Faker::Name.name
      email = "user#{i}@gmail.com"
      password = DEFAULT_PASSWORD
      User.create!(username: username, email: email, password: password)
    end

    User.all.each do |user|
      rand(5..10).times do |i|
        Tweet.create!(comment: Faker::Lorem.paragraphs, user: user)
      end
    end
  end
end
