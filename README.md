## Running the app
To see the code in action run the following command in the project root directory.

```
$ ruby sample.rb
```

## Running the tests
To see the tests in action run the following command in the project root directory.

```
$ rspec
```

_Note: A deprecation warning is seen. See below for more._

----

Ideally a `spec_helper.rb` file would be used and the `require 'rspec/autorun'` would be omitted. As a deprecation warning is given running the tests via the `rspec` command.
However the original task file had the require in place, and so it has been kept, and no `spec_helper.rb` has been used.
