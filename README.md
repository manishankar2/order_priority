# Orderpriority

A Simple way to Prioritize Active Record Ordering, by giving a simple key value pair input ,also maintaining Order Method Chain.

# Usage

```
user = User.all

user.priority_order(first_name: "Bruce Wayne", type: "super_hero")

```
The priority is followed in the order in which input is given.

The gem also maintains existing order Method chaining.

```
user.priority_order({"first_name" => "Clark Kent"}).order("first_name")

```

The above snippet will give Results in the following Order

- Clark Kent
- Alan Scott
- Bruce Wayne
- Peter Parker
- Tony Stark

## Installation

Add this line to your application's Gemfile:

gem 'orderpriority'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install orderpriority

## Usage

TODO: Write usage instructions here

## Contributing

1. Fork it ( https://github.com/[my-github-username]/orderpriority/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
