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
  image: 'https://images.pexels.com/photos/1536608/pexels-photo-1536608.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  user_id: 1,
  status: 'published',
  category_name: 'Ruby'
)


Post.create(
  title: 'Build a simple API using RoR5',
  intro: INTRO2,
  context: CONTEXT2,
  image: 'https://images.pexels.com/photos/1367170/pexels-photo-1367170.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  user_id: 1,
  status: 'published',
  category_name: 'Ruby'
)

Post.create(
  title:'Rspec Basics ①',
  intro: INTRO3,
  context: CONTEXT3,
  user_id: 1,
  image: 'https://images.pexels.com/photos/1547727/pexels-photo-1547727.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
  status: 'published',
  category_name:'Ruby'
)
