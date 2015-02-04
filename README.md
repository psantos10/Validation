###Validation

[![Code Climate](https://codeclimate.com/github/Resize/Validation/badges/gpa.svg)](https://codeclimate.com/github/Resize/Validation)
[![Test Coverage](https://codeclimate.com/github/Resize/Validation/badges/coverage.svg)](https://codeclimate.com/github/Resize/Validation)

An extensive pack of customizable and extensible validation to your objects.

###Installation

```shell
$ gem install resize-validation
```

```shell
$ require 'resize-validation'
```

###Usage

A minimal implementation could be:

```ruby
Resize::Validation::validate(email: 'londerson@gmail.com')
 # => true
 ```
 ```ruby
Resize::Validation::validate(string: 5)
 # => false
 ```
raise custom exception:

 ```ruby
Resize::Validation::validate!(integer: 'five')
 # => "The input five does not match the rule integer (TypeError)"
```

A composable implementation could be:

```ruby
  Resize::Validation::validates do |v|
    v.validate(integer: 5)
    v.validate(uppercase: "NAME")
    v.validate(boolean: false)
  end
  # => true
```
```ruby
  Resize::Validation::validates do |v|
    v.validate(integer: "5")
    v.validate(uppercase: "NAME")
    v.validate(boolean: false)
  end
  # => false
```
Catching errors:

```ruby
  Resize::Validation::validates! do |v|
    v.validate(integer: 5)
    v.validate(uppercase: "NAME")
    v.validate(boolean: false)
  end
  # => {:status=>true, :errors=>[]}
```

```ruby
  Resize::Validation::validates! do |v|
    v.validate(integer: "5")
    v.validate(uppercase: "NAME")
    v.validate(boolean: false)
  end
  # => {:status=>false, :errors=>["The input 5 does not match the rule integer"]}
```

Rules
-----

### Numeric

* [is_boolean](https://github.com/Resize/Validation/blob/master/lib/resize/rules/is_boolean.rb "Title")
* [is_positive](https://github.com/Resize/Validation/blob/master/lib/resize/rules/is_positive.rb "Title")
* [is_negative](https://github.com/Resize/Validation/blob/master/lib/resize/rules/is_negative.rb "Title")
* [is_multiple](https://github.com/Resize/Validation/blob/master/lib/resize/rules/is_multiple.rb "Title")
* [is_integer](https://github.com/Resize/Validation/blob/master/lib/resize/rules/is_integer.rb "Title")

### Date

* [is_date](https://github.com/Resize/Validation/blob/master/lib/resize/rules/is_date.rb "Title")

### Types

* [is_string](https://github.com/Resize/Validation/blob/master/lib/resize/rules/is_string.rb "Title")

### Strings

* [is_empty](https://github.com/Resize/Validation/blob/master/lib/resize/rules/is_empty.rb "Title")
* [is_downcase](https://github.com/Resize/Validation/blob/master/lib/resize/rules/is_downcase.rb "Title")
* [is_uppercase](https://github.com/Resize/Validation/blob/master/lib/resize/rules/is_uppercase.rb "Title")

### Others

* [is_email](https://github.com/Resize/Validation/blob/master/lib/resize/rules/is_email.rb "Title")
* [is_json](https://github.com/Resize/Validation/blob/master/lib/resize/rules/is_json.rb "Title")
* [is_rg](https://github.com/Resize/Validation/blob/master/lib/resize/rules/is_rg.rb "Title")
* [is_domain](https://github.com/Resize/Validation/blob/master/lib/resize/rules/is_uppercase.rb "Title")
* [is_equals](https://github.com/Resize/Validation/blob/master/lib/resize/rules/is_equals.rb "Title")
* [is_contains](https://github.com/Resize/Validation/blob/master/lib/resize/rules/is_contains.rb "Title")

###Contributing

1. Fork it ( https://github.com/Resize/Validation/fork )
2. Create your feature branch (`git checkout -b new_feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin new_feature`)
5. Create a new Pull Request

###License

Copyright © 2014 Londerson Araújo, released under the MIT license
