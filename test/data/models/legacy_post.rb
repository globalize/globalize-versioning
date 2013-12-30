class LegacyPost < ActiveRecord::Base
  self.table_name = :posts
  translates :title, :versioning => true
end
