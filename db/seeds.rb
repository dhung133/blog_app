User.create!(name:  "duyhung",
             email: "hung@123.com",
             password:              "123123",
             password_confirmation: "123123")

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
50.times do
  title = Faker::Lorem.words(2)
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.entries.create!(title: title, content: content) }
end
