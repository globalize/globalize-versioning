class LegacyPost < ActiveRecord::Base
  self.table_name = :posts
  attribute :title
  translates :title, :versioning => true
end
