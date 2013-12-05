# Globalize Versioning

Globalize nicely integrates with
[paper_trail](https://github.com/airblade/paper_trail). To add versioning
support to your model, you'll want to add the `:versioning => true`
option to your call to <code>translates</code>.  An example from our test suite:

```ruby
translates :title, :content, :published, :published_at, :versioning => true
```

You will also need to have already generated the versions table that paper_trail
expects.  See the paper_trail README for more details.

If you are adding globalize to any previously versioned models, please note
that you will need to add a new `locale` column to your versioning table.

Also, please see the tests in `test/globalize/versioning_test.rb` for some
current gotchas.
