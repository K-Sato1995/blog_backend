#USER
User.create(name: 'Admin_User',
            status: 0,
            email: 'a@example.com',
            password: '111111',
            password_confirmation: '111111')

User.create(name: 'Sub_Admin_User',
            status: 1,
            email: 'sa@example.com',
            password: '111111',
            password_confirmation: '111111')

#POST
Post.create(title: 'Title1',
            context: "#概要
Rubyの「ゲッター」・「セッター」とは何か？
また同じ動作をより簡単に行うアクセスメソッドについてまとめました。

#「ゲッター」とは？
インスタンス変数をクラス内から参照するメソッドが**「ゲッター」**です。
本来Rubyではインスタンス変数の値はクラス内からしか取得出来ません。
そこで、それを可能にする為にクラス内にインスタンス変数を参照する専用のメソッド**「ゲッター」**を定義します。


_例えば、通常では以下のMovieクラスからインスタンス変数の直接的な参照はできません。_

```ruby
class Movie
  def initialize(name)
    @name = name
  end
end

obj1 = Movie.new('Forrest Gump')

p obj1.name #=>undefined method `name' for #<Movie:0x00007fd4558526f0 @name='Forrest Gump'>
```

これを参照するためにはクラス内にインスタンス変数を参照するメソッド**「ゲッター」**を定義する必要があります。以下の例ではメソッド`Movie#getName`が**「ゲッター」**です。
これでインスタンス変数をクラス外で参照することができます。

```ruby
class Movie
  def initialize(name)
    @name = name
  end

  def getName #「ゲッター」
    @name
  end
end

obj1 = Movie.new('Forrest Gump')

p obj1.getName #=> 'Forrest Gump'
```

#「セッター」とは？
インスタンス変数をクラス内で更新するメソッドが**「セッター」**です。
参照同様、インスタンス変数の更新もクラス内でしかできません。
そこで、それを可能にする為にクラス内にインスタンス変数の内容を更新する専用のメソッド**「セッター」**を定義します。

_例えば、通常では以下のMovieクラスからインスタンス変数の直接的な変更はできません。_

```ruby
class Movie
  def initialize(name)
    @name = name
  end
end

obj1 = Movie.new('Forrest Gump')

p obj1.name = 'Fight Club' #=>undefined method `name=' for #<Movie:0x00007ffd4a83b400 @name='Forrest Gump'> (NoMethodError)
```

このような更新を実行するためにはクラス内にインスタンス変数を更新するメソッド**「セッター」**を定義する必要があります。以下の例ではメソッド`Movie#changeName`が**「セッター」**です。
これでインスタンス変数をクラス外で更新することができます。

```ruby
class Movie
  def initialize(name)
    @name = name
  end

  def getName #「ゲッター」
    @name
  end

  def changeName=(name) #「セッター」
    @name = name
  end
end

obj1 = Movie.new('Forrest Gump')
obj1.changeName = 'Fight Club'
p obj1.getName #=> 'Fight Club'
```

#アクセスメソッドとは？
「アクセスメソッド」とは上記の**「ゲッター」**・**「セッター」**を定義せずともインスタンス変数の参照・更新を可能にする方法です。
３種類の「アクセスメソッド」が存在します。

|定義式|機能|
|---|---|
|attr_reader: 変数名|参照を可能にする。（**「ゲッター」**と同じ役割）|
|attr_writter: 変数名|更新を可能にする。（**「セッター」**と同じ役割）|
|attr_accessor: 変数名|参照・更新の両方を可能にする。（**「セッター」**・**「ゲッター」**と同じ役割）|

_例えばクラス内に「attr_reader」を追加することで**「ゲッター」**と同じ役割を果たします。（インスタンス変数のクラス外からの参照を可能にする。）_

```ruby
class Movie
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

obj1 = Movie.new('Forrest Gump')
p obj1.name #=> 'Forrest Gump'
```
_またクラス内に「attr_writer」を追加することで**「セッター」**と同じ役割を果たします。（インスタンス変数のクラス外からの更新を可能にする。）_

```ruby
class Movie
  attr_reader :name
  attr_writer :name
  def initialize(name)
    @name = name
  end
end

obj1 = Movie.new('Forrest Gump')
obj1.name = 'Fight Club'
p obj1.name #=> 'Fight Club'
```

_また、「attr_accessor 」を追加することで**「セッター」**・**「ゲッター」**両方の役割を果たします（インスタンス変数のクラス外からの参照・更新を可能にする。）。_

```ruby
class Movie
  attr_accessor :name
  def initialize(name)
    @name = name
  end
end

obj1 = Movie.new('Forrest Gump')
obj1.name = 'Fight Club'
p obj1.name #=> 'Fight Club'
```
",
image: 'https://images.pexels.com/photos/842948/pexels-photo-842948.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260',
user_id: 1,
status: 'published',
category_name: 'Ruby')


Post.create(title: 'Title1',
            context: "
#パッケージ
Goのプログラムは`package`によって成り立っています。
`import`内に必要な`package`を明示します。

```Golang
package main

import (
	'fmt'
	'math/rand'
)

func main() {
  fmt.Println('My favorite number is', rand.Intn(10)) // => My favorite number is 1
}

```",
image: 'https://images.pexels.com/photos/747964/pexels-photo-747964.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940',
user_id: 1,
status: 'published',
category_name: 'Go')
