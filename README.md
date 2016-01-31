# TastyBreadcrumbs

Tasty gem for addint thumbnails into your application.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'tasty_breadcrumbs'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tasty_breadcrumbs

## Usage
Describe your breadcrumbs into controllers. Move all common items behind actions and all specific items into actions. For example, `books_controller.rb`
```ruby
class BooksController < ApplicationController
  add_tasty_breadcrumb 'Main', :root_path
  add_tasty_breadcrumb 'Books', :books_path

  def index # Main -> Books
    @books = Book.all
  end
  
  def show # Main -> Books -> Current book title
    @book = Book.find(params[:id])
    add_tasty_breadcrumb @book.title, book_path(@book)
  end
  ...
end
```
By default tasty_breadcrumbs uses bootstrap styles. As result, previous example for index page will be displayed as:
```html
<ol class="breadcrumb">
  <li>
    <a href="/">Main</a>
  </li>
  <li>
    <a href="/books">Books</a>
  </li>
  <li>Current book title</li>
</ol>
```
Of course you can add customize styles for thumbnail. Add follow lines into `application_controller.rb`:
```ruby
class BooksController < ApplicationController
  before_action do
    set_container_template "div.custom-breadcrumb" #for container
    set_simple_item_template   "a.breadcrumb-item" #for all elements into breadcrumbs except last
    set_last_item_template "a" #for last element into breadcrumbs
  end
  
  add_tasty_breadcrumb 'Main', :root_path
  add_tasty_breadcrumb 'Books', :books_path

  def index # Main -> Books
    @books = Book.all
  end
  
  def show # Main -> Books -> Current book title
    @book = Book.find(params[:id])
    add_tasty_breadcrumb @book.title, book_path(@book)
  end

end 
```

Now for show actions our html will be like this:

```html
  <div class="custom-breadcrumb">
    <a class="breadcrumb-item" href="/">Main</a>
    <a class="breadcrumb-item" href="/books">Books</a>
    <a href="/books/1"> Current books title </a>
  </div>
```

## Contributing

1. Fork it ( https://github.com/valexl/tasty_breadcrumbs/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
