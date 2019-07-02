CATEGORIES = %w(Ruby, Javascript Go React Rails Others Life)
TAGS = %w(Git Gem Rspec Test Ruby Javascript Go)

2.times do |i|
  User.create(
    name: Faker::Name.name,
    status: i,
    email: Faker::Internet.email,
    password: '111111',
    password_confirmation: '111111'
  )
end

5.times do  |i|
  tags = []
  2.times { tags << Tag.create(name: TAGS[rand(0..6)]) }

  post = Post.new.tap do |post|
    post.title = Faker::Company.name,
    post.content = Faker::Lorem.paragraph,
    post.user_id = 1,
    post.image = 'https://random_url',
    post.status = 'published',
    post.category_name = CATEGORIES[i],
    post.introduction = Faker::Lorem.paragraph
  end
  post.tags << tags
  post.save!
end
