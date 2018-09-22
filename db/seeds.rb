require_relative 'data'
#USER
User.create(
  name: 'Admin_User',
  status: 0,
  email: 'a@example.com',
  password: '111111',
  password_confirmation: '111111'
)

User.create(
  name: 'Sub_Admin_User',
  status: 1,
  email: 'sa@example.com',
  password: '111111',
  password_confirmation: '111111'
)
#POST
Post.create(
  title: 'Ruby Getters and Setters',
  intro: INTRO1,
  context: CONTEXT1,
  image: 'https://cmkt-image-prd.global.ssl.fastly.net/0.1.0/ps/2075055/580/386/m1/fpnw/wm0/ruby_cm-.jpg?1483032261&s=afa1a38a44f95d948272c9dbda1d5f68',
  user_id: 1,
  status: 'published',
  category_name: 'Ruby'
)


Post.create(
  title: 'Build a simple API using RoR5',
  intro: INTRO2,
  context: CONTEXT2,
  image: 'https://avatars.githubusercontent.com/u/4223',
  user_id: 1,
  status: 'published',
  category_name: 'Ruby'
)

Post.create(
  title:'Rspec Basics ①',
  intro: INTRO3,
  context: CONTEXT3,
  user_id: 1,
  image: 'https://cdn-images-1.medium.com/max/432/1*84EvL-QjLpa2jB5J2-N8SQ.png',
  status: 'published',
  category_name:'Ruby'
)
