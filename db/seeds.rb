User.create!(name:  "duyhung",
             email: "hung@123.com",
             password:              "123123",
             password_confirmation: "123123")

20.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end

users = User.order(:created_at).take(6)
10.times do
  title = Faker::Lorem.word
  content = Faker::Lorem.sentence(5)
  users.each { |user| user.entries.create!(title: title, content: content) }
end

# Following relationships
users = User.all
user  = users.first
following = users[2..15]
followers = users[3..20]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
