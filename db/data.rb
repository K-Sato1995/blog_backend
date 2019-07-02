INTRO1 = 'A getter method is a method that gets a value of an instance variable.
Without a getter method, you can not retrieve a value of an instance variable outside the class the instance variable is instantiated from.'

CONTENT1 = "#What is a getter method?
 __A getter method__ is a method that ==gets== a value of an instance variable.
 Without a getter method, you can not retrieve a value of an instance variable outside the class the instance variable is instantiated from.

Here is an example.

```Ruby
class Movie
  def initialize(name)
    @name = name
  end
end

obj1 = Movie.new('Forrest Gump')
p obj1.name #=> undefined method `name' for #<Movie:0x007fecd08cb288 @name='Forrest Gump'> (NoMethodError)
```
 As you can see,  the value of  `obj1` (`name`) can not be retrieved outside `Movie` class. if you try to retrive a value of an instance variable outside its class without a getter method, Ruby raises [No Mothod Error](http://ruby-doc.org/core-2.5.0/NoMethodError.html).

 Now, Let's see how to retrieve the value of `obj1` outside `Movie` class with a getter method.
 All you have to do here is to define a `getter method` named `name` that only has an instance variable that you want to retrieve outside the class.  (It is common practice to have the getter method’s name match the instance variable’s name.)

```Ruby
 class Movie
  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

obj1 = Movie.new('Forrest Gump')
p obj1.name #=> 'Forrest Gump'
```

#What is a setter method?
 __A setter__ is a method that ==sets== a value of an instance variable.
 Without a setter method, you can not assign a value to an instance variable outside its class.
 if you try to set a value of an instance variable outside its class, Ruby rises  [No Method Error](http://ruby-doc.org/core-2.5.0/NoMethodError.html) just like it does when you try to retrieve a value of an instance variable outside its class without a getter method.

```Ruby
class Movie
  def initialize(name)
    @name = name
  end

  def name #getter method
    @name
  end
end

obj1 = Movie.new('Forrest Gump')
p obj1.name #=> 'Forrest Gump'
obj1.name = 'Fight Club' #=> undefined method `name=' for #<Movie:0x007f9937053368 @name='Forrest Gump'> (NoMethodError)
```
 Defining a setter method inside a class makes it possible to set a value of an instance variable outside the class.
 You can define a setter method like the code below.

```Ruby
 class Movie
  def initialize(name)
    @name = name
  end

  def name #getter method
    @name
  end

  def name=(name) #setter method
    @name = name
  end
end

obj1 = Movie.new('Forrest Gump')
p obj1.name #=> 'Forrest Gump'
obj1.name = 'Fight Club'
p obj1.name #=> Fight Club
```
By using `name=`, you can now assign a new value `Fight Club` to `obj1`.

#What are accessors?
 `Accessors` are a way to create getter and setter methods without explicitly defining them in a class.
 There are three types fo accessors in Ruby.

- `attr_reader` automatically generates a getter method for each given attribute.
- `attr_writer` automatically generates a setter method for each given attribute.
- `attr_accessor` automatically generates a getter and setter method for each given attribute.

 First, let's take a look at `attr_reader`!
 As you can see in the code below, `name` and `year` are retrieved outside `Movie` class even though there is no getter method for either of them. This is because `attr_reader` generates a getter method for each given attribute.

 ```Ruby
class Movie
  attr_reader :name, :year

  def initialize(name, year)
    @name = name
    @year = year
  end
end
obj1 = Movie.new('Forrest Gump', 1994)
p obj1.name #=> Forrest Gump
p obj1.year #=> 1994
```

 Second, let's see how `attr_writer` works!
 As I mentioned above, `attr_witer` generates for each given attribute. Therefore you can assign new values to `ob1` without writting a setter method for both `name` and `year`!

```Ruby
class Movie
  attr_reader :name, :year
  attr_writer :name, :year

  def initialize(name, year)
    @name = name
    @year = year
  end
end
obj1 = Movie.new('Forrest Gump', 1994)
obj1.name = 'Fight Club'
obj1.year = 1999
p obj1.name #=> Fight Club
p obj1.year #=> 1999
```
 Last but certainly not least, `attr_accessor` does what `attr_reader` and `attr_writer` do with just one line of code!

```Ruby
class Movie
  attr_accessor :name, :year

  def initialize(name, year)
    @name = name
    @year = year
  end
end
obj1 = Movie.new('Forrest Gump', 1994)
obj1.name = 'Fight Club'
obj1.year = 1999
p obj1.name #=> Fight Club
p obj1.year #=> 1999
```

#References
[How getter/setter methods work in Ruby](https://medium.com/@rondwalker22/how-getter-setter-methods-work-in-ruby-c5f5da07f99)
[What is attr_accessor in Ruby?]
(https://stackoverflow.com/questions/4370960/what-is-attr-accessor-in-ruby)
[rubylearning.com](http://rubylearning.com/satishtalim/ruby_syntactic_sugar.html)
"

INTRO2 = "Here is a simple guideline to create a simple API with RoR5. In this post, I'll create a simple blog like application that users can read, create, update and delete posts."

CONTENT2 = "#Overview
 Here is a simple guideline to create a simple API with RoR5. In this post, I'll create a simple blog like application that users can read, create, update and delete posts.

#Steps
1. Create the application with `rails new --api` command.

2. Create the controller and model for `Post`.

3. Set up `Routes` with `namespaces`.

4. Set up the `Post controller`.

#Create the application
 You can make an API-only RoR application by just putting `--api` at the end of `rails new` command.

```console
$ rails new blog --api
```
#Create the controller and model for Post
 You can generate the `Post Controller` and `Post Model` by running commands below.

```console
$ rails g model post title:string
$ rails g controller posts
$ rake db:migrate
```

#Set up Routes with namespaces
 `namespaces` enable you to easily control the version of your API.

```Ruby
Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :posts
    end
  end
end
```

 The code above creates routes like this. (You can check the routes of your application with `rake routes` command.)

```console
api_v1_posts GET    /api/v1/posts(.:format)     api/v1/posts#index
             POST   /api/v1/posts(.:format)     api/v1/posts#create
 api_v1_post GET    /api/v1/posts/:id(.:format) api/v1/posts#show
             PATCH  /api/v1/posts/:id(.:format) api/v1/posts#update
             PUT    /api/v1/posts/:id(.:format) api/v1/posts#update
             DELETE /api/v1/posts/:id(.:format) api/v1/posts#destroy
```

#Set up the Post controller.
 Create the `api` and `v1` directory under your _controllers directory_. Your _controllers directory_ should look like this.

```Ruby
---- controllers

      --- api

        -- v1

         - posts_controller.rb
```

 Create methods for reading, creating, updating and deleting objects with `ajax request` like the code below.

```Ruby
module Api
  module V1
    class PostsController < ApplicationController
      def index
        posts = Post.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'loaded posts', data: posts }, status: :ok
      end

      def show
        post = Post.find(params[:id])
        render json: { status: 'SUCCESS', message: 'loaded the post', data: post }, status: :ok
      end

      def create
        post = Post.new(post_params)
        if post.save
          render json: { status: 'SUCCESS', message: 'loaded the post', data: post }, status: :ok
        else
          render json: { status: 'ERROR', message: 'post not saved', data: post.errors }, status: :error
        end
      end

      def destroy
        post = Post.find(params[:id])
        post.destroy
        render json: { status: 'SUCCESS', message: 'deleted the post', data: post }, status: :ok
      end

      def update
        post = Post.find(params[:id])
        if post.update(post_params)
          render json: { status: 'SUCCESS', message: 'updated the post', data: post }, status: :ok
        else
          render json: { status: 'SUCCESS', message: 'loaded the post', data: post }, status: :ok
        end
      end

      private

      def post_params
        params.require(:post).permit(:title)
      end
    end
  end
end
```

You can use [Postman](https://www.getpostman.com/) to check if your api is working correctly."

INTRO3 = "RSpec is a Behaviour-Driven Development tool for Ruby programmers. `BDD` is an approach to software development that combines Test-Driven Development, Domain Driven Design, and Acceptance Test-Driven Planning. "
CONTENT3 = "#What is Rspec?
RSpec is a Behaviour-Driven Development tool for Ruby programmers. `BDD` is an approach to software development that combines Test-Driven Development, Domain Driven Design, and Acceptance Test-Driven Planning.

#How to install Rspec on your RoR applications?
 You have to add `rspec-rails` to both the `:development` and `:test` groups in the Gemfile.

```ruby
group :develop, :test do
   gem 'rspec-rails'
end
```

You can download and install it by running the line below.

```console
$ bunlde install
```

To initialize `spec/` directory(where specs will reside), You can do so by running the line below.

```console
$ rails g rspec:install
```

This adds the following files which are used for configuration.

- `.rspec`
- `spec/spec_helper.rb`
-  `spec/rails_helper.rb`

 You can run your specs (execute spec files) by running `rspec` command.

```console
$ bundle exec rspec
```
By default the above will run all ` _spec.rb` files in the spec directory.
You can also run only a subset of these specs by specifying the file path like the example below.

```console
# Run only model specs
$ bundle exec rspec spec/models

# Run only specs for PostController
$ bundle exec rspec spec/controllers/posts_controller_spec.rb

#Run only spec on line 8 of PostController
$ bundle exec rspec spec/controllers/posts_controller_spec.rb:8
```
If you want to use classes that are defined in your application, don't forget to add `require 'rails_helper'` to each file.

```Ruby
require 'rails_helper'

describe 'Post' do
  it 'tests type matchers' do
    ins = Post.create(title: 'title', content: 'content')
  end
end
````

#Basic Structure
 To show the basic structure of Rspec with real examples, I created a simple CRUD RoR application with `scaffold` command. You can create the same application by running the code below.

```console
$ rails g scaffold Post title:string content:text
```

##Describe
 The word `describe` is used to define an `Example Group` which is the Rspec way of saying a collection of tests. `describe` takes a class name and/or string argument. You can define an `Example Group` like the code below.

```Ruby
describe Post do
  #tests
end
```

##It
 The word `it` is another RSpec keyword which is used to define an `Example`. An example is basically a test or a test case. You can define an `Example` like the code below.

```Ruby
describe Post do
  it 'test case' do
    #test content
  end
end
```

##Expect & to/not_to
 The `expect` keyword is used to define an `Expectation` in Rspec.  The `to` keyword is also used as part of `expect` statements. You can also use `not_to` keyword when you want the expectation to be false.

```Ruby
describe 'Post' do
  it 'test case' do
    value = 1
    expect(value).to eq(1)
  end
end
```

`eq` keyword is one of Rspec [matchers](https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers) . Each matcher can be used with `expect(..).to` or `expect(..).not_to` to define positive and negative expectations
respectively on an object.

#Context
 The `content` keyword is just an alias method of `describe` that means there is no functional difference between these two methods. However, there is a contentual difference that makes your tests more understandable by using both of them.
 Generally speaking, `describe` is used to separate sets of tests based on methods or behavior that are being tested, whereas `content` is used to separate specs based on conditions.


```Ruby
describe 'Post' do

  content 'name == Jim' do
    #tests
  end

  content 'name == John' do
    #tests
  end

end
```

#Matchers
 We used a matcher `eq` in the above example. Here, I will introduce other types of matchers. Built-in matchers are listed [here](https://relishapp.com/rspec/rspec-expectations/docs/built-in-matchers).

##Equality matchers
 Ruby exposes several different methods for handling equality.

```Ruby
require 'rails_helper'

describe 'Post' do
  it 'tests equality matchers' do
    a = 'value'
    b = 'value'
    expect(a).not_to equal(b) # object identity - a and b refer to the same object
    expect(a).to eql(b) # object equivalence - a and b have the same value
    expect(a).to be == b # object equivalence - a and b have the same value with type conversions
  end
end
```

##Comparison matchers
 RSpec provides a number of matchers that are based on Ruby's built-in operators. These can be used for generalized comparison of values. I'll introduce some of many matchers that I frequently use. For further information regarding this topic, check [Relish](https://relishapp.com/rspec/rspec-expectations/v/3-8/docs/built-in-matchers/comparison-matchers).

```Ruby
require 'rails_helper'

describe 'Post' do
  it 'tests comparison matchers' do
    a = 1
    b = 2
    expect(a).to be > 0
    expect(a).to be < b
    expect(a).to be >= 0
    expect(a).to be <= b
    expect(a).to be == 1
  end
end
```

##Predicate matchers
 Ruby objects commonly provide predicate methods like `zero?`, `empty?` and `has_key?`.  You can use those methods in Rspec by Simply prefixing the method with `be_` and remove the question mark.

```Ruby
require 'rails_helper'

describe 'Post' do
  it 'tests predicate matchers' do
    a = 1
    arry = []
    hash = { key: 'value' }
    expect(a).not_to be_zero
    expect(arry).to be_empty
    expect(hash).to have_key(:key)
  end
end
```

##Type matchers
 You can test  the type or class of objects in Rspec by using `be_kind_of()`, `be_instance_of()`.

```Ruby
require 'rails_helper'

describe 'Post' do
  it 'tests type matchers' do
    str = 'string'
    ins = Post.create(title: 'title', content: 'content')
    expect(str).to be_kind_of(String) # same as expect(obj).to be_kind_of(type)
    expect(str).to be_a_kind_of(String) # same as expect(obj).to be_kind_of(type)
    expect(str).to be_a(String) # same as expect(obj).to be_kind_of(type)
    expect(str).to be_an(String) # same as expect(obj).to be_kind_of(type)

    expect(ins).to be_instance_of(Post)
    expect(ins).to be_an_instance_of(Post)  # same as expect(obj).to be_instance_of(type)
  end
end
```

##Be matchers
 There are several related `be matchers`.

```Ruby
require 'rails_helper'

describe 'Post' do
  it 'tests be matchers' do
    obj1 = true
    obj2 = false
    obj3 = nil
    expect(obj1).to be_truthy
    expect(obj1).to be #It is the same as be_truthy
    expect(obj2).to be_falsey
    expect(obj3).to be_nil
  end
end
```

#Include matchers
 You can use the `include matcher` to specify that a collection includes one or more expected objects.

```Ruby
require 'rails_helper'

describe 'Post' do
  it 'tests include matchers' do
    str = 'String'
    arr = [0,1,2]

    expect(str).to include('S')
    expect(str).to include('St', 'r')
    expect(str).not_to include('A')

    expect(arr).to include(0)
    expect(arr).to include(0, 1)
    expect(arr).not_to include(9)
    expect(arr).to include(be_odd.and be < 10)
    expect(arr).to include(a_kind_of(Integer))
  end
end
```

##Expect error
 Expect a pros to raise error when it is called.

```Ruby
describe 'Post' do
  it 'tests respond_to matchers' do
    str = 'String'
    expect(str).to respond_to(:split)
    expect(str).to respond_to(:to_i, :to_sym)
  end
end
```

More matchers are listed on [Relish](https://relishapp.com/rspec/rspec-expectations/v/3-8/docs/built-in-matchers).

"
