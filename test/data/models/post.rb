class Post < ActiveRecord::Base
  attribute :title
  translates :title, :versioning => :paper_trail
end
