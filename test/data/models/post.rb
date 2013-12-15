class Post < ActiveRecord::Base
  translates :title, :versioning => :paper_trail
end
