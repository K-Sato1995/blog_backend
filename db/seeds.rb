CATEGORIES = %w(Ruby Javascript Go React Rails Others Life)
TAGS = %w(Git Gem Rspec Test Ruby Javascript Go)

2.times do |i|
  User.create(
    name: Faker::Name.name,
    status: i,
    email: 'a@example.com',
    password: '111111',
    password_confirmation: '111111'
  )
end

5.times do  |i|
  tags = []
  2.times { tags << Tag.find_or_create_by(name: TAGS[rand(0..6)]) }

  post = Post.new(
    title: Faker::Company.name,
    content: Faker::Lorem.paragraph(100),
    user_id: 1,
    image: 'https://random_url',
    status: 'published',
    category_name: CATEGORIES[i],
    introduction: Faker::Lorem.paragraph
  )
  post.tags << tags
  post.save!
end
