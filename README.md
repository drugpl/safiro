safiro ![safiro](http://img692.imageshack.us/img692/1622/szafir.png)
======

Description goes here.

Hooks
=====

You can use simple hooks with safiro. Just include **Safiro::Hooks** and implement *before_method* and *after_method* functions.

```ruby
class ExampleClass
  include Safiro::Hooks
  
  def self.before_method(method_name, locals)
    # logic
    puts method_name, locals
  end

  def self.after_method(method_name, locals)
    # logic
    puts method_name, locals
  end

  def method(args)
    puts args
    args = "bye"
    puts args
  end
end
```

You can create instance of ExampleClass and execute.

```ruby
instance = ExampleClass.new
instance.method("hello")

# => :method, {:args => "hello"}
# => "hello"
# => "bye"
# => :method, {:args => "bye"}
```

Contributing to safiro
======================
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

Copyright
=========

Copyright (c) 2012 Piotr Niełacny. See LICENSE.txt for
further details.

