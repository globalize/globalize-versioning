require File.expand_path('../../test_helper', __FILE__)

class OptionsTest < MiniTest::Spec
  def setup
    @options_post_class = Class.new(OptionsPost)
  end

  it 'passes options to versioning gem' do
    Module.const_set('PostClass', @options_post_class)

    # options passed to paper_trail: :on => :update
    @options_post_class.class_eval do
      translates :title, :versioning => { :gem => :paper_trail, :options => { :on => [ :update ] } }
    end

    post = @options_post_class.create!(:title => 'title v1')
    assert_equal 0, post.translation.versions.length
    post.update_attributes! :title => 'title v2'
    assert_equal 1, post.translation.versions.length
  end
end
