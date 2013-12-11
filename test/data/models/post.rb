class Post < ActiveRecord::Base
  translates :title, :content, :published, :published_at, :versioning => true
end
