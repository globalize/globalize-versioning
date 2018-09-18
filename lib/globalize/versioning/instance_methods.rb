module Globalize
  module Versioning
    module InstanceMethods
      def rollback
        translation_caches[::Globalize.locale] = translation.paper_trail.previous_version
      end
    end
  end
end
