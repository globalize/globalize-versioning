require 'globalize'

module Globalize::Versioning
  autoload :PaperTrail, 'globalize/versioning/paper_trail'
end

Globalize::ActiveRecord::ActMacro.module_eval do
  def setup_translates_with_versioning!(options)
    setup_translates_without_versioning!(options)
    if options[:versioning]
      ::ActiveRecord::Base.extend(Globalize::Versioning::PaperTrail)
      if options[:versioning].is_a?(Hash)
        translation_class.has_paper_trail(options[:versioning])
      else
        translation_class.has_paper_trail
      end
      delegate :version, :versions, :to => :translation
    end
  end
  alias_method_chain :setup_translates!, :versioning
end
