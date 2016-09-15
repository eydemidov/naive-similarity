# NaiveSimilarity

A gem for finding roughly similar items among others using cosine similarity.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'naive_similarity'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install naive_similarity

## Usage

NaiveSimilarity::similar(item, collection, keys)

E.g. `NaiveSimilarity::similar(arr[1], arr, :value1, :value2)`

Returns the collection sorted by similarity in descending order.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

