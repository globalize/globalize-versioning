module Globalize
  module Versioning
    autoload :PaperTrail, 'globalize/versioning/paper_trail'


    setup_globalize_versioning(options[:versioning]) if options[:versioning]

  end
end
