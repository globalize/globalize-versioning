require 'paper_trail'

module Globalize
  module Versioning
    module PaperTrail
      # At present this isn't used but we may use something similar in paper trail
      # shortly, so leaving it around to reference easily.
      #def versioned_columns
        #super + self.class.translated_attribute_names
      #end
    end
  end
end

ActiveRecord::Base.class_eval do
  class << self
    def has_paper_trail_with_globalize(*args)
      has_paper_trail_without_globalize(*args)
      include Globalize::Versioning::PaperTrail
    end
    alias_method :has_paper_trail_without_globalize, :has_paper_trail
    alias_method :has_paper_trail, :has_paper_trail_with_globalize
  end
end

# to handle different versions of paper_trail
version_class = PaperTrail::VERSION.is_a?(String) ? Version : PaperTrail::Version

version_class.class_eval do

  before_save do |version|
    version.locale = Globalize.locale.to_s
  end

  def self.for_this_locale
    where :locale => Globalize.locale.to_s
  end

  def sibling_versions_with_locales
    sibling_versions_without_locales.for_this_locale
  end
  alias_method :sibling_versions_without_locales, :sibling_versions
  alias_method :sibling_versions, :sibling_versions_with_locales
end
