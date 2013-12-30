require File.expand_path('../../test_helper', __FILE__)

class VersioningTest < MiniTest::Spec

  it "creates only one version when created" do
    post = Post.create!(:title => 'title v1')
    assert_equal 1, post.translation.versions.length
  end

  it "versions are scoped to the current Globalize locale" do
    post = Post.create!(:title => 'title v1')

    post.update_attributes!(:title => 'title v2')
    # Creates a 'created' version, and the update
    assert_equal %w[en en], post.translation.versions.map(&:locale)

    Globalize.with_locale(:de) {
      post.update_attributes!(:title => 'Titel v1')
      assert_equal %w[de], post.translation.versions.map(&:locale)
    }

    post.translation.versions.reset # hrmmm.
    assert_equal %w[en en], post.translation.versions.map(&:locale)
  end

  it "only reverts changes to the current locale when reverting to an earlier version" do
    post = Post.create!(:title => 'title v1')
    post.update_attributes!(:title => 'title v2')
    post.update_attributes!(:title => 'Titel v1', :locale => :de)
    post.update_attributes!(:title => 'title v3')

    # Roll back 2 versions in default locale
    post.rollback
    post.rollback

    assert_equal 'title v1', post.title(:en)
    assert_equal 'Titel v1', post.title(:de)
  end

  it "only reverts in the current locale" do
    post = Post.create!(:title => 'title v1')

    with_locale(:en) do
      post.update_attributes!(:title => 'updated title in English')
    end

    with_locale(:de) do
      post.update_attributes!(:title => 'updated title in German')
    end

    with_locale(:en) do
      post.update_attributes!(:title => 'updated title in English, v2')
    end

    with_locale(:de) do
      post.update_attributes!(:title => 'updated title in German, v2')
    end

    with_locale(:en) do
      post.rollback
      assert_equal 'updated title in English', post.title

      post.rollback
      assert_equal 'title v1', post.title
    end

    with_locale(:de) do
      post.rollback
      assert_equal 'updated title in German', post.title
    end

    with_locale(:en) do
      assert_equal 'title v1', post.title
    end
  end
end
