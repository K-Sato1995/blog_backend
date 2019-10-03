CATEGORIES = %w[Ruby Javascript Go React Rails Others Life].freeze
TAGS = %w[Git Gem Rspec Test Ruby Javascript Go].freeze

Author.create(name:'test', email:'test@email.com', password:'000000')


5.times do |i|
  tags = []
  2.times { tags << Tag.find_or_create_by(name: TAGS[rand(0..6)]) }

  post = Post.new(
    title: Faker::Company.name,
    content: Faker::Lorem.paragraph(100),
    author_id: 1,
    image: 'https://random_url',
    status: 'published',
    category_name: CATEGORIES[i],
    introduction: Faker::Lorem.paragraph
  )
  post.tags << tags
  post.save!
end
