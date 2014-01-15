class Venue < ActiveRecord::Base
  if ENV['RAILS_3']
    attr_accessible :description, :name
  end
  translates :description, :versioning => :paper_trail
  has_paper_trail :on => [:update, :destroy], :ignore => [:created_at, :updated_at]
end
